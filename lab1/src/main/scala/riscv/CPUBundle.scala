// Copyright 2022 Howard Lau
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
import peripheral.RAMBundle

class CPUBundle extends Bundle {
  val instruction_address = Output(UInt(Parameters.AddrWidth))
  val instruction = Input(UInt(Parameters.DataWidth))
  val memory_bundle = Flipped(new RAMBundle)
  val instruction_valid = Input(Bool())
  val deviceSelect = Output(UInt(Parameters.SlaveDeviceCountBits.W))
  val debug_read_address = Input(UInt(Parameters.PhysicalRegisterAddrWidth))
  val debug_read_data = Output(UInt(Parameters.DataWidth))
}
