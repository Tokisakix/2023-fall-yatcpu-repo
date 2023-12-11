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
import riscv.core.{ALUOp1Source, ALUOp2Source, InstructionDecode, InstructionTypes}

class InstructionDecoderTest extends AnyFlatSpec with ChiselScalatestTester{
  behavior of "InstructionDecoder of Single Cycle CPU"
  it should "produce correct control signal" in {
    test(new InstructionDecode).withAnnotations(TestAnnotations.annos) { c =>
      c.io.instruction.poke(0x00a02223L.U) //S-type
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.io.regs_reg1_read_address.expect(0.U)
      c.io.regs_reg2_read_address.expect(10.U)
      c.clock.step()

      c.io.instruction.poke(0x000022b7L.U) //lui
      c.io.regs_reg1_read_address.expect(0.U)
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Immediate)
      c.clock.step()

      c.io.instruction.poke(0x002081b3L.U) //add
      c.io.ex_aluop1_source.expect(ALUOp1Source.Register)
      c.io.ex_aluop2_source.expect(ALUOp2Source.Register)
      c.clock.step()
    }
  }
}
