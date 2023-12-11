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
import riscv.core.{ALUOp1Source, ALUOp2Source, Execute, InstructionTypes}

class ExecuteTest extends AnyFlatSpec with ChiselScalatestTester{
  behavior of "Exxecute of Single Cycle CPU"
  it should "execute correctly" in {
    test(new Execute).withAnnotations(TestAnnotations.annos) { c =>

      // add test
      c.io.instruction.poke(0x001101b3L.U) //x3 =  x2 + x1
      //c.io.immediate.poke(0.U)
      //c.io.aluop1_source.poke(0.U)
      //c.io.aluop2_source.poke(0.U)

      var x = 0
      for (x <- 0 to 100) {
        val op1 = scala.util.Random.nextInt(429496729)
        val op2 = scala.util.Random.nextInt(429496729)
        val result = op1 + op2
        val addr = scala.util.Random.nextInt(32)

        c.io.reg1_data.poke(op1.U)
        c.io.reg2_data.poke(op2.U)

        c.clock.step()
        c.io.mem_alu_result.expect(result.U)
        c.io.if_jump_flag.expect(0.U)
      }

      // beq test
      c.io.instruction.poke(0x00208163L.U) //pc + 2 if x1 === x2
      c.io.instruction_address.poke(2.U)
      c.io.immediate.poke(2.U)
      c.io.aluop1_source.poke(1.U)
      c.io.aluop2_source.poke(1.U)
      c.clock.step()

      // equ
      c.io.reg1_data.poke(9.U)
      c.io.reg2_data.poke(9.U)
      c.clock.step()//add
      c.io.if_jump_flag.expect(1.U)
      c.io.if_jump_address.expect(4.U)

      // not equ
      c.io.reg1_data.poke(9.U)
      c.io.reg2_data.poke(19.U)
      c.clock.step()
      c.io.if_jump_flag.expect(0.U)
      c.io.if_jump_address.expect(4.U)
    }
  }
}
