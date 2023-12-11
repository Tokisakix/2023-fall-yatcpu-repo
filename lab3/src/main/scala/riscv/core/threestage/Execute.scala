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

package riscv.core.threestage

import chisel3._
import chisel3.util._
import peripheral.RAMBundle
import riscv.Parameters
import riscv.core.{ALU, ALUControl}


class Execute extends Module {
  val io = IO(new Bundle {
    val instruction = Input(UInt(Parameters.InstructionWidth))
    val instruction_address = Input(UInt(Parameters.AddrWidth))
    val reg1_data = Input(UInt(Parameters.DataWidth))
    val reg2_data = Input(UInt(Parameters.DataWidth))
    val csr_read_data = Input(UInt(Parameters.DataWidth))
    val immediate_id = Input(UInt(Parameters.DataWidth))
    val aluop1_source_id = Input(UInt(1.W))
    val aluop2_source_id = Input(UInt(1.W))
    val memory_read_enable_id = Input(Bool())
    val memory_write_enable_id = Input(Bool())
    val regs_write_source_id = Input(UInt(2.W))
    val interrupt_assert_clint = Input(Bool())
    val interrupt_handler_address_clint = Input(UInt(Parameters.AddrWidth))

    val memory_bundle = Flipped(new RAMBundle)

    val csr_write_data = Output(UInt(Parameters.DataWidth))
    val regs_write_data = Output(UInt(Parameters.DataWidth))
    val if_jump_flag = Output(Bool())
    val if_jump_address = Output(UInt(Parameters.AddrWidth))
    val clint_jump_flag = Output(Bool())
    val clint_jump_address = Output(UInt(Parameters.AddrWidth))
  })

  val opcode = io.instruction(6, 0)
  val funct3 = io.instruction(14, 12)
  val funct7 = io.instruction(31, 25)
  val uimm = io.instruction(19, 15)

  // ALU compute
  val alu = Module(new ALU)
  val alu_ctrl = Module(new ALUControl)

  alu_ctrl.io.opcode := opcode
  alu_ctrl.io.funct3 := funct3
  alu_ctrl.io.funct7 := funct7
  alu.io.func := alu_ctrl.io.alu_funct
  alu.io.op1 := Mux(
    io.aluop1_source_id === ALUOp1Source.InstructionAddress,
    io.instruction_address,
    io.reg1_data
  )
  alu.io.op2 := Mux(
    io.aluop2_source_id === ALUOp2Source.Immediate,
    io.immediate_id,
    io.reg2_data
  )
  io.csr_write_data := MuxLookup(
    funct3,
    0.U,
    IndexedSeq(
      InstructionsTypeCSR.csrrw -> io.reg1_data,
      InstructionsTypeCSR.csrrc -> (io.csr_read_data & (~io.reg1_data).asUInt),
      InstructionsTypeCSR.csrrs -> (io.csr_read_data | io.reg1_data),
      InstructionsTypeCSR.csrrwi -> (0.U(27.W) ## uimm),
      InstructionsTypeCSR.csrrci -> (io.csr_read_data & (~(0.U(27.W) ## uimm)).asUInt),
      InstructionsTypeCSR.csrrsi -> (io.csr_read_data | 0.U(27.W) ## uimm),
    )
  )

  // memory access
  val mem_address_index = alu.io.result(log2Up(Parameters.WordSize) - 1, 0).asUInt
  val mem_read_data = Wire(UInt(Parameters.DataWidth))
  io.memory_bundle.write_enable := io.memory_write_enable_id
  io.memory_bundle.write_data := 0.U
  io.memory_bundle.address := alu.io.result
  io.memory_bundle.write_strobe := VecInit(Seq.fill(Parameters.WordSize)(false.B))
  mem_read_data := 0.U

  when(io.memory_read_enable_id) {
    val data = io.memory_bundle.read_data
    mem_read_data := MuxLookup(
      funct3,
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
  }.elsewhen(io.memory_write_enable_id) {
    io.memory_bundle.write_data := io.reg2_data
    io.memory_bundle.write_strobe := VecInit(Seq.fill(Parameters.WordSize)(false.B))
    when(funct3 === InstructionsTypeS.sb) {
      io.memory_bundle.write_strobe(mem_address_index) := true.B
      io.memory_bundle.write_data := io.reg2_data(Parameters.ByteBits, 0) << (mem_address_index << log2Up(Parameters.ByteBits).U)
    }.elsewhen(funct3 === InstructionsTypeS.sh) {
      when(mem_address_index === 0.U) {
        for (i <- 0 until Parameters.WordSize / 2) {
          io.memory_bundle.write_strobe(i) := true.B
        }
        io.memory_bundle.write_data := io.reg2_data(Parameters.WordSize / 2 * Parameters.ByteBits, 0)
      }.otherwise {
        for (i <- Parameters.WordSize / 2 until Parameters.WordSize) {
          io.memory_bundle.write_strobe(i) := true.B
        }
        io.memory_bundle.write_data := io.reg2_data(Parameters.WordSize / 2 * Parameters.ByteBits, 0) << (Parameters
          .WordSize / 2 * Parameters.ByteBits)
      }
    }.elsewhen(funct3 === InstructionsTypeS.sw) {
      for (i <- 0 until Parameters.WordSize) {
        io.memory_bundle.write_strobe(i) := true.B
      }
    }
  }

  // write back
  io.regs_write_data := MuxLookup(
    io.regs_write_source_id,
    alu.io.result,
    IndexedSeq(
      RegWriteSource.Memory -> mem_read_data,
      RegWriteSource.CSR -> io.csr_read_data,
      RegWriteSource.NextInstructionAddress -> (io.instruction_address + 4.U)
    )
  )

  // jump and interrupt
  val instruction_jump_flag = (opcode === Instructions.jal) ||
    (opcode === Instructions.jalr) ||
    (opcode === InstructionTypes.B) && MuxLookup(
      funct3,
      false.B,
      IndexedSeq(
        InstructionsTypeB.beq -> (io.reg1_data === io.reg2_data),
        InstructionsTypeB.bne -> (io.reg1_data =/= io.reg2_data),
        InstructionsTypeB.blt -> (io.reg1_data.asSInt < io.reg2_data.asSInt),
        InstructionsTypeB.bge -> (io.reg1_data.asSInt >= io.reg2_data.asSInt),
        InstructionsTypeB.bltu -> (io.reg1_data.asUInt < io.reg2_data.asUInt),
        InstructionsTypeB.bgeu -> (io.reg1_data.asUInt >= io.reg2_data.asUInt)
      )
    )
  io.clint_jump_flag := instruction_jump_flag
  io.clint_jump_address := alu.io.result
  io.if_jump_flag := io.interrupt_assert_clint || instruction_jump_flag
  io.if_jump_address := Mux(io.interrupt_assert_clint,
    io.interrupt_handler_address_clint,
    alu.io.result
  )
}
