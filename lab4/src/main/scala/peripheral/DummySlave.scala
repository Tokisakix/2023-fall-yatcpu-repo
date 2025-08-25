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

import bus.{AXI4LiteChannels, AXI4LiteSlave}
import chisel3._
import riscv.Parameters

// A dummy AXI4 slave that doesn't respond to anything
class DummySlave extends Module {
  val io = IO(new Bundle {
    val channels = Flipped(new AXI4LiteChannels(4, Parameters.DataBits))
  })

  io.channels.read_address_channel.ARREADY := false.B
  io.channels.read_data_channel.RVALID := false.B
  io.channels.read_data_channel.RDATA := 0.U
  io.channels.read_data_channel.RRESP := 0.U

  io.channels.write_address_channel.AWREADY := false.B
  io.channels.write_data_channel.WREADY := false.B
  io.channels.write_response_channel.BVALID := false.B
  io.channels.write_response_channel.BRESP := 0.U
}
