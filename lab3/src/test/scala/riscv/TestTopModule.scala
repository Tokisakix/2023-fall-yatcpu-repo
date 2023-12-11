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
import peripheral.{InstructionROM, Memory, ROMLoader}
import riscv.core.CPU

class TestTopModule(exeFilename: String, implementation: Int) extends Module {
  val io = IO(new Bundle {
    val regs_debug_read_address = Input(UInt(Parameters.PhysicalRegisterAddrWidth))
    val mem_debug_read_address = Input(UInt(Parameters.AddrWidth))
    val regs_debug_read_data = Output(UInt(Parameters.DataWidth))
    val mem_debug_read_data = Output(UInt(Parameters.DataWidth))
  })

  val mem = Module(new Memory(8192))
  val instruction_rom = Module(new InstructionROM(exeFilename))
  val rom_loader = Module(new ROMLoader(instruction_rom.capacity))

  rom_loader.io.rom_data := instruction_rom.io.data
  rom_loader.io.load_address := Parameters.EntryAddress
  instruction_rom.io.address := rom_loader.io.rom_address

  val CPU_clkdiv = RegInit(UInt(2.W), 0.U)
  val CPU_tick = Wire(Bool())
  val CPU_next = Wire(UInt(2.W))
  CPU_next := Mux(CPU_clkdiv === 3.U, 0.U, CPU_clkdiv + 1.U)
  CPU_tick := CPU_clkdiv === 0.U
  CPU_clkdiv := CPU_next

  withClock(CPU_tick.asClock) {
    val cpu = Module(new CPU(implementation))
    cpu.io.debug_read_address := 0.U
    cpu.io.instruction_valid := rom_loader.io.load_finished
    mem.io.instruction_address := cpu.io.instruction_address
    cpu.io.instruction := mem.io.instruction
    cpu.io.interrupt_flag := 0.U

    when(!rom_loader.io.load_finished) {
      rom_loader.io.bundle <> mem.io.bundle
      cpu.io.memory_bundle.read_data := 0.U
    }.otherwise {
      rom_loader.io.bundle.read_data := 0.U
      cpu.io.memory_bundle <> mem.io.bundle
    }

    cpu.io.debug_read_address := io.regs_debug_read_address
    io.regs_debug_read_data := cpu.io.debug_read_data
  }

  mem.io.debug_read_address := io.mem_debug_read_address
  io.mem_debug_read_data := mem.io.debug_read_data
}
