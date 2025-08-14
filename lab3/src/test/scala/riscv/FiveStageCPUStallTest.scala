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

package riscv

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random
import riscv.core.fivestage_stall._


class FiveStageCPUStallTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Five-stage Pipelined CPU with Stalling"
  it should "calculate recursively fibonacci(10)" in {
    test(new TestTopModule("fibonacci.asmbin", ImplementationType.FiveStageStall)).withAnnotations(TestAnnotations.annos) { c =>
      for (i <- 1 to 50) {
        c.clock.step(1000)
        c.io.mem_debug_read_address.poke((i * 4).U) // Avoid timeout
      }

      c.io.mem_debug_read_address.poke(4.U)
      c.clock.step()
      c.io.mem_debug_read_data.expect(55.U)
    }
  }
  it should "quicksort 10 numbers" in {
    test(new TestTopModule("quicksort.asmbin", ImplementationType.FiveStageStall)).withAnnotations(TestAnnotations.annos) { c =>
      for (i <- 1 to 50) {
        c.clock.step(1000)
        c.io.mem_debug_read_address.poke((i * 4).U) // Avoid timeout
      }
      for (i <- 1 to 10) {
        c.io.mem_debug_read_address.poke((4 * i).U)
        c.clock.step()
        c.io.mem_debug_read_data.expect((i - 1).U)
      }
    }
  }
  it should "store and load single byte" in {
    test(new TestTopModule("sb.asmbin", ImplementationType.FiveStageStall)).withAnnotations(TestAnnotations.annos) { c =>
      c.clock.step(1000)
      c.io.regs_debug_read_address.poke(5.U)
      c.io.regs_debug_read_data.expect(0xDEADBEEFL.U)
      c.io.regs_debug_read_address.poke(6.U)
      c.io.regs_debug_read_data.expect(0xEF.U)
      c.io.regs_debug_read_address.poke(1.U)
      c.io.regs_debug_read_data.expect(0x15EF.U)
    }
  }
  it should "solve data and control hazards" in {
    test(new TestTopModule("hazard.asmbin", ImplementationType.FiveStageStall)).withAnnotations(TestAnnotations.annos) { c =>
      c.clock.step(1000)
      c.io.regs_debug_read_address.poke(1.U)
      c.io.regs_debug_read_data.expect(46.U)
      c.io.mem_debug_read_address.poke(4.U)
      c.clock.step()
      c.io.mem_debug_read_data.expect(1.U)
      c.io.mem_debug_read_address.poke(8.U)
      c.clock.step()
      c.io.mem_debug_read_data.expect(3.U)
    }
  }
}



class DecoderStallTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "ID of Five-stage Pipelined CPU with Stalling"

  def concatBits(values: (Int, Int)*): Int = {
    values.foldLeft(0) { case (result, (value, bits)) =>
      val mask = (1 << bits) - 1  // Create mask for the specified bit width
      val maskedValue = value & mask  // Ensure value fits in specified bits
      (result << bits) | maskedValue
    }
  }

  it should "generate correct reg addr" in {
    test(new InstructionDecode).withAnnotations(TestAnnotations.annos) { c =>

      for (i <- 0 to 100) {
        val rs1 = Random.nextInt(32)
        val rs2 = Random.nextInt(32)
        val rd = Random.nextInt(32)

        // for R-type instructions, rs2, rs1 and rd should be valid
        // val instR = 0.U(7.W) ## rs2 ## rs1 ## 1.U(3.W) ## rd ## InstructionTypes.RM
        val instR = concatBits(
          (0, 7), (rs2, 5), (rs1, 5), (1, 3), (rd, 5), (InstructionTypes.RM.litValue.toInt, 7)
        )
        c.io.instruction.poke(instR)
        c.io.regs_reg1_read_address.expect(rs1)
        c.io.regs_reg2_read_address.expect(rs2)
        c.io.ex_reg_write_address.expect(rd)
        c.io.ex_reg_write_enable.expect(true.B)
        c.clock.step()

        // for I-type instructions, rs1 and rd should be valid
        val instI = concatBits((0, 12), (rs1, 5), (1, 3), (rd, 5), (InstructionTypes.I.litValue.toInt, 7))
        c.io.instruction.poke(instI)
        c.io.regs_reg1_read_address.expect(rs1)
        c.io.regs_reg2_read_address.expect(0.U)
        c.io.ex_reg_write_address.expect(rd)
        c.io.ex_reg_write_enable.expect(true.B)
        c.clock.step()

        // for S-type instructions, rs2 and rs1 should be valid
        val instS = concatBits((0, 7), (rs2, 5), (rs1, 5), (1, 3), (2, 5), (InstructionTypes.S.litValue.toInt, 7))
        c.io.instruction.poke(instS)
        c.io.regs_reg1_read_address.expect(rs1)
        c.io.regs_reg2_read_address.expect(rs2)
        c.io.ex_reg_write_address.expect(0.U)
        c.io.ex_reg_write_enable.expect(false.B)
        c.clock.step()

        // for B-type instructions, rs2 and rs1 should be valid
        val instB = concatBits((0, 7), (rs2, 5), (rs1, 5), (1, 3), (2, 5), (InstructionTypes.B.litValue.toInt, 7))
        c.io.instruction.poke(instB)
        c.io.regs_reg1_read_address.expect(rs1)
        c.io.regs_reg2_read_address.expect(rs2)
        c.io.ex_reg_write_address.expect(0.U)
        c.io.ex_reg_write_enable.expect(false.B)
        c.clock.step()

        // for U-type instructions, rd should be valid
        val instU = concatBits((0, 20), (rd, 5), (Instructions.lui.litValue.toInt, 7))
        c.io.instruction.poke(instU)
        c.io.regs_reg1_read_address.expect(0.U)
        c.io.regs_reg2_read_address.expect(0.U)
        c.io.ex_reg_write_address.expect(rd)
        c.io.ex_reg_write_enable.expect(true.B)
        c.clock.step()

        // for J-type instructions, rd should be valid
        val instJ = concatBits((0, 20), (rd, 5), (Instructions.jal.litValue.toInt, 7))
        c.io.instruction.poke(instJ)
        c.io.regs_reg1_read_address.expect(0.U)
        c.io.regs_reg2_read_address.expect(0.U)
        c.io.ex_reg_write_address.expect(rd)
        c.io.ex_reg_write_enable.expect(true.B)
        c.clock.step()
      }
    }
  }

}
