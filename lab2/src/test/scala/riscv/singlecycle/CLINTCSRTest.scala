// Copyright 2022 hrpccs
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

package riscv.singlecycle

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import riscv.{Parameters, TestAnnotations}
import riscv.core.{ALUOp1Source, ALUOp2Source, CLINT, CSR, CSRRegister, InstructionDecode, InstructionsNop, InstructionsRet}

class CLINTCSRTestTopModule extends Module {
  val io = IO( new Bundle{
    val csr_regs_debug_read_address = Input(UInt(Parameters.CSRRegisterAddrWidth))
    val csr_regs_write_address = Input(UInt(Parameters.CSRRegisterAddrWidth))
    val csr_regs_write_data = Input(UInt(Parameters.DataWidth))
    val csr_regs_write_enable = Input(Bool())
    val interrupt_flag = Input(UInt(Parameters.InterruptFlagWidth))
    val instruction = Input(UInt(Parameters.DataWidth))
    val instruction_address = Input(UInt(Parameters.AddrWidth))

    val jump_flag = Input(Bool())
    val jump_address = Input(UInt(Parameters.AddrWidth))

    val interrupt_assert = Output(Bool())
    val interrupt_handler_address = Output(UInt(Parameters.DataWidth))
    val csr_regs_read_data = Output(UInt(Parameters.DataWidth))
    val csr_regs_debug_read_data = Output(UInt(Parameters.DataWidth))
  })
  val csr_regs = Module(new CSR)
  val clint = Module(new CLINT)

  clint.io.instruction := io.instruction
  clint.io.instruction_address := io.instruction_address
  clint.io.interrupt_flag := io.interrupt_flag
  clint.io.jump_flag := io.jump_flag
  clint.io.jump_address := io.jump_address

  io.interrupt_handler_address := clint.io.interrupt_handler_address
  io.interrupt_assert := clint.io.interrupt_assert
  io.csr_regs_read_data := csr_regs.io.reg_read_data
  csr_regs.io.reg_write_address_id := io.csr_regs_write_address
  csr_regs.io.debug_reg_read_address := io.csr_regs_debug_read_address
  csr_regs.io.reg_write_data_ex := io.csr_regs_write_data
  csr_regs.io.reg_write_enable_id := io.csr_regs_write_enable
  csr_regs.io.reg_read_address_id := io.csr_regs_write_address
  io.csr_regs_debug_read_data := csr_regs.io.debug_reg_read_data

  csr_regs.io.clint_access_bundle <> clint.io.csr_bundle

}

class CLINTCSRTest extends AnyFlatSpec with ChiselScalatestTester{
  behavior of "CLINTCSRTest of Single Cycle CPU"
  it should "process " in {
    test(new CLINTCSRTestTopModule).withAnnotations(TestAnnotations.annos) { c =>

      //
      c.io.jump_flag.poke(false.B)
      c.io.csr_regs_write_enable.poke(false.B)
      c.io.interrupt_flag.poke(0.U)
      c.clock.step()
      c.io.csr_regs_write_enable.poke(true.B)
      c.io.csr_regs_write_address.poke(CSRRegister.MTVEC)
      c.io.csr_regs_write_data.poke(0x1144L.U)
      c.clock.step()
      c.io.csr_regs_write_address.poke(CSRRegister.MSTATUS)
      c.io.csr_regs_write_data.poke(0x1888L.U)
      c.clock.step()
      c.io.csr_regs_write_enable.poke(false.B)
      //handle interrupt when not jumping
      c.io.jump_flag.poke(false.B)
      c.io.instruction_address.poke(0x1900L.U)
      c.io.instruction.poke(InstructionsNop.nop)
      c.io.interrupt_flag.poke(1.U)
      c.io.interrupt_assert.expect(true.B)
      c.io.interrupt_handler_address.expect(0x1144L.U)
      c.clock.step()
      c.io.interrupt_flag.poke(0.U)
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MEPC)
      c.io.csr_regs_debug_read_data.expect(0x1904L.U)
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MCAUSE)
      c.io.csr_regs_debug_read_data.expect(0x80000007L.U)
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MSTATUS)
      c.io.csr_regs_debug_read_data.expect(0x1880L.U)

      c.clock.step(25)

      //mret from interrupt handler
      c.io.instruction.poke(InstructionsRet.mret)
      c.io.interrupt_assert.expect(true.B)
      c.io.interrupt_handler_address.expect(0x1904L.U)
      c.clock.step()
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MSTATUS)
      c.io.csr_regs_debug_read_data.expect(0x1888L.U)

      //handle interrupt when jumping
      c.io.jump_flag.poke(true.B)
      c.io.jump_address.poke(0x1990L.U)
      c.io.interrupt_flag.poke(2.U)
      c.io.interrupt_assert.expect(true.B)
      c.io.interrupt_handler_address.expect(0x1144L.U)
      c.clock.step()
      c.io.interrupt_flag.poke(0.U)
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MEPC)
      c.io.csr_regs_debug_read_data.expect(0x1990L.U)
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MCAUSE)
      c.io.csr_regs_debug_read_data.expect(0x8000000BL.U)
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MSTATUS)
      c.io.csr_regs_debug_read_data.expect(0x1880L.U)

      c.clock.step(25)

      //mret from interrupt handler
      c.io.instruction.poke(InstructionsRet.mret)
      c.io.interrupt_assert.expect(true.B)
      c.io.interrupt_handler_address.expect(0x1990L.U)
      c.clock.step()
      c.io.csr_regs_debug_read_address.poke(CSRRegister.MSTATUS)
      c.io.csr_regs_debug_read_data.expect(0x1888L.U)
      c.io.instruction.poke(InstructionsNop.nop)

      //don't handle interrupt under certain situation
      c.io.csr_regs_write_enable.poke(true.B)
      c.io.csr_regs_write_address.poke(CSRRegister.MSTATUS)
      c.io.csr_regs_write_data.poke(0x1880L.U)
      c.io.interrupt_flag.poke(1.U)
      c.io.interrupt_assert.expect(false.B)
    }
  }
}
