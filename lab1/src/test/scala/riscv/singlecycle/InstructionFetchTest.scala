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
import riscv.Parameters
import riscv.core.{ALUOp1Source, ALUOp2Source, InstructionFetch, InstructionTypes,ProgramCounter}


import scala.math.pow
import scala.util.Random



class InstructionFetchTest extends AnyFlatSpec with ChiselScalatestTester{
  behavior of "InstructionFetch of Single Cycle CPU"
  it should "fetch instruction" in {
    test(new InstructionFetch).withAnnotations(TestAnnotations.annos) { c =>
      val entry = 0x1000
      var pre = entry
      var cur = pre
      c.io.instruction_valid.poke(true.B)
      var x = 0
      for (x <- 0 to 100) {
        Random.nextInt(2) match {
          case 0 => // no jump
            cur = pre + 4
            c.io.jump_flag_id.poke(false.B)
            c.clock.step()
            c.io.instruction_address.expect(cur)
            pre = pre + 4
          case 1 => // jump
            c.io.jump_flag_id.poke(true.B)
            c.io.jump_address_id.poke(entry)
            c.clock.step()
            c.io.instruction_address.expect(entry)
            pre = entry
        }
      }

      }
    }
}
