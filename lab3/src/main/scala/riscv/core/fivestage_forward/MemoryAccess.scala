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

package riscv.core.fivestage_forward

import chisel3._
import chisel3.util._
import peripheral.RAMBundle
import riscv.Parameters

class MemoryAccess extends Module {
  val io = IO(new Bundle() {
    val alu_result = Input(UInt(Parameters.DataWidth))
    val reg2_data = Input(UInt(Parameters.DataWidth))
    val memory_read_enable = Input(Bool())
    val memory_write_enable = Input(Bool())
    val funct3 = Input(UInt(3.W))
    val regs_write_source = Input(UInt(2.W))
    val csr_read_data = Input(UInt(Parameters.DataWidth))

    val wb_memory_read_data = Output(UInt(Parameters.DataWidth))
    val forward_data = Output(UInt(Parameters.DataWidth))

    val bundle = Flipped(new RAMBundle)
  })
  val mem_address_index = io.alu_result(log2Up(Parameters.WordSize) - 1, 0).asUInt

  io.bundle.write_enable := io.memory_write_enable
  io.bundle.write_data := 0.U
  io.bundle.address := io.alu_result
  io.bundle.write_strobe := VecInit(Seq.fill(Parameters.WordSize)(false.B))
  io.wb_memory_read_data := 0.U

  when(io.memory_read_enable) {
    val data = io.bundle.read_data
    io.wb_memory_read_data := MuxLookup(
      io.funct3,
      0.U,
      IndexedSeq(
        InstructionsTypeL.lb -> MuxLookup(
          mem_address_index,
          Cat(Fill(24, data(31)), data(31, 24)),
          IndexedSeq(
            0.U -> Cat(Fill(24, data(7)), data(7, 0)),
            1.U -> Cat(Fill(24, data(15)), data(15, 8)),
            2.U -> Cat(Fill(24, data(23)), data(23, 16))
          )
        ),
        InstructionsTypeL.lbu -> MuxLookup(
          mem_address_index,
          Cat(Fill(24, 0.U), data(31, 24)),
          IndexedSeq(
            0.U -> Cat(Fill(24, 0.U), data(7, 0)),
            1.U -> Cat(Fill(24, 0.U), data(15, 8)),
            2.U -> Cat(Fill(24, 0.U), data(23, 16))
          )
        ),
        InstructionsTypeL.lh -> Mux(
          mem_address_index === 0.U,
          Cat(Fill(16, data(15)), data(15, 0)),
          Cat(Fill(16, data(31)), data(31, 16))
        ),
        InstructionsTypeL.lhu -> Mux(
          mem_address_index === 0.U,
          Cat(Fill(16, 0.U), data(15, 0)),
          Cat(Fill(16, 0.U), data(31, 16))
        ),
        InstructionsTypeL.lw -> data
      )
    )
  }.elsewhen(io.memory_write_enable) {
    io.bundle.write_data := io.reg2_data
    io.bundle.write_strobe := VecInit(Seq.fill(Parameters.WordSize)(false.B))
    when(io.funct3 === InstructionsTypeS.sb) {
      io.bundle.write_strobe(mem_address_index) := true.B
      io.bundle.write_data := io.reg2_data(Parameters.ByteBits, 0) << (mem_address_index << log2Up(Parameters.ByteBits).U)
    }.elsewhen(io.funct3 === InstructionsTypeS.sh) {
      when(mem_address_index === 0.U) {
        for (i <- 0 until Parameters.WordSize / 2) {
          io.bundle.write_strobe(i) := true.B
        }
        io.bundle.write_data := io.reg2_data(Parameters.WordSize / 2 * Parameters.ByteBits, 0)
      }.otherwise {
        for (i <- Parameters.WordSize / 2 until Parameters.WordSize) {
          io.bundle.write_strobe(i) := true.B
        }
        io.bundle.write_data := io.reg2_data(Parameters.WordSize / 2 * Parameters.ByteBits, 0) << (Parameters
          .WordSize / 2 * Parameters.ByteBits)
      }
    }.elsewhen(io.funct3 === InstructionsTypeS.sw) {
      for (i <- 0 until Parameters.WordSize) {
        io.bundle.write_strobe(i) := true.B
      }
    }
  }

  io.forward_data := Mux(io.regs_write_source === RegWriteSource.CSR, io.csr_read_data, io.alu_result)
}
