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


class FiveStageCPUForwardTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Five-stage Pipelined CPU with Forwarding"
  it should "calculate recursively fibonacci(10)" in {
    test(new TestTopModule("fibonacci.asmbin", ImplementationType.FiveStageForward)).withAnnotations(TestAnnotations.annos) { c =>
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
    test(new TestTopModule("quicksort.asmbin", ImplementationType.FiveStageForward)).withAnnotations(TestAnnotations.annos) { c =>
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
    test(new TestTopModule("sb.asmbin", ImplementationType.FiveStageForward)).withAnnotations(TestAnnotations.annos) { c =>
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
    test(new TestTopModule("hazard.asmbin", ImplementationType.FiveStageForward)).withAnnotations(TestAnnotations.annos) { c =>
      c.clock.step(1000)
      c.io.regs_debug_read_address.poke(1.U)
      c.io.regs_debug_read_data.expect(27.U)
      c.io.mem_debug_read_address.poke(4.U)
      c.clock.step()
      c.io.mem_debug_read_data.expect(1.U)
      c.io.mem_debug_read_address.poke(8.U)
      c.clock.step()
      c.io.mem_debug_read_data.expect(3.U)
    }
  }
}

