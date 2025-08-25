// Copyright 2021 Howard Lau
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package riscv

import scala.util.Random
import scala.util.control.Breaks._
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import peripheral.{Memory, ROMLoader, DummyMaster, DummySlave}
import bus.{AXI4LiteMaster, AXI4LiteMasterBundle, AXI4LiteSlave, AXI4LiteSlaveBundle}


// =======================================
//  Common Functions for Flexible tests
// =======================================

object FlexibleTestHelper {
  def init_write_transaction(bundle:AXI4LiteMasterBundle, clk: Clock, address: UInt, data: UInt, strobe: UInt) = {
    bundle.read.poke(false.B)
    bundle.write.poke(true.B)
    bundle.address.poke(address)
    bundle.write_data.poke(data)
    for (i <- 0 until 4) bundle.write_strobe(i).poke(strobe(i))
    clk.step()  // this cycle is not counted into transaction 
    bundle.write.poke(false.B)
    bundle.address.poke(0.U)
    bundle.write_data.poke(0.U)
  }

  def init_read_transaction(bundle:AXI4LiteMasterBundle, clk: Clock, address: UInt) = {
    bundle.read.poke(true.B)
    bundle.write.poke(false.B)
    bundle.address.poke(address)
    clk.step()  // this cycle is not counted into transaction
    bundle.read.poke(false.B)
    bundle.address.poke(0.U)
  }
}



class TimerTest extends AnyFlatSpec with ChiselScalatestTester {
  class TestTimerLimit extends Module {
    val io = IO(new Bundle {
      val limit = Output(UInt())
      val bundle = new AXI4LiteMasterBundle(Parameters.AddrBits, Parameters.DataBits)
    })
    val timer = Module(new peripheral.Timer)
    val master = Module(new AXI4LiteMaster(Parameters.AddrBits, Parameters.DataBits))
    io.limit := timer.io.debug_limit
    master.io.bundle <> io.bundle
    timer.io.channels <> master.io.channels
  }

  behavior of "Timer"
  it should "read and write the limit" in {
    test(new TestTimerLimit).withAnnotations(TestAnnotations.annos) { c =>
      var (write_success, read_success) = (false, false)

      // -----------------------------
      // initiate a write transaction to timer limit
      FlexibleTestHelper.init_write_transaction(c.io.bundle, c.clock, 0x4.U, 0x990315.U, 0xF.U)

      // check correct write
      breakable {for (i <- 1 until 20) {
        if (c.io.bundle.write_valid.peekBoolean()) {
          c.io.limit.expect(0x990315.U)
          write_success = true
          break()
        }
        c.io.bundle.busy.expect(true.B)
        c.clock.step()
      }}

      c.clock.step(2)
      c.io.bundle.busy.expect(false.B)  // master should be available soon after transaction
      if (!write_success) throw new Exception("Timer write test failed")

      // -----------------------------
      // initiate a read transaction to timer limit
      FlexibleTestHelper.init_read_transaction(c.io.bundle, c.clock, 0x4.U)

      // check correct read
      breakable { for (i <- 1 until 20) {
        if (c.io.bundle.read_valid.peekBoolean()) {
          c.io.bundle.read_data.expect(0x990315.U)
          read_success = true
          break()
        }
        c.io.bundle.busy.expect(true.B)
        c.clock.step()
      }}

      c.clock.step(2)
      c.io.bundle.busy.expect(false.B)  // master should be available soon after transaction
      if (!read_success) throw new Exception("Timer read test failed")

      println("Timer test passed")
    }
  }
}


class MemoryTestF extends AnyFlatSpec with ChiselScalatestTester {
  class MemoryTest extends Module {
    val io = IO(new Bundle {
      val bundle = new AXI4LiteMasterBundle(Parameters.AddrBits, Parameters.DataBits)

      val write_strobe = Input(UInt(4.W))
    })
    val memory = Module(new Memory(4096))
    val master = Module(new AXI4LiteMaster(Parameters.AddrBits, Parameters.DataBits))

    master.io.bundle <> io.bundle
    master.io.bundle.write_strobe := VecInit(io.write_strobe.asBools)
    master.io.channels <> memory.io.channels
    memory.io.debug_read_address := 0.U
  }

