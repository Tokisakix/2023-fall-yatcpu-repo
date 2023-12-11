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

package riscv.core

import chisel3._
import riscv.Parameters

object ProgramCounter {
  val EntryAddress = Parameters.EntryAddress
}

class InstructionFetch extends Module {
  val io = IO(new Bundle {
    val jump_flag_id = Input(Bool())
    val jump_address_id = Input(UInt(Parameters.AddrWidth))
    val instruction_read_data = Input(UInt(Parameters.DataWidth))
    val interrupt_assert = Input(Bool())
    val interrupt_handler_address = Input(UInt(Parameters.AddrWidth))
    val instruction_valid = Input(Bool())

    val instruction_address = Output(UInt(Parameters.AddrWidth))
    val instruction = Output(UInt(Parameters.InstructionWidth))

  })
  val pc = RegInit(ProgramCounter.EntryAddress)

  when(io.instruction_valid) {
    when(io.interrupt_assert){
      pc := io.interrupt_handler_address
    }.elsewhen(io.jump_flag_id){
      pc := io.jump_address_id
    }.otherwise {
      pc := pc + 4.U
    }
    io.instruction := io.instruction_read_data
  }.otherwise{
    pc := pc
    io.instruction := 0x00000013.U
  }
  io.instruction_address := pc
}
