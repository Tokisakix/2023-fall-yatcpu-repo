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

package riscv.core.fivestage_forward

import chisel3._
import chisel3.util._
import riscv.Parameters
import riscv.core.{ALU, ALUControl}


class Execute extends Module {
  val io = IO(new Bundle {
    val instruction = Input(UInt(Parameters.InstructionWidth))
    val instruction_address = Input(UInt(Parameters.AddrWidth))
    val reg1_data = Input(UInt(Parameters.DataWidth))
    val reg2_data = Input(UInt(Parameters.DataWidth))
    val immediate_id = Input(UInt(Parameters.DataWidth))
    val aluop1_source_id = Input(UInt(1.W))
    val aluop2_source_id = Input(UInt(1.W))
    val csr_read_data_id = Input(UInt(Parameters.DataWidth))
    val forward_from_mem = Input(UInt(Parameters.DataWidth))
    val forward_from_wb = Input(UInt(Parameters.DataWidth))
    val reg1_forward = Input(UInt(2.W))
    val reg2_forward = Input(UInt(2.W))
    val interrupt_assert_clint = Input(Bool())
    val interrupt_handler_address_clint = Input(UInt(Parameters.AddrWidth))

    val mem_alu_result = Output(UInt(Parameters.DataWidth))
    val mem_reg2_data = Output(UInt(Parameters.DataWidth))
    val csr_write_data = Output(UInt(Parameters.DataWidth))
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

  // Lab3(Forward)
  val reg1_data = 0.U
  val reg2_data = 0.U
  // Lab3(Forward) End

  alu.io.op1 := Mux(
    io.aluop1_source_id === ALUOp1Source.InstructionAddress,
    io.instruction_address,
    reg1_data
  )
  alu.io.op2 := Mux(
    io.aluop2_source_id === ALUOp2Source.Immediate,
    io.immediate_id,
    reg2_data
  )
  io.mem_alu_result := alu.io.result
  io.mem_reg2_data := reg2_data
  io.csr_write_data := MuxLookup(funct3, 0.U, IndexedSeq(
    InstructionsTypeCSR.csrrw -> reg1_data,
    InstructionsTypeCSR.csrrc -> io.csr_read_data_id.&((~reg1_data).asUInt),
    InstructionsTypeCSR.csrrs -> io.csr_read_data_id.|(reg1_data),
    InstructionsTypeCSR.csrrwi -> Cat(0.U(27.W), uimm),
    InstructionsTypeCSR.csrrci -> io.csr_read_data_id.&((~Cat(0.U(27.W), uimm)).asUInt),
    InstructionsTypeCSR.csrrsi -> io.csr_read_data_id.|(Cat(0.U(27.W), uimm)),
  ))

  // jump and interrupt
  val instruction_jump_flag = (opcode === Instructions.jal) ||
    (opcode === Instructions.jalr) ||
    (opcode === InstructionTypes.B) && MuxLookup(
      funct3,
      false.B,
      IndexedSeq(
        InstructionsTypeB.beq -> (reg1_data === reg2_data),
        InstructionsTypeB.bne -> (reg1_data =/= reg2_data),
        InstructionsTypeB.blt -> (reg1_data.asSInt < reg2_data.asSInt),
        InstructionsTypeB.bge -> (reg1_data.asSInt >= reg2_data.asSInt),
        InstructionsTypeB.bltu -> (reg1_data.asUInt < reg2_data.asUInt),
        InstructionsTypeB.bgeu -> (reg1_data.asUInt >= reg2_data.asUInt)
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