  behavior of "Memory"
  it should "perform read and write" in {
    test(new MemoryTest).withAnnotations(TestAnnotations.annos) { c =>
      var (write_success, read_success) = (false, false)

      // -------------------------
      // initiate write transaction
      FlexibleTestHelper.init_write_transaction(c.io.bundle, c.clock, 0x4.U, 0xDEADBEEFL.U, 0xF.U)

      breakable { for (i <- 1 until 20) {
        if (c.io.bundle.write_valid.peekBoolean()) {
          write_success = true
          break()
        }
        c.io.bundle.busy.expect(true.B)
        c.clock.step()
      }}

      c.clock.step(2)
      c.io.bundle.busy.expect(false.B)  // master should be available soon after transaction
      if (!write_success) throw new Exception("Memory write test failed")

      // ------------------------
      // initialte read transaction
      FlexibleTestHelper.init_read_transaction(c.io.bundle, c.clock, 0x4.U)

      breakable { for (i <- 1 until 20) {
        if (c.io.bundle.read_valid.peekBoolean()) {
          c.io.bundle.read_data.expect(0xDEADBEEFL.U)
          read_success = true
          break()
        }
        c.io.bundle.busy.expect(true.B)
        c.clock.step()
      }}

      c.clock.step()
      c.io.bundle.busy.expect(false.B)
      if (!read_success) throw new Exception("Memory read test failed")

      println("Memory test passed")
    }
  }

}


class ROMLoaderTestF extends AnyFlatSpec with ChiselScalatestTester {
  /* 
                                                                                     
                          ┌──────────────────────────────────┐                   
                          │             ROMLoader            │     ┌───────────┐ 
                          │                                  │     │   Memory  │ 
 ┌──────────────────┐     ├───────────┐              ┌───────┤     │           │ 
 │                  ◄─────┼─rom_addr  │              │       │ AXI ├────────┐  │ 
 │ Instruction ROM  │     │           │              │ master┼─────► slave  │  │ 
 │                  ┼─────┼►rom_data  ├◄────────────►│       │     │        │  │ 
 └──────────────────┘     ├───────────┘              └───────┤     ├──┬─────┘  │ 
                          │                                  │     │  │        │ 
                          │                                  │     └──┼────────┘ 
                          └──────────────────────────────────┘        │          
                                                                      ▼          
                                                                   ROM contents                                                                                                                                                           
   */

  class ROMLoaderTest extends Module {
    val io = IO(new Bundle {
      val rom_address = Output(UInt(32.W))
      val load_start = Input(Bool())
      val load_address = Input(UInt(32.W))
      val load_finished = Output(Bool())

      val slave_bundle = new AXI4LiteSlaveBundle(32, 32)

      val init_address = Input(UInt(32.W))
      val init_data = Input(UInt(32.W))
      val init_enable = Input(Bool())
    })
    
    val rom = SyncReadMem(32, UInt(Parameters.DataBits.W))
    val rom_loader = Module(new ROMLoader(rom.length.toInt))

    rom_loader.io.rom_data := rom.read(rom_loader.io.rom_address, true.B)
    rom_loader.io.load_start := io.load_start
    rom_loader.io.load_address := io.load_address
    io.load_finished := rom_loader.io.load_finished
    io.rom_address := rom_loader.io.rom_address

    val slave = Module(new AXI4LiteSlave(Parameters.AddrBits, Parameters.DataBits))
    slave.io.bundle <> io.slave_bundle
    slave.io.channels <> rom_loader.io.channels
    slave.io.bundle.read_data := 0.U

    when(io.init_enable) {
      rom.write(io.init_address, io.init_data)
    }
  }

  /*
    ROMLoader works as a loader to move program from ROM to RAM.
  */
  behavior of "ROMLoader"
  it should "load program through AXI to mem" in {
    test(new ROMLoaderTest).withAnnotations(TestAnnotations.annos) { c =>
  
      // ----------------------------
      // init ROM with some data
      c.io.init_enable.poke(true.B)
      c.io.init_address.poke(0.U)
      c.io.init_data.poke(0.U)
      c.clock.step()
      for (i <- 0 until c.rom.length.toInt) {
        val data = ((i + 1997) * 23753).U
        // val data = (i + 1).U
        c.io.init_address.poke(i.U)
        c.io.init_data.poke(data)
        c.clock.step()
      }
      c.io.init_enable.poke(false.B)
      c.clock.step(2)

      // --------------------------------
      // read from ROMLoader and check the data
      c.io.load_address.poke(0x0.U)
      c.io.load_start.poke(true.B)
      c.clock.step()
      c.io.load_start.poke(false.B)

      for (i <- 0 until c.rom.length.toInt) {
        var word_write_done = false
        breakable { for (j <- 0 until 20) {
          while (c.io.slave_bundle.write.peekBoolean()) { // loop until `write` is set to low for this word
            c.io.slave_bundle.address.expect((i*4).U)
            c.io.slave_bundle.write_data.expect(((i + 1997) * 23753).U)
            word_write_done = true
            c.clock.step()
          }
          if (word_write_done) break()
          c.clock.step()
        }}
        if (!word_write_done) throw new Exception(s"Write for word $i failed after 20 cycles")
      }

      c.clock.step(2)
      c.io.load_finished.expect(true.B)
      c.io.slave_bundle.write.expect(false.B)

      println(s"Successfully tested with ROM of ${c.rom.length.toInt} words")
    }
  }
}


