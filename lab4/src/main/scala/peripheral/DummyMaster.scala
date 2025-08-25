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

package peripheral

import bus.{AXI4LiteChannels, AXI4LiteMaster}
import chisel3._
import riscv.Parameters

// A dummy master that never initiates reads or writes
class DummyMaster extends Module {
  val io = IO(new Bundle {
    val channels = new AXI4LiteChannels(Parameters.AddrBits, Parameters.DataBits)
  })
  // NOTE: not using AXI4LiteMaster to save resources
  io.channels.read_address_channel.ARVALID := false.B
  io.channels.read_address_channel.ARADDR := 0.U
  io.channels.read_address_channel.ARPROT := 0.U
  io.channels.read_data_channel.RREADY := false.B

  io.channels.write_address_channel.AWVALID := false.B
  io.channels.write_address_channel.AWADDR := 0.U
  io.channels.write_address_channel.AWPROT := 0.U
  io.channels.write_data_channel.WVALID := false.B
  io.channels.write_data_channel.WDATA := 0.U
  io.channels.write_data_channel.WSTRB := 0.U
  io.channels.write_response_channel.BREADY := false.B
}
