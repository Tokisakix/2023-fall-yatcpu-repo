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
import riscv.core.PipelineRegister

import scala.math.pow
import scala.util.Random


class PipelineRegisterTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Pipeline Register"
  it should "be able to stall and flush" in {
    val rand = new Random
    val default_value = rand.nextInt(pow(2, Parameters.DataBits).toInt).asUInt(Parameters.DataWidth)
    test(new PipelineRegister(Parameters.DataBits, default_value)).withAnnotations(TestAnnotations.annos) { c =>
      var pre = default_value
      for (_ <- 1 to 1000) {
        val cur = rand.nextInt(pow(2, Parameters.DataBits).toInt).asUInt(Parameters.DataWidth)
        c.io.in.poke(cur)
        rand.nextInt(3) match {
          case 0 =>
            c.io.stall.poke(false.B)
            c.io.flush.poke(false.B)
            c.clock.step()
            c.io.out.expect(cur)
            pre = cur
          case 1 =>
            c.io.stall.poke(true.B)
            c.io.flush.poke(false.B)
            c.clock.step()
            c.io.out.expect(pre)
          case 2 =>
            c.io.stall.poke(false.B)
            c.io.flush.poke(true.B)
            c.clock.step()
            c.io.out.expect(default_value)
            pre = default_value
        }
      }
    }
  }
}