class FunctionalTest extends AnyFlatSpec with ChiselScalatestTester {
  class TestBox extends Module {
    val io = IO(new Bundle {
      val master = new AXI4LiteMasterBundle(Parameters.AddrBits, Parameters.DataBits)
      val slave = new AXI4LiteSlaveBundle(Parameters.AddrBits, Parameters.DataBits)
      val readout_data = Input(UInt(Parameters.DataBits.W))
      val detach = Input(Bool())  // detach slave and master connection, used for simulating busy
    })

    val master = Module(new AXI4LiteMaster(Parameters.AddrBits, Parameters.DataBits))
    val slave = Module(new AXI4LiteSlave(Parameters.AddrBits, Parameters.DataBits))
    val dm = Module(new DummyMaster)
    val ds = Module(new DummySlave)

    master.io.bundle <> io.master
    slave.io.bundle <> io.slave
    when (io.detach) {
      master.io.channels <> ds.io.channels
      slave.io.channels <> dm.io.channels
    }
    .otherwise {
      master.io.channels <> slave.io.channels
      dm.io.channels <> ds.io.channels
    }
    
    // slave response is put here since chiseltest will take value poked just now for `expect` and `peek`,
    // which may be quite different from wave form.
    when (io.slave.read) {  // slave device responds to read request
      slave.io.bundle.read_data := io.readout_data
      slave.io.bundle.read_valid := true.B
    }
  }

  // this test also benchmarks cycles of write transaction
  behavior of "Write Function"
  it should "write data with correct response" in {
    test(new TestBox).withAnnotations(TestAnnotations.annos) { c =>
      var address = 0x4.U
      var data = 0xDEADBEEFL.U
      val strobe = 0xE.U(Parameters.WordSize.W)

      var cycle_passed = 0
      var cycle_arrive_slave = -1
      var cycle_write = -1
      var cycle_next = -1  // cycles taken that master is ready for next transaction


      // ------------------------
      // start write transaction
      FlexibleTestHelper.init_write_transaction(c.io.master, c.clock, address, data, strobe)


      // ------------------------
      // check correct write at slave
      breakable { while (true) {  
        if (c.io.slave.write.peekBoolean()) {  // check when `write` asserted
          c.io.slave.address.expect(address)
          c.io.slave.write_data.expect(data)
          for (i <- 0 until 4) c.io.slave.write_strobe(i).expect(strobe(i))
          cycle_arrive_slave = cycle_passed
        }

        if (c.io.master.write_valid.peekBoolean()) {
          // master knows write succeeded, make sure `write_valid` is high for only 1 cycle
          if (cycle_write == -1) cycle_write = cycle_passed
          else throw new Exception("Write test failed: write_valid is high for more than 1 cycle")
        }

        if (!c.io.master.busy.peekBoolean()) {
          cycle_next = cycle_passed
          break()
        }

        if (cycle_passed > 20) {
          throw new Exception("Write test failed: transaction seems never ends after 20 cycles")
        }

        c.io.master.busy.expect(true.B)
        c.clock.step()
        cycle_passed += 1
      }}
      c.clock.step()

      if (cycle_arrive_slave == -1) {
        throw new Exception("Write test failed: no data arrives slave")
      }
      if (cycle_write == -1) {
        throw new Exception("Write test failed: no write response arrives master")
      }

      println(s"Write transaction cost ${cycle_write} cycles, ${cycle_next} cycles for next transaction")
    }
  }



