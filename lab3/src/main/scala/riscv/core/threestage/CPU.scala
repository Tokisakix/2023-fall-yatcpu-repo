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
import riscv.Parameters
import riscv.core.{CPUBundle, CSR, RegisterFile}

class CPU extends Module {
  val io = IO(new CPUBundle)

  val ctrl = Module(new Control)
  val regs = Module(new RegisterFile)
  val inst_fetch = Module(new InstructionFetch)
  val if2id = Module(new IF2ID)
  val id = Module(new InstructionDecode)
  val id2ex = Module(new ID2EX)
  val ex = Module(new Execute)
  val clint = Module(new CLINT)
  val csr_regs = Module(new CSR)

  // Lab3(ThreeStage)
  if2id.io.flush := false.B
  id2ex.io.flush := false.B
  // Lab3(ThreeStage) End

  regs.io.write_enable := id2ex.io.output_regs_write_enable
  regs.io.write_address := id2ex.io.output_regs_write_address
  regs.io.write_data := ex.io.regs_write_data
  regs.io.read_address1 := id.io.regs_reg1_read_address
  regs.io.read_address2 := id.io.regs_reg2_read_address
  regs.io.debug_read_address := io.debug_read_address
  io.debug_read_data := regs.io.debug_read_data

  io.instruction_address := inst_fetch.io.instruction_address
  inst_fetch.io.jump_flag_ex := ex.io.if_jump_flag
  inst_fetch.io.jump_address_ex := ex.io.if_jump_address
  inst_fetch.io.rom_instruction := io.instruction
  inst_fetch.io.instruction_valid := io.instruction_valid

  if2id.io.instruction := inst_fetch.io.id_instruction
  if2id.io.instruction_address := inst_fetch.io.instruction_address
  if2id.io.interrupt_flag := io.interrupt_flag

  id.io.instruction := if2id.io.output_instruction

  id2ex.io.instruction := if2id.io.output_instruction
  id2ex.io.instruction_address := if2id.io.output_instruction_address
  id2ex.io.reg1_data := regs.io.read_data1
  id2ex.io.reg2_data := regs.io.read_data2
  id2ex.io.regs_write_enable := id.io.ex_reg_write_enable
  id2ex.io.regs_write_address := id.io.ex_reg_write_address
  id2ex.io.regs_write_source := id.io.ex_reg_write_source
  id2ex.io.immediate := id.io.ex_immediate
  id2ex.io.aluop1_source := id.io.ex_aluop1_source
  id2ex.io.aluop2_source := id.io.ex_aluop2_source
  id2ex.io.csr_write_enable := id.io.ex_csr_write_enable
  id2ex.io.csr_address := id.io.ex_csr_address
  id2ex.io.memory_read_enable := id.io.ex_memory_read_enable
  id2ex.io.memory_write_enable := id.io.ex_memory_write_enable
  id2ex.io.csr_read_data := csr_regs.io.id_reg_read_data

  ex.io.instruction := id2ex.io.output_instruction
  ex.io.instruction_address := id2ex.io.output_instruction_address
  ex.io.reg1_data := id2ex.io.output_reg1_data
  ex.io.reg2_data := id2ex.io.output_reg2_data
  ex.io.csr_read_data := id2ex.io.output_csr_read_data
  ex.io.immediate_id := id2ex.io.output_immediate
  ex.io.aluop1_source_id := id2ex.io.output_aluop1_source
  ex.io.aluop2_source_id := id2ex.io.output_aluop2_source
  ex.io.memory_read_enable_id := id2ex.io.output_memory_read_enable
  ex.io.memory_write_enable_id := id2ex.io.output_memory_write_enable
  ex.io.regs_write_source_id := id2ex.io.output_regs_write_source
  ex.io.interrupt_assert_clint := clint.io.ex_interrupt_assert
  ex.io.interrupt_handler_address_clint := clint.io.ex_interrupt_handler_address
  io.device_select := ex.io.memory_bundle.address(Parameters.AddrBits - 1, Parameters.AddrBits - Parameters.SlaveDeviceCountBits)
  io.memory_bundle <> ex.io.memory_bundle
  io.memory_bundle.address := 0.U(Parameters.SlaveDeviceCountBits.W) ## ex.io.memory_bundle.address(Parameters.AddrBits - 1 - Parameters.SlaveDeviceCountBits, 0)

  clint.io.instruction_address_if := inst_fetch.io.instruction_address
  clint.io.instruction_address_id := if2id.io.output_instruction_address
  clint.io.instruction_ex := id2ex.io.output_instruction
  clint.io.jump_flag := ex.io.clint_jump_flag
  clint.io.jump_address := ex.io.clint_jump_address
  clint.io.interrupt_flag := if2id.io.output_interrupt_flag
  clint.io.csr_bundle <> csr_regs.io.clint_access_bundle

  csr_regs.io.reg_read_address_id := id.io.ex_csr_address
  csr_regs.io.reg_write_enable_ex := id2ex.io.output_csr_write_enable
  csr_regs.io.reg_write_address_ex := id2ex.io.output_csr_address
  csr_regs.io.reg_write_data_ex := ex.io.csr_write_data
}
