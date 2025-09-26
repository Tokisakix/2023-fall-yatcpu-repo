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
import riscv.TestAnnotations
import riscv.core.{ALUOp1Source, ALUOp2Source, RegWriteSource, InstructionDecode, InstructionTypes}

class InstructionDecoderTest extends AnyFlatSpec with ChiselScalatestTester{
  behavior of "InstructionDecoder of Single Cycle CPU"
  it should "produce correct control signal" in {
    test(new InstructionDecode).withAnnotations(TestAnnotations.annos) { c =>

      // InstructionTypes.L , I-type load command
      c.io.instruction.poke(0x0040A183L.U)  // lw x3, 4(x1)
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.ex_immediate.expect(4.U)
      c.io.regs_reg1_read_address.expect(1.U)
      c.io.reg_write_enable.expect(true.B)
      c.io.reg_write_address.expect(3.U)
      c.io.wb_reg_write_source.expect(RegWriteSource.Memory)
      c.io.memory_read_enable.expect(true.B)
      c.io.memory_write_enable.expect(false.B)
      c.clock.step()


      // InstructionTypes.S 
      c.io.instruction.poke(0x00a02223L.U) // sw x10, 4(x0)
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.ex_immediate.expect(4.U)
      c.io.regs_reg1_read_address.expect(0.U)
      c.io.regs_reg2_read_address.expect(10.U)
      c.io.memory_write_enable.expect(true.B)
      c.io.reg_write_enable.expect(false.B)
      c.clock.step()


      // InstructionTypes.I, I-type instructions
      c.io.instruction.poke(0x0184F193L.U) // andi x3, x9, 24
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.ex_immediate.expect(24.U)
      c.io.regs_reg1_read_address.expect(9.U)
      c.io.reg_write_enable.expect(true.B)
      c.io.reg_write_address.expect(3.U)
      c.io.wb_reg_write_source.expect(RegWriteSource.ALUResult)
      c.clock.step()


      // InstructionTypes.B, B-type instructions
      c.io.instruction.poke(0x00415863L.U) // bge x2, x4, 16
      c.io.ex_aluop1_source.expect(ALUOp1Source.InstructionAddress)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.ex_immediate.expect(16.U)
      c.io.regs_reg1_read_address.expect(2.U)
      c.io.regs_reg2_read_address.expect(4.U)
      c.clock.step()
      

      // InstructionTypes.RM, R-type instructions
      c.io.instruction.poke(0x002081b3L.U) // add
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Register)
      c.io.regs_reg1_read_address.expect(1.U)
      c.io.regs_reg2_read_address.expect(2.U)
      c.io.reg_write_enable.expect(true.B)
      c.io.reg_write_address.expect(3.U)
      c.clock.step()


      // lui, U-type
      c.io.instruction.poke(0x000022b7L.U)  // lui x5, 2
      c.io.regs_reg1_read_address.expect(0.U)
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register) // little special, see how ID and EX treat lui
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.reg_write_enable.expect(true.B)
      c.io.reg_write_address.expect(5.U)
      c.io.ex_immediate.expect((2 << 12).U)
      c.io.wb_reg_write_source.expect(RegWriteSource.ALUResult)
      c.clock.step()


      // jal, J-type
      c.io.instruction.poke(0x008002efL.U) // jal x5, 8
      c.io.ex_aluop1_source.expect(ALUOp1Source.InstructionAddress)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.ex_immediate.expect(8.U)
      c.io.wb_reg_write_source.expect(RegWriteSource.NextInstructionAddress)
      c.io.reg_write_enable.expect(true.B)
      c.io.reg_write_address.expect(5.U)
      c.clock.step()


      // jalr, I-type
      c.io.instruction.poke(0x008082E7L.U)  // jalr x5, x1, 8
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.regs_reg1_read_address.expect(1.U)
      c.io.ex_immediate.expect(8.U)
      c.io.wb_reg_write_source.expect(RegWriteSource.NextInstructionAddress)
      c.io.reg_write_enable.expect(true.B)
      c.io.reg_write_address.expect(5.U)
      c.clock.step()


      // auipc, U-type
      c.io.instruction.poke(0x00007117L.U) // auipc x2, 7
      c.io.ex_aluop1_source.expect(ALUOp1Source.InstructionAddress)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.ex_immediate.expect((7 << 12).U)
      c.io.reg_write_enable.expect(true.B)
      c.io.reg_write_address.expect(2.U)
      c.io.wb_reg_write_source.expect(RegWriteSource.ALUResult)
      c.clock.step()

    }
  }
}