  behavior of "Read Function"
  it should "read correct data" in {
    test(new TestBox).withAnnotations(TestAnnotations.annos) { c =>
      var address = 0x4.U
      var data = 0xDEADBEEFL.U

      var cycle_passed = 0
      var cycle_arrive_slave = -1
      var cycle_read = -1   // read out data arrives at master
      var cycle_next = -1  // cycles taken that master is ready for next transaction


      // ----------------------
      // start read transaction
      FlexibleTestHelper.init_read_transaction(c.io.master, c.clock, address)


      // -----------------------
      // check correct read at slave
      breakable {while (true) {
        if (c.io.slave.read.peekBoolean()) { // check when `read` asserted
          c.io.slave.address.expect(address)
          cycle_arrive_slave = cycle_passed
        }

        if (c.io.master.read_valid.peekBoolean()) {
          // master knows read succeeded, make sure `read_valid` is high for only 1 cycle
          if (cycle_read == -1) cycle_read = cycle_passed
          else throw new Exception("Read test failed: read_valid is high for more than 1 cycle")
        }

        if (!c.io.master.busy.peekBoolean()) {
          cycle_next = cycle_passed
          break()
        }

        if (cycle_passed > 20) {
          throw new Exception("Read test failed: transaction seems never ends after 20 cycles")
        }

        c.io.master.busy.expect(true.B)
        c.clock.step()
        cycle_passed += 1
      }}
      c.clock.step()

      if (cycle_arrive_slave == -1) {
        throw new Exception("Read test failed: no data arrives slave")
      }
      if (cycle_read == -1) {
        throw new Exception("Read test failed: no read data arrives master")
      }

      println(s"Read transaction cost ${cycle_read} cycles for data read, ${cycle_next} cycles for next transaction")
    }
  }



  behavior of "Bus"
  it should "handle continuous transactions" in {
    test(new TestBox).withAnnotations(TestAnnotations.annos) { c =>
      val num_transactions = 1000
      var num_success_transactions = 0
      var total_cycles = 0
      var slave_trans_to_expect = List[Tuple3[String, Long, Long]]()

      // set random seed for benchmark or debug
      val seed = 1919810
      Random.setSeed(seed)



      def poke_write_transaction() {
        val addr = Random.nextLong(0xFFFFFFFFL)
        val data = Random.nextLong(0xFFFFFFFFL)
        FlexibleTestHelper.init_write_transaction(c.io.master, c.clock, addr.U, data.U, 0xF.U)
        c.io.master.busy.expect(true.B)
        slave_trans_to_expect :+= ("write", addr, data)
      }

      def poke_read_transaction() {
        val addr = Random.nextLong(0xFFFFFFFFL)
        val data = Random.nextLong(0xFFFFFFFFL)
        FlexibleTestHelper.init_read_transaction(c.io.master, c.clock, addr.U)
        c.io.readout_data.poke(data.U)
        slave_trans_to_expect :+= ("read", addr, data)  // record
      }

      breakable { while (true) {

        if (!c.io.master.busy.peekBoolean()) {
          c.io.detach.poke(true.B)  // to simulate that slave is busy and disconnect with master

          // randomly poke read or write transactions
          if (Random.nextBoolean()) poke_write_transaction()
          else poke_read_transaction()
          
          c.clock.step(3) // slave busy for this long time, while master waits for it
          c.io.detach.poke(false.B)
        }

        if (slave_trans_to_expect.length > 0) {
          val (trans_type, addr, data) = slave_trans_to_expect.head

          if (trans_type == "write") {
            if (c.io.slave.write.peekBoolean()) {
              c.io.slave.address.expect(addr.U)
              c.io.slave.write_data.expect(data.U)
              for (i <- 0 until 4) c.io.slave.write_strobe(i).expect(1.U)

              println(s"Write transaction to address 0x${addr.toHexString} with data 0x${data.toHexString} success")
              num_success_transactions += 1
              slave_trans_to_expect = slave_trans_to_expect.tail  // pop the head
            }
          }
          else {
            if (c.io.slave.read.peekBoolean()) {
              c.io.slave.address.expect(addr.U)
              c.io.readout_data.expect(data.U)

              println(s"Read transaction from address 0x${addr.toHexString} with expected data 0x${data.toHexString} success")
              num_success_transactions += 1
              slave_trans_to_expect = slave_trans_to_expect.tail  // pop the head
            }
          }
        }

        if (num_success_transactions >= num_transactions) {
          println(s"All $num_transactions transactions success in $total_cycles cycles with seed $seed")
          break()
        }

        c.clock.step()
        total_cycles += 1
      }}

    }
  }
}


