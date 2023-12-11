// Copyright 2022 Canbin Huang
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
import riscv.Parameters

object ForwardingType {
  val NoForward = 0.U(2.W)
  val ForwardFromMEM = 1.U(2.W)
  val ForwardFromWB = 2.U(2.W)
}

class Forwarding extends Module {
  val io = IO(new Bundle() {
    val rs1_ex = Input(UInt(Parameters.PhysicalRegisterAddrWidth))
    val rs2_ex = Input(UInt(Parameters.PhysicalRegisterAddrWidth))
    val rd_mem = Input(UInt(Parameters.PhysicalRegisterAddrWidth))
    val reg_write_enable_mem = Input(Bool())
    val rd_wb = Input(UInt(Parameters.PhysicalRegisterAddrWidth))
    val reg_write_enable_wb = Input(Bool())

    // Forwarding Type
    val reg1_forward_ex = Output(UInt(2.W))
    val reg2_forward_ex = Output(UInt(2.W))
  })

  // Lab3(Forward)
  io.reg1_forward_ex := 0.U
  io.reg2_forward_ex := 0.U
  // Lab3(Forward) End
}
