// Copyright 2022 Canbin Huang
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

package board.z710v1_3

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.Cat
import peripheral._
import riscv.Parameters
import riscv.core.{CPU, ProgramCounter}

class Top(binaryFilename: String = "say_goodbye.asmbin") extends Module {
  val io = IO(new Bundle() {
    val tx = Output(Bool())
    val rx = Input(Bool())

    val led = Output(Bool())  // z710 has few LEDs, use one for running indicator
  })

  
  val clock_freq = 50_000_000

  val mem = Module(new Memory(Parameters.MemorySizeInWords))
  // val hdmi_display = Module(new HDMIDisplay)
  // val display = Module(new CharacterDisplay)
  // val timer = Module(new Timer)
  val uart = Module(new Uart(frequency = clock_freq, baudRate = 115200)) // 31M or 32M is good, 33M more error
  val dummy = Module(new Dummy)

  // display.io.bundle <> dummy.io.bundle
  mem.io.bundle <> dummy.io.bundle
  mem.io.debug_read_address := 0.U
  // timer.io.bundle <> dummy.io.bundle
  uart.io.bundle <> dummy.io.bundle
  io.tx := uart.io.txd
  uart.io.rxd := io.rx

  val instruction_rom = Module(new InstructionROM(binaryFilename))
  val rom_loader = Module(new ROMLoader(instruction_rom.capacity))

  rom_loader.io.rom_data := instruction_rom.io.data
  rom_loader.io.load_address := Parameters.EntryAddress
  instruction_rom.io.address := rom_loader.io.rom_address

  val CPU_clkdiv = RegInit(UInt(2.W),0.U)
  val CPU_tick = Wire(Bool())
  val CPU_next = Wire(UInt(2.W))
  CPU_next := Mux(CPU_clkdiv === 3.U, 0.U, CPU_clkdiv + 1.U)
  CPU_tick := CPU_clkdiv === 0.U
  CPU_clkdiv := CPU_next

  withClock(CPU_tick.asClock) {
    val cpu = Module(new CPU)
    // cpu.io.interrupt_flag := Cat(uart.io.signal_interrupt, timer.io.signal_interrupt)
    // cpu.io.csr_regs_debug_read_address := 0.U
    // cpu.io.regs_debug_read_address := 0.U
    cpu.io.debug_read_address := 0.U
    // cpu.io.memory_bundle.read_data := 0.U
    cpu.io.instruction_valid := rom_loader.io.load_finished
    mem.io.instruction_address := cpu.io.instruction_address
    cpu.io.instruction := mem.io.instruction

    when(!rom_loader.io.load_finished) {
      rom_loader.io.bundle <> mem.io.bundle
      cpu.io.memory_bundle.read_data := 0.U
    }.otherwise {
      rom_loader.io.bundle.read_data := 0.U
      when(cpu.io.deviceSelect === 2.U) {
        cpu.io.memory_bundle <> uart.io.bundle
      }.otherwise {
        cpu.io.memory_bundle <> mem.io.bundle
      }
    }

    when(!rom_loader.io.load_finished) {
      rom_loader.io.bundle <> mem.io.bundle
      cpu.io.memory_bundle.read_data := 0.U
    }.otherwise {
      rom_loader.io.bundle.read_data := 0.U
      cpu.io.memory_bundle <> mem.io.bundle
    }

    when (uart.io.bundle.write_enable) {
      val the_char = cpu.io.memory_bundle.write_data(7, 0)
      printf(cf"${the_char.asUInt}%c")
    }
  }

  // LED, blinks every second
  val led_count = RegInit(0.U(32.W))
  when (led_count >= clock_freq.U) {
    led_count := 0.U
  }.otherwise {
    led_count := led_count + 1.U
  }
  io.led := (led_count >= (clock_freq.U >> 1))



}

object VerilogGenerator extends App {
  (new ChiselStage).execute(
    Array("-X", "verilog", "-td", "verilog/z710v1.3"), 
    Seq(ChiselGeneratorAnnotation(() => new Top("say_goodbye.asmbin")))   // program to run on CPU
  )
}
