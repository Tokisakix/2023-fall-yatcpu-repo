module AXI4LiteSlave(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [7:0]  io_channels_write_address_channel_AWADDR, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [7:0]  io_channels_read_address_channel_ARADDR, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_bundle_read, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_bundle_write, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [31:0] io_bundle_read_data, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output [31:0] io_bundle_write_data, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output [7:0]  io_bundle_address // @[src/main/scala/bus/AXI4Lite.scala 121:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/bus/AXI4Lite.scala 125:22]
  reg [31:0] addr; // @[src/main/scala/bus/AXI4Lite.scala 126:21]
  reg  read; // @[src/main/scala/bus/AXI4Lite.scala 128:21]
  reg  write; // @[src/main/scala/bus/AXI4Lite.scala 130:22]
  reg [31:0] write_data; // @[src/main/scala/bus/AXI4Lite.scala 132:27]
  reg  ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 137:24]
  reg  RVALID; // @[src/main/scala/bus/AXI4Lite.scala 139:23]
  reg  AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 146:24]
  reg  WREADY; // @[src/main/scala/bus/AXI4Lite.scala 148:23]
  reg  BVALID; // @[src/main/scala/bus/AXI4Lite.scala 151:23]
  wire  _GEN_4 = io_channels_read_address_channel_ARVALID & ARREADY | read; // @[src/main/scala/bus/AXI4Lite.scala 170:65 173:14 128:21]
  wire [2:0] _GEN_6 = io_channels_read_data_channel_RREADY & RVALID ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 179:60 180:15 125:22]
  wire  _GEN_7 = io_channels_read_data_channel_RREADY & RVALID ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 178:14 179:60 181:16]
  wire [31:0] _GEN_8 = io_channels_write_address_channel_AWVALID & AWREADY ? {{24'd0},
    io_channels_write_address_channel_AWADDR} : addr; // @[src/main/scala/bus/AXI4Lite.scala 186:66 187:14 126:21]
  wire [2:0] _GEN_9 = io_channels_write_address_channel_AWVALID & AWREADY ? 3'h4 : state; // @[src/main/scala/bus/AXI4Lite.scala 186:66 188:15 125:22]
  wire  _GEN_10 = io_channels_write_address_channel_AWVALID & AWREADY ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 185:15 186:66 189:17]
  wire [2:0] _GEN_11 = io_channels_write_data_channel_WVALID & WREADY ? 3'h5 : state; // @[src/main/scala/bus/AXI4Lite.scala 194:61 195:15 125:22]
  wire  _GEN_17 = io_channels_write_data_channel_WVALID & WREADY | write; // @[src/main/scala/bus/AXI4Lite.scala 194:61 198:15 130:22]
  wire  _GEN_18 = io_channels_write_data_channel_WVALID & WREADY ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 193:14 194:61 199:16]
  wire [2:0] _GEN_19 = io_channels_write_response_channel_BREADY & BVALID ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 205:65 206:15 125:22]
  wire  _GEN_20 = io_channels_write_response_channel_BREADY & BVALID ? 1'h0 : write; // @[src/main/scala/bus/AXI4Lite.scala 205:65 207:15 130:22]
  wire  _GEN_21 = io_channels_write_response_channel_BREADY & BVALID ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 204:14 205:65 208:16]
  wire  _GEN_22 = 3'h5 == state ? 1'h0 : WREADY; // @[src/main/scala/bus/AXI4Lite.scala 156:17 203:14 148:23]
  wire  _GEN_23 = 3'h5 == state ? _GEN_21 : BVALID; // @[src/main/scala/bus/AXI4Lite.scala 156:17 151:23]
  wire [2:0] _GEN_24 = 3'h5 == state ? _GEN_19 : state; // @[src/main/scala/bus/AXI4Lite.scala 156:17 125:22]
  wire  _GEN_25 = 3'h5 == state ? _GEN_20 : write; // @[src/main/scala/bus/AXI4Lite.scala 156:17 130:22]
  wire  _GEN_26 = 3'h4 == state ? _GEN_18 : _GEN_22; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire [2:0] _GEN_27 = 3'h4 == state ? _GEN_11 : _GEN_24; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire  _GEN_33 = 3'h4 == state ? _GEN_17 : _GEN_25; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire  _GEN_34 = 3'h4 == state ? BVALID : _GEN_23; // @[src/main/scala/bus/AXI4Lite.scala 156:17 151:23]
  wire  _GEN_35 = 3'h3 == state ? _GEN_10 : AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 156:17 146:24]
  wire [31:0] _GEN_36 = 3'h3 == state ? _GEN_8 : addr; // @[src/main/scala/bus/AXI4Lite.scala 156:17 126:21]
  wire [2:0] _GEN_37 = 3'h3 == state ? _GEN_9 : _GEN_27; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire  _GEN_38 = 3'h3 == state ? WREADY : _GEN_26; // @[src/main/scala/bus/AXI4Lite.scala 156:17 148:23]
  wire  _GEN_44 = 3'h3 == state ? write : _GEN_33; // @[src/main/scala/bus/AXI4Lite.scala 156:17 130:22]
  wire  _GEN_45 = 3'h3 == state ? BVALID : _GEN_34; // @[src/main/scala/bus/AXI4Lite.scala 156:17 151:23]
  assign io_channels_write_address_channel_AWREADY = AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 147:45]
  assign io_channels_write_data_channel_WREADY = WREADY; // @[src/main/scala/bus/AXI4Lite.scala 149:41]
  assign io_channels_write_response_channel_BVALID = BVALID; // @[src/main/scala/bus/AXI4Lite.scala 152:45]
  assign io_channels_read_address_channel_ARREADY = ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 138:44]
  assign io_channels_read_data_channel_RVALID = RVALID; // @[src/main/scala/bus/AXI4Lite.scala 140:40]
  assign io_channels_read_data_channel_RDATA = io_bundle_read_data; // @[src/main/scala/bus/AXI4Lite.scala 144:39]
  assign io_bundle_read = read; // @[src/main/scala/bus/AXI4Lite.scala 129:18]
  assign io_bundle_write = write; // @[src/main/scala/bus/AXI4Lite.scala 131:19]
  assign io_bundle_write_data = write_data; // @[src/main/scala/bus/AXI4Lite.scala 133:24]
  assign io_bundle_address = addr[7:0]; // @[src/main/scala/bus/AXI4Lite.scala 127:21]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 125:22]
      state <= 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 125:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (io_channels_write_address_channel_AWVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 162:55]
        state <= 3'h3; // @[src/main/scala/bus/AXI4Lite.scala 163:15]
      end else if (io_channels_read_address_channel_ARVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 164:60]
        state <= 3'h1; // @[src/main/scala/bus/AXI4Lite.scala 165:15]
      end
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 170:65]
        state <= 3'h2; // @[src/main/scala/bus/AXI4Lite.scala 171:15]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      state <= _GEN_6;
    end else begin
      state <= _GEN_37;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 126:21]
      addr <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 126:21]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 170:65]
          addr <= {{24'd0}, io_channels_read_address_channel_ARADDR}; // @[src/main/scala/bus/AXI4Lite.scala 172:14]
        end
      end else if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        addr <= _GEN_36;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 128:21]
      read <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 128:21]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      read <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 158:12]
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      read <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 130:22]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 130:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 159:13]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        write <= _GEN_44;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 132:27]
      write_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 132:27]
    end else begin
      write_data <= io_channels_write_data_channel_WDATA;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 137:24]
      ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 137:24]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 170:65]
          ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 174:17]
        end else begin
          ARREADY <= 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 169:15]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 139:23]
      RVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 139:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      RVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 160:14]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        RVALID <= _GEN_7;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 146:24]
      AWREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 146:24]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          AWREADY <= _GEN_35;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 148:23]
      WREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 148:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          WREADY <= _GEN_38;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 151:23]
      BVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 151:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      BVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 161:14]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        BVALID <= _GEN_45;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  read = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  write = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  write_data = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  ARREADY = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  RVALID = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  AWREADY = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  WREADY = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  BVALID = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Tx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/peripheral/UART.scala 32:14]
  output       io_channel_ready, // @[src/main/scala/peripheral/UART.scala 32:14]
  input        io_channel_valid, // @[src/main/scala/peripheral/UART.scala 32:14]
  input  [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 32:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] shiftReg; // @[src/main/scala/peripheral/UART.scala 40:25]
  reg [19:0] cntReg; // @[src/main/scala/peripheral/UART.scala 41:23]
  reg [3:0] bitsReg; // @[src/main/scala/peripheral/UART.scala 42:24]
  wire  _io_channel_ready_T = cntReg == 20'h0; // @[src/main/scala/peripheral/UART.scala 44:31]
  wire [9:0] shift = shiftReg[10:1]; // @[src/main/scala/peripheral/UART.scala 51:28]
  wire [10:0] _shiftReg_T_1 = {1'h1,shift}; // @[src/main/scala/peripheral/UART.scala 52:22]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[src/main/scala/peripheral/UART.scala 53:26]
  wire [10:0] _shiftReg_T_3 = {2'h3,io_channel_bits,1'h0}; // @[src/main/scala/peripheral/UART.scala 56:24]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[src/main/scala/peripheral/UART.scala 64:22]
  assign io_txd = shiftReg[0]; // @[src/main/scala/peripheral/UART.scala 45:21]
  assign io_channel_ready = cntReg == 20'h0 & bitsReg == 4'h0; // @[src/main/scala/peripheral/UART.scala 44:40]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 40:25]
      shiftReg <= 11'h7ff; // @[src/main/scala/peripheral/UART.scala 40:25]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 47:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 50:27]
        shiftReg <= _shiftReg_T_1; // @[src/main/scala/peripheral/UART.scala 52:16]
      end else if (io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 55:30]
        shiftReg <= _shiftReg_T_3; // @[src/main/scala/peripheral/UART.scala 56:18]
      end else begin
        shiftReg <= 11'h7ff; // @[src/main/scala/peripheral/UART.scala 59:18]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 41:23]
      cntReg <= 20'h0; // @[src/main/scala/peripheral/UART.scala 41:23]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 47:24]
      cntReg <= 20'h43c; // @[src/main/scala/peripheral/UART.scala 49:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[src/main/scala/peripheral/UART.scala 64:12]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 42:24]
      bitsReg <= 4'h0; // @[src/main/scala/peripheral/UART.scala 42:24]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 47:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 50:27]
        bitsReg <= _bitsReg_T_1; // @[src/main/scala/peripheral/UART.scala 53:15]
      end else if (io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 55:30]
        bitsReg <= 4'hb; // @[src/main/scala/peripheral/UART.scala 57:17]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  bitsReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Buffer(
  input        clock,
  input        reset,
  input        io_in_valid, // @[src/main/scala/peripheral/UART.scala 121:14]
  input  [7:0] io_in_bits, // @[src/main/scala/peripheral/UART.scala 121:14]
  input        io_out_ready, // @[src/main/scala/peripheral/UART.scala 121:14]
  output       io_out_valid, // @[src/main/scala/peripheral/UART.scala 121:14]
  output [7:0] io_out_bits // @[src/main/scala/peripheral/UART.scala 121:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[src/main/scala/peripheral/UART.scala 127:25]
  reg [7:0] dataReg; // @[src/main/scala/peripheral/UART.scala 128:24]
  wire  _io_in_ready_T = ~stateReg; // @[src/main/scala/peripheral/UART.scala 130:27]
  wire  _GEN_1 = io_in_valid | stateReg; // @[src/main/scala/peripheral/UART.scala 134:23 136:16 127:25]
  assign io_out_valid = stateReg; // @[src/main/scala/peripheral/UART.scala 131:28]
  assign io_out_bits = dataReg; // @[src/main/scala/peripheral/UART.scala 143:15]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 127:25]
      stateReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 127:25]
    end else if (_io_in_ready_T) begin // @[src/main/scala/peripheral/UART.scala 133:28]
      stateReg <= _GEN_1;
    end else if (io_out_ready) begin // @[src/main/scala/peripheral/UART.scala 139:24]
      stateReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 140:16]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 128:24]
      dataReg <= 8'h0; // @[src/main/scala/peripheral/UART.scala 128:24]
    end else if (_io_in_ready_T) begin // @[src/main/scala/peripheral/UART.scala 133:28]
      if (io_in_valid) begin // @[src/main/scala/peripheral/UART.scala 134:23]
        dataReg <= io_in_bits; // @[src/main/scala/peripheral/UART.scala 135:15]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BufferedTx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/peripheral/UART.scala 150:14]
  input        io_channel_valid, // @[src/main/scala/peripheral/UART.scala 150:14]
  input  [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 150:14]
);
  wire  tx_clock; // @[src/main/scala/peripheral/UART.scala 155:18]
  wire  tx_reset; // @[src/main/scala/peripheral/UART.scala 155:18]
  wire  tx_io_txd; // @[src/main/scala/peripheral/UART.scala 155:18]
  wire  tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 155:18]
  wire  tx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 155:18]
  wire [7:0] tx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 155:18]
  wire  buf__clock; // @[src/main/scala/peripheral/UART.scala 156:19]
  wire  buf__reset; // @[src/main/scala/peripheral/UART.scala 156:19]
  wire  buf__io_in_valid; // @[src/main/scala/peripheral/UART.scala 156:19]
  wire [7:0] buf__io_in_bits; // @[src/main/scala/peripheral/UART.scala 156:19]
  wire  buf__io_out_ready; // @[src/main/scala/peripheral/UART.scala 156:19]
  wire  buf__io_out_valid; // @[src/main/scala/peripheral/UART.scala 156:19]
  wire [7:0] buf__io_out_bits; // @[src/main/scala/peripheral/UART.scala 156:19]
  Tx tx ( // @[src/main/scala/peripheral/UART.scala 155:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Buffer buf_ ( // @[src/main/scala/peripheral/UART.scala 156:19]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_in_valid(buf__io_in_valid),
    .io_in_bits(buf__io_in_bits),
    .io_out_ready(buf__io_out_ready),
    .io_out_valid(buf__io_out_valid),
    .io_out_bits(buf__io_out_bits)
  );
  assign io_txd = tx_io_txd; // @[src/main/scala/peripheral/UART.scala 160:10]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = buf__io_out_valid; // @[src/main/scala/peripheral/UART.scala 159:17]
  assign tx_io_channel_bits = buf__io_out_bits; // @[src/main/scala/peripheral/UART.scala 159:17]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_in_valid = io_channel_valid; // @[src/main/scala/peripheral/UART.scala 158:13]
  assign buf__io_in_bits = io_channel_bits; // @[src/main/scala/peripheral/UART.scala 158:13]
  assign buf__io_out_ready = tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 159:17]
endmodule
module Rx(
  input        clock,
  input        reset,
  input        io_rxd, // @[src/main/scala/peripheral/UART.scala 77:14]
  input        io_channel_ready, // @[src/main/scala/peripheral/UART.scala 77:14]
  output       io_channel_valid, // @[src/main/scala/peripheral/UART.scala 77:14]
  output [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 77:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  rxReg_REG; // @[src/main/scala/peripheral/UART.scala 87:30]
  reg  rxReg; // @[src/main/scala/peripheral/UART.scala 87:22]
  reg [7:0] shiftReg; // @[src/main/scala/peripheral/UART.scala 89:25]
  reg [19:0] cntReg; // @[src/main/scala/peripheral/UART.scala 90:23]
  reg [3:0] bitsReg; // @[src/main/scala/peripheral/UART.scala 91:24]
  reg  valReg; // @[src/main/scala/peripheral/UART.scala 92:23]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[src/main/scala/peripheral/UART.scala 95:22]
  wire [7:0] _shiftReg_T_1 = {rxReg,shiftReg[7:1]}; // @[src/main/scala/peripheral/UART.scala 98:20]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[src/main/scala/peripheral/UART.scala 99:24]
  wire  _GEN_0 = bitsReg == 4'h1 | valReg; // @[src/main/scala/peripheral/UART.scala 101:27 102:14 92:23]
  assign io_channel_valid = valReg; // @[src/main/scala/peripheral/UART.scala 114:20]
  assign io_channel_bits = shiftReg; // @[src/main/scala/peripheral/UART.scala 113:19]
  always @(posedge clock) begin
    rxReg_REG <= reset | io_rxd; // @[src/main/scala/peripheral/UART.scala 87:{30,30,30}]
    rxReg <= reset | rxReg_REG; // @[src/main/scala/peripheral/UART.scala 87:{22,22,22}]
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 89:25]
      shiftReg <= 8'h0; // @[src/main/scala/peripheral/UART.scala 89:25]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 94:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 96:31]
        shiftReg <= _shiftReg_T_1; // @[src/main/scala/peripheral/UART.scala 98:14]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 90:23]
      cntReg <= 20'h0; // @[src/main/scala/peripheral/UART.scala 90:23]
    end else if (cntReg != 20'h0) begin // @[src/main/scala/peripheral/UART.scala 94:24]
      cntReg <= _cntReg_T_1; // @[src/main/scala/peripheral/UART.scala 95:12]
    end else if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 96:31]
      cntReg <= 20'h43c; // @[src/main/scala/peripheral/UART.scala 97:12]
    end else if (~rxReg) begin // @[src/main/scala/peripheral/UART.scala 104:29]
      cntReg <= 20'h65b; // @[src/main/scala/peripheral/UART.scala 105:12]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 91:24]
      bitsReg <= 4'h0; // @[src/main/scala/peripheral/UART.scala 91:24]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 94:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 96:31]
        bitsReg <= _bitsReg_T_1; // @[src/main/scala/peripheral/UART.scala 99:13]
      end else if (~rxReg) begin // @[src/main/scala/peripheral/UART.scala 104:29]
        bitsReg <= 4'h8; // @[src/main/scala/peripheral/UART.scala 106:13]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 92:23]
      valReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 92:23]
    end else if (valReg & io_channel_ready) begin // @[src/main/scala/peripheral/UART.scala 109:36]
      valReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 110:12]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 94:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 96:31]
        valReg <= _GEN_0;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rxReg_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  shiftReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[19:0];
  _RAND_4 = {1{`RANDOM}};
  bitsReg = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  valReg = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Uart(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input  [7:0]  io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  input  [7:0]  io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/UART.scala 164:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/UART.scala 164:14]
  input         io_rxd, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_txd, // @[src/main/scala/peripheral/UART.scala 164:14]
  output        io_signal_interrupt // @[src/main/scala/peripheral/UART.scala 164:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  slave_clock; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_reset; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire [7:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire [7:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_bundle_read; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire [7:0] slave_io_bundle_address; // @[src/main/scala/peripheral/UART.scala 173:21]
  wire  tx_clock; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  tx_reset; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  tx_io_txd; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  tx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire [7:0] tx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 176:18]
  wire  rx_clock; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_reset; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_io_rxd; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire  rx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 177:18]
  wire [7:0] rx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 177:18]
  reg  interrupt; // @[src/main/scala/peripheral/UART.scala 171:26]
  reg [7:0] rxData; // @[src/main/scala/peripheral/UART.scala 172:23]
  wire [7:0] _GEN_0 = slave_io_bundle_address == 8'hc ? rxData : 8'h0; // @[src/main/scala/peripheral/UART.scala 179:29 184:51 185:33]
  wire  _GEN_1 = slave_io_bundle_address == 8'hc ? 1'h0 : interrupt; // @[src/main/scala/peripheral/UART.scala 184:51 186:17 171:26]
  wire [16:0] _GEN_2 = slave_io_bundle_address == 8'h4 ? 17'h1c200 : {{9'd0}, _GEN_0}; // @[src/main/scala/peripheral/UART.scala 182:45 183:33]
  wire  _GEN_3 = slave_io_bundle_address == 8'h4 ? interrupt : _GEN_1; // @[src/main/scala/peripheral/UART.scala 171:26 182:45]
  wire [16:0] _GEN_4 = slave_io_bundle_read ? _GEN_2 : 17'h0; // @[src/main/scala/peripheral/UART.scala 179:29 181:30]
  wire  _GEN_5 = slave_io_bundle_read ? _GEN_3 : interrupt; // @[src/main/scala/peripheral/UART.scala 171:26 181:30]
  wire  _T_3 = slave_io_bundle_address == 8'h10; // @[src/main/scala/peripheral/UART.scala 195:40]
  wire [31:0] _GEN_7 = slave_io_bundle_address == 8'h10 ? slave_io_bundle_write_data : 32'h0; // @[src/main/scala/peripheral/UART.scala 191:22 195:52 197:26]
  wire  _GEN_8 = slave_io_bundle_address == 8'h8 ? slave_io_bundle_write_data != 32'h0 : _GEN_5; // @[src/main/scala/peripheral/UART.scala 193:45 194:17]
  wire  _GEN_9 = slave_io_bundle_address == 8'h8 ? 1'h0 : _T_3; // @[src/main/scala/peripheral/UART.scala 190:23 193:45]
  wire [31:0] _GEN_10 = slave_io_bundle_address == 8'h8 ? 32'h0 : _GEN_7; // @[src/main/scala/peripheral/UART.scala 191:22 193:45]
  wire  _GEN_11 = slave_io_bundle_write ? _GEN_8 : _GEN_5; // @[src/main/scala/peripheral/UART.scala 192:31]
  wire [31:0] _GEN_13 = slave_io_bundle_write ? _GEN_10 : 32'h0; // @[src/main/scala/peripheral/UART.scala 191:22 192:31]
  wire  _GEN_16 = rx_io_channel_valid | _GEN_11; // @[src/main/scala/peripheral/UART.scala 206:29 209:15]
  AXI4LiteSlave slave ( // @[src/main/scala/peripheral/UART.scala 173:21]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_read(slave_io_bundle_read),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_write_data(slave_io_bundle_write_data),
    .io_bundle_address(slave_io_bundle_address)
  );
  BufferedTx tx ( // @[src/main/scala/peripheral/UART.scala 176:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Rx rx ( // @[src/main/scala/peripheral/UART.scala 177:18]
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rxd(rx_io_rxd),
    .io_channel_ready(rx_io_channel_ready),
    .io_channel_valid(rx_io_channel_valid),
    .io_channel_bits(rx_io_channel_bits)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign io_txd = tx_io_txd; // @[src/main/scala/peripheral/UART.scala 201:10]
  assign io_signal_interrupt = interrupt; // @[src/main/scala/peripheral/UART.scala 204:23]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_address_channel_AWADDR = io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_read_address_channel_ARADDR = io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/UART.scala 174:21]
  assign slave_io_bundle_read_data = {{15'd0}, _GEN_4};
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = slave_io_bundle_write & _GEN_9; // @[src/main/scala/peripheral/UART.scala 190:23 192:31]
  assign tx_io_channel_bits = _GEN_13[7:0];
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rxd = io_rxd; // @[src/main/scala/peripheral/UART.scala 202:13]
  assign rx_io_channel_ready = rx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 205:23 206:29 207:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 171:26]
      interrupt <= 1'h0; // @[src/main/scala/peripheral/UART.scala 171:26]
    end else begin
      interrupt <= _GEN_16;
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 172:23]
      rxData <= 8'h0; // @[src/main/scala/peripheral/UART.scala 172:23]
    end else if (rx_io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 206:29]
      rxData <= rx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 208:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  interrupt = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxData = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input        io_jump_flag, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_if, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_mem, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_clint, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_bus, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input  [4:0] io_rs1_id, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input  [4:0] io_rs2_id, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_memory_read_enable_ex, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input  [4:0] io_rd_ex, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_if_flush, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_id_flush, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_pc_stall, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_if_stall, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_id_stall, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_ex_stall // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
);
  wire  id_hazard = io_memory_read_enable_ex & (io_rd_ex == io_rs1_id | io_rd_ex == io_rs2_id); // @[src/main/scala/riscv/core/fivestage/Control.scala 40:44]
  wire  _io_pc_stall_T = io_stall_flag_mem | io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/Control.scala 44:36]
  assign io_if_flush = io_jump_flag; // @[src/main/scala/riscv/core/fivestage/Control.scala 41:15]
  assign io_id_flush = io_memory_read_enable_ex & (io_rd_ex == io_rs1_id | io_rd_ex == io_rs2_id); // @[src/main/scala/riscv/core/fivestage/Control.scala 40:44]
  assign io_pc_stall = io_stall_flag_mem | io_stall_flag_clint | id_hazard | io_stall_flag_bus | io_stall_flag_if; // @[src/main/scala/riscv/core/fivestage/Control.scala 44:93]
  assign io_if_stall = _io_pc_stall_T | id_hazard; // @[src/main/scala/riscv/core/fivestage/Control.scala 45:59]
  assign io_id_stall = io_stall_flag_mem | io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/Control.scala 46:36]
  assign io_ex_stall = io_stall_flag_mem | io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/Control.scala 47:36]
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input         io_write_enable, // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]
  input  [4:0]  io_write_address, // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]
  input  [31:0] io_write_data, // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]
  input  [4:0]  io_read_address1, // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]
  input  [4:0]  io_read_address2, // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]
  output [31:0] io_read_data1, // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]
  output [31:0] io_read_data2 // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] registers_0; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_1; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_2; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_3; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_4; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_5; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_6; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_7; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_8; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_9; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_10; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_11; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_12; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_13; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_14; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_15; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_16; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_17; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_18; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_19; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_20; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_21; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_22; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_23; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_24; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_25; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_26; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_27; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_28; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_29; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_30; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  reg [31:0] registers_31; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
  wire  _io_read_data1_T = io_read_address1 == 5'h0; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 57:25]
  wire  _io_read_data1_T_2 = io_read_address1 == io_write_address & io_write_enable; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 58:46]
  wire [31:0] _GEN_97 = 5'h1 == io_read_address1 ? registers_1 : registers_0; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_98 = 5'h2 == io_read_address1 ? registers_2 : _GEN_97; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_99 = 5'h3 == io_read_address1 ? registers_3 : _GEN_98; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_100 = 5'h4 == io_read_address1 ? registers_4 : _GEN_99; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_101 = 5'h5 == io_read_address1 ? registers_5 : _GEN_100; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_102 = 5'h6 == io_read_address1 ? registers_6 : _GEN_101; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_103 = 5'h7 == io_read_address1 ? registers_7 : _GEN_102; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_104 = 5'h8 == io_read_address1 ? registers_8 : _GEN_103; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_105 = 5'h9 == io_read_address1 ? registers_9 : _GEN_104; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_106 = 5'ha == io_read_address1 ? registers_10 : _GEN_105; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_107 = 5'hb == io_read_address1 ? registers_11 : _GEN_106; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_108 = 5'hc == io_read_address1 ? registers_12 : _GEN_107; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_109 = 5'hd == io_read_address1 ? registers_13 : _GEN_108; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_110 = 5'he == io_read_address1 ? registers_14 : _GEN_109; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_111 = 5'hf == io_read_address1 ? registers_15 : _GEN_110; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_112 = 5'h10 == io_read_address1 ? registers_16 : _GEN_111; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_113 = 5'h11 == io_read_address1 ? registers_17 : _GEN_112; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_114 = 5'h12 == io_read_address1 ? registers_18 : _GEN_113; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_115 = 5'h13 == io_read_address1 ? registers_19 : _GEN_114; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_116 = 5'h14 == io_read_address1 ? registers_20 : _GEN_115; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_117 = 5'h15 == io_read_address1 ? registers_21 : _GEN_116; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_118 = 5'h16 == io_read_address1 ? registers_22 : _GEN_117; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_119 = 5'h17 == io_read_address1 ? registers_23 : _GEN_118; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_120 = 5'h18 == io_read_address1 ? registers_24 : _GEN_119; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_121 = 5'h19 == io_read_address1 ? registers_25 : _GEN_120; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_122 = 5'h1a == io_read_address1 ? registers_26 : _GEN_121; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_123 = 5'h1b == io_read_address1 ? registers_27 : _GEN_122; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_124 = 5'h1c == io_read_address1 ? registers_28 : _GEN_123; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_125 = 5'h1d == io_read_address1 ? registers_29 : _GEN_124; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_126 = 5'h1e == io_read_address1 ? registers_30 : _GEN_125; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_127 = 5'h1f == io_read_address1 ? registers_31 : _GEN_126; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _io_read_data1_T_3 = _io_read_data1_T_2 ? io_write_data : _GEN_127; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_read_data2_T = io_read_address2 == 5'h0; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 65:25]
  wire  _io_read_data2_T_2 = io_read_address2 == io_write_address & io_write_enable; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 66:46]
  wire [31:0] _GEN_129 = 5'h1 == io_read_address2 ? registers_1 : registers_0; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_130 = 5'h2 == io_read_address2 ? registers_2 : _GEN_129; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_131 = 5'h3 == io_read_address2 ? registers_3 : _GEN_130; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_132 = 5'h4 == io_read_address2 ? registers_4 : _GEN_131; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_133 = 5'h5 == io_read_address2 ? registers_5 : _GEN_132; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_134 = 5'h6 == io_read_address2 ? registers_6 : _GEN_133; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_135 = 5'h7 == io_read_address2 ? registers_7 : _GEN_134; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_136 = 5'h8 == io_read_address2 ? registers_8 : _GEN_135; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_137 = 5'h9 == io_read_address2 ? registers_9 : _GEN_136; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_138 = 5'ha == io_read_address2 ? registers_10 : _GEN_137; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_139 = 5'hb == io_read_address2 ? registers_11 : _GEN_138; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_140 = 5'hc == io_read_address2 ? registers_12 : _GEN_139; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_141 = 5'hd == io_read_address2 ? registers_13 : _GEN_140; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_142 = 5'he == io_read_address2 ? registers_14 : _GEN_141; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_143 = 5'hf == io_read_address2 ? registers_15 : _GEN_142; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_144 = 5'h10 == io_read_address2 ? registers_16 : _GEN_143; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_145 = 5'h11 == io_read_address2 ? registers_17 : _GEN_144; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_146 = 5'h12 == io_read_address2 ? registers_18 : _GEN_145; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_147 = 5'h13 == io_read_address2 ? registers_19 : _GEN_146; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_148 = 5'h14 == io_read_address2 ? registers_20 : _GEN_147; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_149 = 5'h15 == io_read_address2 ? registers_21 : _GEN_148; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_150 = 5'h16 == io_read_address2 ? registers_22 : _GEN_149; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_151 = 5'h17 == io_read_address2 ? registers_23 : _GEN_150; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_152 = 5'h18 == io_read_address2 ? registers_24 : _GEN_151; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_153 = 5'h19 == io_read_address2 ? registers_25 : _GEN_152; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_154 = 5'h1a == io_read_address2 ? registers_26 : _GEN_153; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_155 = 5'h1b == io_read_address2 ? registers_27 : _GEN_154; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_156 = 5'h1c == io_read_address2 ? registers_28 : _GEN_155; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_157 = 5'h1d == io_read_address2 ? registers_29 : _GEN_156; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_158 = 5'h1e == io_read_address2 ? registers_30 : _GEN_157; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_159 = 5'h1f == io_read_address2 ? registers_31 : _GEN_158; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _io_read_data2_T_3 = _io_read_data2_T_2 ? io_write_data : _GEN_159; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_read_data1 = _io_read_data1_T ? 32'h0 : _io_read_data1_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_read_data2 = _io_read_data2_T ? 32'h0 : _io_read_data2_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  always @(posedge clock) begin
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h0 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_0 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h1 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_1 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h2 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_2 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h3 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_3 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h4 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_4 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h5 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_5 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h6 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_6 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h7 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_7 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h8 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_8 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h9 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_9 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'ha == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_10 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'hb == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_11 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'hc == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_12 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'hd == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_13 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'he == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_14 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'hf == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_15 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h10 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_16 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h11 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_17 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h12 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_18 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h13 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_19 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h14 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_20 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h15 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_21 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h16 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_22 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h17 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_23 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h18 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_24 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h19 == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_25 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h1a == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_26 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h1b == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_27 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h1c == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_28 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h1d == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_29 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h1e == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_30 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        if (5'h1f == io_write_address) begin // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
          registers_31 <= io_write_data; // @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  registers_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registers_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registers_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registers_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registers_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registers_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registers_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registers_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registers_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registers_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registers_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registers_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registers_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  registers_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  registers_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  registers_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  registers_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  registers_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  registers_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  registers_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  registers_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  registers_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  registers_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  registers_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  registers_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  registers_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  registers_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  registers_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  registers_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InstructionFetch(
  input         clock,
  input         reset,
  input         io_stall_flag_ctrl, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  input         io_jump_flag_id, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  input  [31:0] io_jump_address_id, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  input         io_instruction_valid, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  input  [31:0] io_bus_data, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  output        io_ctrl_stall_flag, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  output [31:0] io_id_instruction_address, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
  output [31:0] io_id_instruction // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 26:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 41:29]
  reg [31:0] pc; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 42:19]
  wire [31:0] _pc_T_1 = pc + 32'h4; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 47:8]
  wire  _T = ~io_instruction_valid; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 53:8]
  wire  _GEN_0 = io_jump_flag_id | pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 54:27 55:20 41:29]
  wire  _GEN_1 = ~io_instruction_valid ? _GEN_0 : pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 41:29 53:31]
  assign io_bus_address = pc; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 67:18]
  assign io_ctrl_stall_flag = _T | pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 65:47]
  assign io_id_instruction_address = pc; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 66:29]
  assign io_id_instruction = io_instruction_valid & ~io_jump_flag_id & ~pending_jump ? io_bus_data : 32'h13; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 63:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 41:29]
      pending_jump <= 1'h0; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 41:29]
    end else if (io_instruction_valid) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 58:30]
      if (pending_jump) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 59:24]
        pending_jump <= 1'h0; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 60:20]
      end else begin
        pending_jump <= _GEN_1;
      end
    end else begin
      pending_jump <= _GEN_1;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 42:19]
      pc <= 32'h1000; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 42:19]
    end else if (io_jump_flag_id) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= io_jump_address_id;
    end else if (!(io_stall_flag_ctrl)) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= _pc_T_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pending_jump = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pc = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister(
  input         clock,
  input         reset,
  input         io_write_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input         io_flush_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
      reg_ <= 32'h13; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    end else if (io_write_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    end else if (io_flush_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
      reg_ <= 32'h13; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_1(
  input         clock,
  input         reset,
  input         io_write_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input         io_flush_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
      reg_ <= 32'h1000; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    end else if (io_write_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    end else if (io_flush_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
      reg_ <= 32'h1000; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_2(
  input         clock,
  input         reset,
  input         io_write_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input         io_flush_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
      reg_ <= 32'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    end else if (io_write_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    end else if (io_flush_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
      reg_ <= 32'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IF2ID(
  input         clock,
  input         reset,
  input         io_stall_flag, // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
  input         io_flush_enable, // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
  output [31:0] io_output_instruction, // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
  output [31:0] io_output_interrupt_flag // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]
);
  wire  instruction_clock; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
  wire  instruction_reset; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
  wire  instruction_io_write_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
  wire  instruction_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
  wire [31:0] instruction_io_in; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
  wire [31:0] instruction_io_out; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
  wire  instruction_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
  wire  instruction_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
  wire  interrupt_flag_clock; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
  wire  interrupt_flag_reset; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
  wire  interrupt_flag_io_write_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
  wire  interrupt_flag_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
  wire [31:0] interrupt_flag_io_in; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
  wire [31:0] interrupt_flag_io_out; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
  PipelineRegister instruction ( // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
    .clock(instruction_clock),
    .reset(instruction_reset),
    .io_write_enable(instruction_io_write_enable),
    .io_flush_enable(instruction_io_flush_enable),
    .io_in(instruction_io_in),
    .io_out(instruction_io_out)
  );
  PipelineRegister_1 instruction_address ( // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_write_enable(instruction_address_io_write_enable),
    .io_flush_enable(instruction_address_io_flush_enable),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_2 interrupt_flag ( // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
    .clock(interrupt_flag_clock),
    .reset(interrupt_flag_reset),
    .io_write_enable(interrupt_flag_io_write_enable),
    .io_flush_enable(interrupt_flag_io_flush_enable),
    .io_in(interrupt_flag_io_in),
    .io_out(interrupt_flag_io_out)
  );
  assign io_output_instruction = instruction_io_out; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 39:25]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 45:33]
  assign io_output_interrupt_flag = interrupt_flag_io_out; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 51:28]
  assign instruction_clock = clock;
  assign instruction_reset = reset;
  assign instruction_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 33:22]
  assign instruction_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 38:31]
  assign instruction_io_in = io_instruction; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 36:21]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 33:22]
  assign instruction_address_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 44:39]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 42:29]
  assign interrupt_flag_clock = clock;
  assign interrupt_flag_reset = reset;
  assign interrupt_flag_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 33:22]
  assign interrupt_flag_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 50:34]
  assign interrupt_flag_io_in = io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/IF2ID.scala 48:24]
endmodule
module InstructionDecode(
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input         io_interrupt_assert, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input  [31:0] io_interrupt_handler_address, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [4:0]  io_regs_reg1_read_address, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [4:0]  io_regs_reg2_read_address, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [31:0] io_ex_immediate, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_ex_aluop1_source, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_ex_aluop2_source, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_ex_memory_read_enable, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_ex_memory_write_enable, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [1:0]  io_ex_reg_write_source, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_ex_reg_write_enable, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [4:0]  io_ex_reg_write_address, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [11:0] io_ex_csr_address, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_ex_csr_write_enable, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_if_jump_flag, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [31:0] io_if_jump_address // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
);
  wire [6:0] opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 161:30]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 162:30]
  wire [4:0] rd = io_instruction[11:7]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 164:26]
  wire [4:0] rs1 = io_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 165:27]
  wire  _io_regs_reg1_read_address_T = opcode == 7'h37; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 168:43]
  wire [19:0] _immediate_T_2 = io_instruction[31] ? 20'hfffff : 20'h0; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 174:13]
  wire [31:0] _immediate_T_4 = {_immediate_T_2,io_instruction[31:20]}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 174:8]
  wire [20:0] _immediate_T_7 = io_instruction[31] ? 21'h1fffff : 21'h0; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 176:37]
  wire [31:0] _immediate_T_9 = {_immediate_T_7,io_instruction[30:20]}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 176:32]
  wire [31:0] _immediate_T_25 = {_immediate_T_7,io_instruction[30:25],rd}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:32]
  wire [31:0] _immediate_T_32 = {_immediate_T_2,io_instruction[7],io_instruction[30:25],io_instruction[11:8],1'h0}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 180:32]
  wire [31:0] _immediate_T_34 = {io_instruction[31:12],12'h0}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:30]
  wire [11:0] _immediate_T_39 = io_instruction[31] ? 12'hfff : 12'h0; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 183:35]
  wire [31:0] _immediate_T_43 = {_immediate_T_39,io_instruction[19:12],io_instruction[20],io_instruction[30:21],1'h0}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 183:30]
  wire [31:0] _immediate_T_45 = 7'h13 == opcode ? _immediate_T_9 : _immediate_T_4; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _immediate_T_47 = 7'h3 == opcode ? _immediate_T_9 : _immediate_T_45; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _immediate_T_49 = 7'h67 == opcode ? _immediate_T_9 : _immediate_T_47; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _immediate_T_51 = 7'h23 == opcode ? _immediate_T_25 : _immediate_T_49; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _immediate_T_53 = 7'h63 == opcode ? _immediate_T_32 : _immediate_T_51; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _immediate_T_55 = 7'h37 == opcode ? _immediate_T_34 : _immediate_T_53; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _immediate_T_57 = 7'h17 == opcode ? _immediate_T_34 : _immediate_T_55; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_ex_aluop1_source_T = opcode == 7'h17; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 188:12]
  wire  _io_ex_aluop1_source_T_1 = opcode == 7'h63; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 188:45]
  wire  _io_ex_aluop1_source_T_3 = opcode == 7'h6f; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 188:78]
  wire  _io_ex_aluop2_source_T = opcode == 7'h33; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 193:12]
  wire  _io_ex_memory_read_enable_T = opcode == 7'h3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 197:38]
  wire [1:0] _io_ex_reg_write_source_T_1 = 7'h3 == opcode ? 2'h1 : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_ex_reg_write_source_T_3 = 7'h73 == opcode ? 2'h2 : _io_ex_reg_write_source_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_ex_reg_write_source_T_5 = 7'h6f == opcode ? 2'h3 : _io_ex_reg_write_source_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_ex_reg_write_enable_T_4 = _io_ex_aluop2_source_T | opcode == 7'h13 | _io_ex_memory_read_enable_T; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 209:97]
  wire  _io_ex_reg_write_enable_T_10 = _io_ex_reg_write_enable_T_4 | _io_ex_aluop1_source_T |
    _io_regs_reg1_read_address_T | _io_ex_aluop1_source_T_3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 210:105]
  wire  _io_ex_reg_write_enable_T_11 = opcode == 7'h67; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 211:46]
  wire  _io_ex_reg_write_enable_T_13 = opcode == 7'h73; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 211:80]
  wire  _io_ex_csr_write_enable_T_4 = funct3 == 3'h2; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 216:14]
  wire  _io_ex_csr_write_enable_T_5 = funct3 == 3'h1 | funct3 == 3'h5 | _io_ex_csr_write_enable_T_4; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:83]
  wire  _io_ex_csr_write_enable_T_8 = funct3 == 3'h3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 217:14]
  wire  _io_ex_csr_write_enable_T_9 = _io_ex_csr_write_enable_T_5 | funct3 == 3'h6 | _io_ex_csr_write_enable_T_8; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 216:85]
  wire  _io_ex_csr_write_enable_T_11 = _io_ex_csr_write_enable_T_9 | funct3 == 3'h7; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 217:44]
  wire  _io_if_jump_flag_T_1 = io_interrupt_assert | _io_ex_aluop1_source_T_3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 219:42]
  wire  _io_if_jump_flag_T_3 = _io_if_jump_flag_T_1 | _io_ex_reg_write_enable_T_11; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 220:35]
  wire  _io_if_jump_flag_T_5 = io_reg1_data == io_reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 226:48]
  wire  _io_if_jump_flag_T_6 = io_reg1_data != io_reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 227:48]
  wire  _io_if_jump_flag_T_9 = $signed(io_reg1_data) < $signed(io_reg2_data); // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 228:55]
  wire  _io_if_jump_flag_T_12 = $signed(io_reg1_data) >= $signed(io_reg2_data); // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 229:55]
  wire  _io_if_jump_flag_T_13 = io_reg1_data < io_reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 230:56]
  wire  _io_if_jump_flag_T_14 = io_reg1_data >= io_reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 231:56]
  wire  _io_if_jump_flag_T_18 = 3'h1 == funct3 ? _io_if_jump_flag_T_6 : 3'h0 == funct3 & _io_if_jump_flag_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_if_jump_flag_T_20 = 3'h4 == funct3 ? _io_if_jump_flag_T_9 : _io_if_jump_flag_T_18; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_if_jump_flag_T_22 = 3'h5 == funct3 ? _io_if_jump_flag_T_12 : _io_if_jump_flag_T_20; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_if_jump_flag_T_24 = 3'h6 == funct3 ? _io_if_jump_flag_T_13 : _io_if_jump_flag_T_22; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_if_jump_flag_T_26 = 3'h7 == funct3 ? _io_if_jump_flag_T_14 : _io_if_jump_flag_T_24; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_if_jump_flag_T_27 = _io_ex_aluop1_source_T_1 & _io_if_jump_flag_T_26; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 222:37]
  wire [31:0] _io_if_jump_address_T_1 = _io_ex_reg_write_enable_T_11 ? io_reg1_data : io_instruction_address; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 236:26]
  wire [31:0] _io_if_jump_address_T_3 = io_ex_immediate + _io_if_jump_address_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 236:21]
  assign io_regs_reg1_read_address = opcode == 7'h37 ? 5'h0 : rs1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 168:35]
  assign io_regs_reg2_read_address = io_instruction[24:20]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 166:27]
  assign io_ex_immediate = 7'h6f == opcode ? _immediate_T_43 : _immediate_T_57; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_ex_aluop1_source = opcode == 7'h17 | opcode == 7'h63 | opcode == 7'h6f; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 188:68]
  assign io_ex_aluop2_source = _io_ex_aluop2_source_T ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 192:29]
  assign io_ex_memory_read_enable = opcode == 7'h3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 197:38]
  assign io_ex_memory_write_enable = opcode == 7'h23; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 198:39]
  assign io_ex_reg_write_source = 7'h67 == opcode ? 2'h3 : _io_ex_reg_write_source_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_ex_reg_write_enable = _io_ex_reg_write_enable_T_10 | opcode == 7'h67 | opcode == 7'h73; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 211:69]
  assign io_ex_reg_write_address = io_instruction[11:7]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 212:44]
  assign io_ex_csr_address = io_instruction[31:20]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 213:38]
  assign io_ex_csr_write_enable = _io_ex_reg_write_enable_T_13 & _io_ex_csr_write_enable_T_11; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:59]
  assign io_if_jump_flag = _io_if_jump_flag_T_3 | _io_if_jump_flag_T_27; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 221:36]
  assign io_if_jump_address = io_interrupt_assert ? io_interrupt_handler_address : _io_if_jump_address_T_3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 234:28]
endmodule
module PipelineRegister_5(
  input   clock,
  input   reset,
  input   io_write_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input   io_flush_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input   io_in, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  output  io_out // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
      reg_ <= 1'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    end else if (io_write_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    end else if (io_flush_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
      reg_ <= 1'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_6(
  input        clock,
  input        reset,
  input        io_write_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input        io_flush_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input  [4:0] io_in, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  output [4:0] io_out // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
      reg_ <= 5'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    end else if (io_write_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    end else if (io_flush_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
      reg_ <= 5'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_7(
  input        clock,
  input        reset,
  input        io_write_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input        io_flush_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input  [1:0] io_in, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  output [1:0] io_out // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
      reg_ <= 2'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    end else if (io_write_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    end else if (io_flush_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
      reg_ <= 2'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_14(
  input         clock,
  input         reset,
  input         io_write_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input         io_flush_enable, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  input  [11:0] io_in, // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
  output [11:0] io_out // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
      reg_ <= 12'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    end else if (io_write_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    end else if (io_flush_enable) begin // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
      reg_ <= 12'h0; // @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ID2EX(
  input         clock,
  input         reset,
  input         io_stall_flag, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input         io_flush_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [4:0]  io_regs_write_address, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [31:0] io_immediate, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input         io_aluop1_source, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input         io_aluop2_source, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input         io_csr_write_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [11:0] io_csr_address, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [31:0] io_output_instruction, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [4:0]  io_output_regs_write_address, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [31:0] io_output_reg1_data, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [31:0] io_output_reg2_data, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [31:0] io_output_immediate, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output        io_output_aluop1_source, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output        io_output_aluop2_source, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output        io_output_csr_write_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [11:0] io_output_csr_address, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output        io_output_memory_read_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output        io_output_memory_write_enable, // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]
);
  wire  instruction_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
  wire  instruction_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
  wire  instruction_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
  wire  instruction_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
  wire [31:0] instruction_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
  wire [31:0] instruction_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
  wire  instruction_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
  wire  instruction_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
  wire  regs_write_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
  wire  regs_write_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
  wire  regs_write_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
  wire  regs_write_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
  wire  regs_write_source_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
  wire  regs_write_source_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
  wire  reg1_data_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
  wire  reg1_data_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
  wire  reg1_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
  wire  reg1_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
  wire [31:0] reg1_data_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
  wire [31:0] reg1_data_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
  wire  reg2_data_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
  wire  reg2_data_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
  wire  reg2_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
  wire  reg2_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
  wire [31:0] reg2_data_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
  wire [31:0] reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
  wire  immediate_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
  wire  immediate_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
  wire  immediate_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
  wire  immediate_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
  wire [31:0] immediate_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
  wire [31:0] immediate_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
  wire  aluop1_source_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
  wire  aluop1_source_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
  wire  aluop1_source_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
  wire  aluop1_source_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
  wire  aluop1_source_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
  wire  aluop1_source_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
  wire  aluop2_source_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
  wire  aluop2_source_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
  wire  aluop2_source_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
  wire  aluop2_source_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
  wire  aluop2_source_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
  wire  aluop2_source_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
  wire  csr_write_enable_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
  wire  csr_write_enable_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
  wire  csr_write_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
  wire  csr_write_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
  wire  csr_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
  wire  csr_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
  wire  csr_address_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
  wire  csr_address_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
  wire  csr_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
  wire  csr_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
  wire [11:0] csr_address_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
  wire [11:0] csr_address_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
  wire  memory_read_enable_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
  wire  memory_read_enable_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
  wire  memory_read_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
  wire  memory_read_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
  wire  memory_read_enable_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
  wire  memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
  wire  memory_write_enable_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
  wire  memory_write_enable_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
  wire  memory_write_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
  wire  memory_write_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
  wire  memory_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
  wire  memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
  wire  csr_read_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
  wire  csr_read_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
  PipelineRegister instruction ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
    .clock(instruction_clock),
    .reset(instruction_reset),
    .io_write_enable(instruction_io_write_enable),
    .io_flush_enable(instruction_io_flush_enable),
    .io_in(instruction_io_in),
    .io_out(instruction_io_out)
  );
  PipelineRegister_1 instruction_address ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_write_enable(instruction_address_io_write_enable),
    .io_flush_enable(instruction_address_io_flush_enable),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_5 regs_write_enable ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_write_enable(regs_write_enable_io_write_enable),
    .io_flush_enable(regs_write_enable_io_flush_enable),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_6 regs_write_address ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_write_enable(regs_write_address_io_write_enable),
    .io_flush_enable(regs_write_address_io_flush_enable),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_7 regs_write_source ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_write_enable(regs_write_source_io_write_enable),
    .io_flush_enable(regs_write_source_io_flush_enable),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_2 reg1_data ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
    .clock(reg1_data_clock),
    .reset(reg1_data_reset),
    .io_write_enable(reg1_data_io_write_enable),
    .io_flush_enable(reg1_data_io_flush_enable),
    .io_in(reg1_data_io_in),
    .io_out(reg1_data_io_out)
  );
  PipelineRegister_2 reg2_data ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
    .clock(reg2_data_clock),
    .reset(reg2_data_reset),
    .io_write_enable(reg2_data_io_write_enable),
    .io_flush_enable(reg2_data_io_flush_enable),
    .io_in(reg2_data_io_in),
    .io_out(reg2_data_io_out)
  );
  PipelineRegister_2 immediate ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
    .clock(immediate_clock),
    .reset(immediate_reset),
    .io_write_enable(immediate_io_write_enable),
    .io_flush_enable(immediate_io_flush_enable),
    .io_in(immediate_io_in),
    .io_out(immediate_io_out)
  );
  PipelineRegister_5 aluop1_source ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
    .clock(aluop1_source_clock),
    .reset(aluop1_source_reset),
    .io_write_enable(aluop1_source_io_write_enable),
    .io_flush_enable(aluop1_source_io_flush_enable),
    .io_in(aluop1_source_io_in),
    .io_out(aluop1_source_io_out)
  );
  PipelineRegister_5 aluop2_source ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
    .clock(aluop2_source_clock),
    .reset(aluop2_source_reset),
    .io_write_enable(aluop2_source_io_write_enable),
    .io_flush_enable(aluop2_source_io_flush_enable),
    .io_in(aluop2_source_io_in),
    .io_out(aluop2_source_io_out)
  );
  PipelineRegister_5 csr_write_enable ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
    .clock(csr_write_enable_clock),
    .reset(csr_write_enable_reset),
    .io_write_enable(csr_write_enable_io_write_enable),
    .io_flush_enable(csr_write_enable_io_flush_enable),
    .io_in(csr_write_enable_io_in),
    .io_out(csr_write_enable_io_out)
  );
  PipelineRegister_14 csr_address ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
    .clock(csr_address_clock),
    .reset(csr_address_reset),
    .io_write_enable(csr_address_io_write_enable),
    .io_flush_enable(csr_address_io_flush_enable),
    .io_in(csr_address_io_in),
    .io_out(csr_address_io_out)
  );
  PipelineRegister_5 memory_read_enable ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
    .clock(memory_read_enable_clock),
    .reset(memory_read_enable_reset),
    .io_write_enable(memory_read_enable_io_write_enable),
    .io_flush_enable(memory_read_enable_io_flush_enable),
    .io_in(memory_read_enable_io_in),
    .io_out(memory_read_enable_io_out)
  );
  PipelineRegister_5 memory_write_enable ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
    .clock(memory_write_enable_clock),
    .reset(memory_write_enable_reset),
    .io_write_enable(memory_write_enable_io_write_enable),
    .io_flush_enable(memory_write_enable_io_flush_enable),
    .io_in(memory_write_enable_io_in),
    .io_out(memory_write_enable_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_write_enable(csr_read_data_io_write_enable),
    .io_flush_enable(csr_read_data_io_flush_enable),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_instruction = instruction_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 62:25]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 68:33]
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 74:31]
  assign io_output_regs_write_address = regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 80:32]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 86:31]
  assign io_output_reg1_data = reg1_data_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 92:23]
  assign io_output_reg2_data = reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 98:23]
  assign io_output_immediate = immediate_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 104:23]
  assign io_output_aluop1_source = aluop1_source_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 110:27]
  assign io_output_aluop2_source = aluop2_source_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 116:27]
  assign io_output_csr_write_enable = csr_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 122:30]
  assign io_output_csr_address = csr_address_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 128:25]
  assign io_output_memory_read_enable = memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 134:32]
  assign io_output_memory_write_enable = memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 140:33]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 146:27]
  assign instruction_clock = clock;
  assign instruction_reset = reset;
  assign instruction_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign instruction_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 61:31]
  assign instruction_io_in = io_instruction; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 59:21]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign instruction_address_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 67:39]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 65:29]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign regs_write_enable_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 73:37]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 71:27]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign regs_write_address_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 79:38]
  assign regs_write_address_io_in = io_regs_write_address; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 77:28]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign regs_write_source_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 85:37]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 83:27]
  assign reg1_data_clock = clock;
  assign reg1_data_reset = reset;
  assign reg1_data_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign reg1_data_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 91:29]
  assign reg1_data_io_in = io_reg1_data; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 89:19]
  assign reg2_data_clock = clock;
  assign reg2_data_reset = reset;
  assign reg2_data_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign reg2_data_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 97:29]
  assign reg2_data_io_in = io_reg2_data; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 95:19]
  assign immediate_clock = clock;
  assign immediate_reset = reset;
  assign immediate_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign immediate_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 103:29]
  assign immediate_io_in = io_immediate; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 101:19]
  assign aluop1_source_clock = clock;
  assign aluop1_source_reset = reset;
  assign aluop1_source_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign aluop1_source_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 109:33]
  assign aluop1_source_io_in = io_aluop1_source; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 107:23]
  assign aluop2_source_clock = clock;
  assign aluop2_source_reset = reset;
  assign aluop2_source_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign aluop2_source_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 115:33]
  assign aluop2_source_io_in = io_aluop2_source; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 113:23]
  assign csr_write_enable_clock = clock;
  assign csr_write_enable_reset = reset;
  assign csr_write_enable_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign csr_write_enable_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 121:36]
  assign csr_write_enable_io_in = io_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 119:26]
  assign csr_address_clock = clock;
  assign csr_address_reset = reset;
  assign csr_address_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign csr_address_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 127:31]
  assign csr_address_io_in = io_csr_address; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 125:21]
  assign memory_read_enable_clock = clock;
  assign memory_read_enable_reset = reset;
  assign memory_read_enable_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign memory_read_enable_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 133:38]
  assign memory_read_enable_io_in = io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 131:28]
  assign memory_write_enable_clock = clock;
  assign memory_write_enable_reset = reset;
  assign memory_write_enable_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign memory_write_enable_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 139:39]
  assign memory_write_enable_io_in = io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 137:29]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
  assign csr_read_data_io_flush_enable = io_flush_enable; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 145:33]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/ID2EX.scala 143:23]
endmodule
module ALU(
  input  [3:0]  io_func, // @[src/main/scala/riscv/core/fivestage/ALU.scala 27:14]
  input  [31:0] io_op1, // @[src/main/scala/riscv/core/fivestage/ALU.scala 27:14]
  input  [31:0] io_op2, // @[src/main/scala/riscv/core/fivestage/ALU.scala 27:14]
  output [31:0] io_result // @[src/main/scala/riscv/core/fivestage/ALU.scala 27:14]
);
  wire [31:0] _io_result_T_1 = io_op1 + io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 39:27]
  wire [31:0] _io_result_T_3 = io_op1 - io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 42:27]
  wire [62:0] _GEN_10 = {{31'd0}, io_op1}; // @[src/main/scala/riscv/core/fivestage/ALU.scala 45:27]
  wire [62:0] _io_result_T_5 = _GEN_10 << io_op2[4:0]; // @[src/main/scala/riscv/core/fivestage/ALU.scala 45:27]
  wire [31:0] _io_result_T_6 = io_op1; // @[src/main/scala/riscv/core/fivestage/ALU.scala 48:27]
  wire [31:0] _io_result_T_7 = io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 48:43]
  wire [31:0] _io_result_T_9 = io_op1 ^ io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 51:27]
  wire [31:0] _io_result_T_10 = io_op1 | io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 54:27]
  wire [31:0] _io_result_T_11 = io_op1 & io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 57:27]
  wire [31:0] _io_result_T_13 = io_op1 >> io_op2[4:0]; // @[src/main/scala/riscv/core/fivestage/ALU.scala 60:27]
  wire [31:0] _io_result_T_17 = $signed(io_op1) >>> io_op2[4:0]; // @[src/main/scala/riscv/core/fivestage/ALU.scala 63:52]
  wire  _GEN_0 = 4'ha == io_func & io_op1 < io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:13 37:19 66:17]
  wire [31:0] _GEN_1 = 4'h9 == io_func ? _io_result_T_17 : {{31'd0}, _GEN_0}; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 63:17]
  wire [31:0] _GEN_2 = 4'h8 == io_func ? _io_result_T_13 : _GEN_1; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 60:17]
  wire [31:0] _GEN_3 = 4'h7 == io_func ? _io_result_T_11 : _GEN_2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 57:17]
  wire [31:0] _GEN_4 = 4'h6 == io_func ? _io_result_T_10 : _GEN_3; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 54:17]
  wire [31:0] _GEN_5 = 4'h5 == io_func ? _io_result_T_9 : _GEN_4; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 51:17]
  wire [31:0] _GEN_6 = 4'h4 == io_func ? {{31'd0}, $signed(_io_result_T_6) < $signed(_io_result_T_7)} : _GEN_5; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 48:17]
  wire [62:0] _GEN_7 = 4'h3 == io_func ? _io_result_T_5 : {{31'd0}, _GEN_6}; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 45:17]
  wire [62:0] _GEN_8 = 4'h2 == io_func ? {{31'd0}, _io_result_T_3} : _GEN_7; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 42:17]
  wire [62:0] _GEN_9 = 4'h1 == io_func ? {{31'd0}, _io_result_T_1} : _GEN_8; // @[src/main/scala/riscv/core/fivestage/ALU.scala 37:19 39:17]
  assign io_result = _GEN_9[31:0];
endmodule
module ALUControl(
  input  [6:0] io_opcode, // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
  input  [2:0] io_funct3, // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
  input  [6:0] io_funct7, // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
  output [3:0] io_alu_funct // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
);
  wire [3:0] _io_alu_funct_T_1 = io_funct7[5] ? 4'h9 : 4'h8; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 44:39]
  wire [1:0] _io_alu_funct_T_3 = 3'h1 == io_funct3 ? 2'h3 : 2'h1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [2:0] _io_alu_funct_T_5 = 3'h2 == io_funct3 ? 3'h4 : {{1'd0}, _io_alu_funct_T_3}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_7 = 3'h3 == io_funct3 ? 4'ha : {{1'd0}, _io_alu_funct_T_5}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_9 = 3'h4 == io_funct3 ? 4'h5 : _io_alu_funct_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_11 = 3'h6 == io_funct3 ? 4'h6 : _io_alu_funct_T_9; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_13 = 3'h7 == io_funct3 ? 4'h7 : _io_alu_funct_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_15 = 3'h5 == io_funct3 ? _io_alu_funct_T_1 : _io_alu_funct_T_13; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_alu_funct_T_17 = io_funct7[5] ? 2'h2 : 2'h1; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 53:43]
  wire [1:0] _io_alu_funct_T_21 = 3'h1 == io_funct3 ? 2'h3 : _io_alu_funct_T_17; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [2:0] _io_alu_funct_T_23 = 3'h2 == io_funct3 ? 3'h4 : {{1'd0}, _io_alu_funct_T_21}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_25 = 3'h3 == io_funct3 ? 4'ha : {{1'd0}, _io_alu_funct_T_23}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_27 = 3'h4 == io_funct3 ? 4'h5 : _io_alu_funct_T_25; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_29 = 3'h6 == io_funct3 ? 4'h6 : _io_alu_funct_T_27; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_31 = 3'h7 == io_funct3 ? 4'h7 : _io_alu_funct_T_29; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_33 = 3'h5 == io_funct3 ? _io_alu_funct_T_1 : _io_alu_funct_T_31; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _GEN_1 = 7'h37 == io_opcode | 7'h17 == io_opcode; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 80:20]
  wire  _GEN_2 = 7'h67 == io_opcode | _GEN_1; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 77:20]
  wire  _GEN_3 = 7'h6f == io_opcode | _GEN_2; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 74:20]
  wire  _GEN_4 = 7'h23 == io_opcode | _GEN_3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 71:20]
  wire  _GEN_5 = 7'h3 == io_opcode | _GEN_4; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 68:20]
  wire  _GEN_6 = 7'h63 == io_opcode | _GEN_5; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 65:20]
  wire [3:0] _GEN_7 = 7'h33 == io_opcode ? _io_alu_funct_T_33 : {{3'd0}, _GEN_6}; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 49:20]
  assign io_alu_funct = 7'h13 == io_opcode ? _io_alu_funct_T_15 : _GEN_7; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 33:20]
endmodule
module Execute(
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [31:0] io_immediate, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input         io_aluop1_source, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input         io_aluop2_source, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [31:0] io_forward_from_mem, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [31:0] io_forward_from_wb, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [1:0]  io_aluop1_forward, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  input  [1:0]  io_aluop2_forward, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  output [31:0] io_mem_alu_result, // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
  output [31:0] io_csr_write_data // @[src/main/scala/riscv/core/fivestage/Execute.scala 27:14]
);
  wire [3:0] alu_io_func; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:19]
  wire [31:0] alu_io_op1; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:19]
  wire [31:0] alu_io_op2; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:19]
  wire [31:0] alu_io_result; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:19]
  wire [6:0] alu_ctrl_io_opcode; // @[src/main/scala/riscv/core/fivestage/Execute.scala 52:24]
  wire [2:0] alu_ctrl_io_funct3; // @[src/main/scala/riscv/core/fivestage/Execute.scala 52:24]
  wire [6:0] alu_ctrl_io_funct7; // @[src/main/scala/riscv/core/fivestage/Execute.scala 52:24]
  wire [3:0] alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/fivestage/Execute.scala 52:24]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 46:30]
  wire [4:0] uimm = io_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 49:28]
  wire [31:0] _alu_io_op1_T_2 = 2'h1 == io_aluop1_forward ? io_forward_from_mem : io_reg1_data; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _alu_io_op1_T_4 = 2'h2 == io_aluop1_forward ? io_forward_from_wb : _alu_io_op1_T_2; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _alu_io_op2_T_2 = 2'h1 == io_aluop2_forward ? io_forward_from_mem : io_reg2_data; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _alu_io_op2_T_4 = 2'h2 == io_aluop2_forward ? io_forward_from_wb : _alu_io_op2_T_2; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T = ~io_reg1_data; // @[src/main/scala/riscv/core/fivestage/Execute.scala 85:54]
  wire [31:0] _io_csr_write_data_T_1 = io_csr_read_data & _io_csr_write_data_T; // @[src/main/scala/riscv/core/fivestage/Execute.scala 85:52]
  wire [31:0] _io_csr_write_data_T_2 = io_csr_read_data | io_reg1_data; // @[src/main/scala/riscv/core/fivestage/Execute.scala 86:52]
  wire [31:0] _io_csr_write_data_T_3 = {27'h0,uimm}; // @[src/main/scala/riscv/core/fivestage/Execute.scala 87:38]
  wire [31:0] _io_csr_write_data_T_5 = ~_io_csr_write_data_T_3; // @[src/main/scala/riscv/core/fivestage/Execute.scala 88:55]
  wire [31:0] _io_csr_write_data_T_6 = io_csr_read_data & _io_csr_write_data_T_5; // @[src/main/scala/riscv/core/fivestage/Execute.scala 88:53]
  wire [31:0] _io_csr_write_data_T_8 = io_csr_read_data | _io_csr_write_data_T_3; // @[src/main/scala/riscv/core/fivestage/Execute.scala 89:53]
  wire [31:0] _io_csr_write_data_T_10 = 3'h1 == funct3 ? io_reg1_data : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_12 = 3'h3 == funct3 ? _io_csr_write_data_T_1 : _io_csr_write_data_T_10; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_14 = 3'h2 == funct3 ? _io_csr_write_data_T_2 : _io_csr_write_data_T_12; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_16 = 3'h5 == funct3 ? _io_csr_write_data_T_3 : _io_csr_write_data_T_14; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_18 = 3'h7 == funct3 ? _io_csr_write_data_T_6 : _io_csr_write_data_T_16; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  ALU alu ( // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:19]
    .io_func(alu_io_func),
    .io_op1(alu_io_op1),
    .io_op2(alu_io_op2),
    .io_result(alu_io_result)
  );
  ALUControl alu_ctrl ( // @[src/main/scala/riscv/core/fivestage/Execute.scala 52:24]
    .io_opcode(alu_ctrl_io_opcode),
    .io_funct3(alu_ctrl_io_funct3),
    .io_funct7(alu_ctrl_io_funct7),
    .io_alu_funct(alu_ctrl_io_alu_funct)
  );
  assign io_mem_alu_result = alu_io_result; // @[src/main/scala/riscv/core/fivestage/Execute.scala 82:21]
  assign io_csr_write_data = 3'h6 == funct3 ? _io_csr_write_data_T_8 : _io_csr_write_data_T_18; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign alu_io_func = alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/fivestage/Execute.scala 57:15]
  assign alu_io_op1 = io_aluop1_source ? io_instruction_address : _alu_io_op1_T_4; // @[src/main/scala/riscv/core/fivestage/Execute.scala 58:20]
  assign alu_io_op2 = io_aluop2_source ? io_immediate : _alu_io_op2_T_4; // @[src/main/scala/riscv/core/fivestage/Execute.scala 70:20]
  assign alu_ctrl_io_opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 45:30]
  assign alu_ctrl_io_funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 46:30]
  assign alu_ctrl_io_funct7 = io_instruction[31:25]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 47:30]
endmodule
module EX2MEM(
  input         clock,
  input         reset,
  input         io_stall_flag, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [31:0] io_regs_write_address, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output [31:0] io_output_regs_write_address, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output [31:0] io_output_instruction, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output [31:0] io_output_reg2_data, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output        io_output_memory_read_enable, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output        io_output_memory_write_enable, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output [31:0] io_output_alu_result, // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]
);
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
  wire  regs_write_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
  wire  regs_write_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
  wire  regs_write_source_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
  wire  regs_write_source_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
  wire  regs_write_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
  wire  regs_write_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
  wire  instruction_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
  wire  instruction_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
  wire  instruction_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
  wire  instruction_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
  wire  instruction_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
  wire  instruction_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
  wire [31:0] instruction_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
  wire [31:0] instruction_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
  wire  reg1_data_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
  wire  reg1_data_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
  wire  reg1_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
  wire  reg1_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
  wire [31:0] reg1_data_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
  wire [31:0] reg1_data_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
  wire  reg2_data_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
  wire  reg2_data_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
  wire  reg2_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
  wire  reg2_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
  wire [31:0] reg2_data_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
  wire [31:0] reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
  wire  alu_result_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
  wire  alu_result_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
  wire  alu_result_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
  wire  alu_result_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
  wire [31:0] alu_result_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
  wire [31:0] alu_result_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
  wire  memory_read_enable_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
  wire  memory_read_enable_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
  wire  memory_read_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
  wire  memory_read_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
  wire  memory_read_enable_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
  wire  memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
  wire  memory_write_enable_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
  wire  memory_write_enable_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
  wire  memory_write_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
  wire  memory_write_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
  wire  memory_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
  wire  memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
  wire  csr_read_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
  wire  csr_read_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
  PipelineRegister_5 regs_write_enable ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_write_enable(regs_write_enable_io_write_enable),
    .io_flush_enable(regs_write_enable_io_flush_enable),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_7 regs_write_source ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_write_enable(regs_write_source_io_write_enable),
    .io_flush_enable(regs_write_source_io_flush_enable),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_6 regs_write_address ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_write_enable(regs_write_address_io_write_enable),
    .io_flush_enable(regs_write_address_io_flush_enable),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_2 instruction_address ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_write_enable(instruction_address_io_write_enable),
    .io_flush_enable(instruction_address_io_flush_enable),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_2 instruction ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
    .clock(instruction_clock),
    .reset(instruction_reset),
    .io_write_enable(instruction_io_write_enable),
    .io_flush_enable(instruction_io_flush_enable),
    .io_in(instruction_io_in),
    .io_out(instruction_io_out)
  );
  PipelineRegister_2 reg1_data ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
    .clock(reg1_data_clock),
    .reset(reg1_data_reset),
    .io_write_enable(reg1_data_io_write_enable),
    .io_flush_enable(reg1_data_io_flush_enable),
    .io_in(reg1_data_io_in),
    .io_out(reg1_data_io_out)
  );
  PipelineRegister_2 reg2_data ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
    .clock(reg2_data_clock),
    .reset(reg2_data_reset),
    .io_write_enable(reg2_data_io_write_enable),
    .io_flush_enable(reg2_data_io_flush_enable),
    .io_in(reg2_data_io_in),
    .io_out(reg2_data_io_out)
  );
  PipelineRegister_2 alu_result ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
    .clock(alu_result_clock),
    .reset(alu_result_reset),
    .io_write_enable(alu_result_io_write_enable),
    .io_flush_enable(alu_result_io_flush_enable),
    .io_in(alu_result_io_in),
    .io_out(alu_result_io_out)
  );
  PipelineRegister_5 memory_read_enable ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
    .clock(memory_read_enable_clock),
    .reset(memory_read_enable_reset),
    .io_write_enable(memory_read_enable_io_write_enable),
    .io_flush_enable(memory_read_enable_io_flush_enable),
    .io_in(memory_read_enable_io_in),
    .io_out(memory_read_enable_io_out)
  );
  PipelineRegister_5 memory_write_enable ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
    .clock(memory_write_enable_clock),
    .reset(memory_write_enable_reset),
    .io_write_enable(memory_write_enable_io_write_enable),
    .io_flush_enable(memory_write_enable_io_flush_enable),
    .io_in(memory_write_enable_io_in),
    .io_out(memory_write_enable_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_write_enable(csr_read_data_io_write_enable),
    .io_flush_enable(csr_read_data_io_flush_enable),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 54:31]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 60:31]
  assign io_output_regs_write_address = {{27'd0}, regs_write_address_io_out}; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 66:32]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 72:33]
  assign io_output_instruction = instruction_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 78:25]
  assign io_output_reg2_data = reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 90:23]
  assign io_output_memory_read_enable = memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 102:32]
  assign io_output_memory_write_enable = memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 108:33]
  assign io_output_alu_result = alu_result_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 96:24]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 114:27]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign regs_write_enable_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 53:37]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 51:27]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign regs_write_source_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 59:37]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 57:27]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign regs_write_address_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 65:38]
  assign regs_write_address_io_in = io_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 63:28]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign instruction_address_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 71:39]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 69:29]
  assign instruction_clock = clock;
  assign instruction_reset = reset;
  assign instruction_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign instruction_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 77:31]
  assign instruction_io_in = io_instruction; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 75:21]
  assign reg1_data_clock = clock;
  assign reg1_data_reset = reset;
  assign reg1_data_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign reg1_data_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 83:29]
  assign reg1_data_io_in = io_reg1_data; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 81:19]
  assign reg2_data_clock = clock;
  assign reg2_data_reset = reset;
  assign reg2_data_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign reg2_data_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 89:29]
  assign reg2_data_io_in = io_reg2_data; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 87:19]
  assign alu_result_clock = clock;
  assign alu_result_reset = reset;
  assign alu_result_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign alu_result_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 95:30]
  assign alu_result_io_in = io_alu_result; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 93:20]
  assign memory_read_enable_clock = clock;
  assign memory_read_enable_reset = reset;
  assign memory_read_enable_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign memory_read_enable_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 101:38]
  assign memory_read_enable_io_in = io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 99:28]
  assign memory_write_enable_clock = clock;
  assign memory_write_enable_reset = reset;
  assign memory_write_enable_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign memory_write_enable_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 107:39]
  assign memory_write_enable_io_in = io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 105:29]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_write_enable = ~io_stall_flag; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
  assign csr_read_data_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 113:33]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 111:23]
endmodule
module MemoryAccess(
  input         clock,
  input         reset,
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input  [2:0]  io_funct3, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output [31:0] io_wb_memory_read_data, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_ctrl_stall_flag, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output [31:0] io_forward_to_ex, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_bus_read, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input  [31:0] io_bus_read_data, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input         io_bus_read_valid, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_bus_write, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output [31:0] io_bus_write_data, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_bus_write_strobe_0, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_bus_write_strobe_1, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_bus_write_strobe_2, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_bus_write_strobe_3, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input         io_bus_write_valid, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_bus_request, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input         io_bus_granted // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [1:0] mem_address_index = io_alu_result[1:0]; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 38:40]
  reg [1:0] mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 39:33]
  wire  _T = mem_access_state == 2'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 56:27]
  wire  _T_1 = mem_access_state == 2'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 64:33]
  wire [23:0] _io_wb_memory_read_data_T_2 = io_bus_read_data[31] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 76:23]
  wire [31:0] _io_wb_memory_read_data_T_4 = {_io_wb_memory_read_data_T_2,io_bus_read_data[31:24]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 76:18]
  wire [23:0] _io_wb_memory_read_data_T_7 = io_bus_read_data[7] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:32]
  wire [31:0] _io_wb_memory_read_data_T_9 = {_io_wb_memory_read_data_T_7,io_bus_read_data[7:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:27]
  wire [23:0] _io_wb_memory_read_data_T_12 = io_bus_read_data[15] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 79:32]
  wire [31:0] _io_wb_memory_read_data_T_14 = {_io_wb_memory_read_data_T_12,io_bus_read_data[15:8]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 79:27]
  wire [23:0] _io_wb_memory_read_data_T_17 = io_bus_read_data[23] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:32]
  wire [31:0] _io_wb_memory_read_data_T_19 = {_io_wb_memory_read_data_T_17,io_bus_read_data[23:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:27]
  wire  _io_wb_memory_read_data_T_20 = 2'h0 == mem_address_index; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_21 = 2'h0 == mem_address_index ? _io_wb_memory_read_data_T_9 :
    _io_wb_memory_read_data_T_4; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_wb_memory_read_data_T_22 = 2'h1 == mem_address_index; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_23 = 2'h1 == mem_address_index ? _io_wb_memory_read_data_T_14 :
    _io_wb_memory_read_data_T_21; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_wb_memory_read_data_T_24 = 2'h2 == mem_address_index; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_25 = 2'h2 == mem_address_index ? _io_wb_memory_read_data_T_19 :
    _io_wb_memory_read_data_T_23; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_28 = {24'h0,io_bus_read_data[31:24]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 85:18]
  wire [31:0] _io_wb_memory_read_data_T_31 = {24'h0,io_bus_read_data[7:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:27]
  wire [31:0] _io_wb_memory_read_data_T_34 = {24'h0,io_bus_read_data[15:8]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 88:27]
  wire [31:0] _io_wb_memory_read_data_T_37 = {24'h0,io_bus_read_data[23:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 89:27]
  wire [31:0] _io_wb_memory_read_data_T_39 = 2'h0 == mem_address_index ? _io_wb_memory_read_data_T_31 :
    _io_wb_memory_read_data_T_28; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_41 = 2'h1 == mem_address_index ? _io_wb_memory_read_data_T_34 :
    _io_wb_memory_read_data_T_39; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_43 = 2'h2 == mem_address_index ? _io_wb_memory_read_data_T_37 :
    _io_wb_memory_read_data_T_41; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_wb_memory_read_data_T_44 = mem_address_index == 2'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 93:33]
  wire [15:0] _io_wb_memory_read_data_T_47 = io_bus_read_data[15] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 94:23]
  wire [31:0] _io_wb_memory_read_data_T_49 = {_io_wb_memory_read_data_T_47,io_bus_read_data[15:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 94:18]
  wire [15:0] _io_wb_memory_read_data_T_52 = io_bus_read_data[31] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 95:23]
  wire [31:0] _io_wb_memory_read_data_T_54 = {_io_wb_memory_read_data_T_52,io_bus_read_data[31:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 95:18]
  wire [31:0] _io_wb_memory_read_data_T_55 = _io_wb_memory_read_data_T_44 ? _io_wb_memory_read_data_T_49 :
    _io_wb_memory_read_data_T_54; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 92:40]
  wire [31:0] _io_wb_memory_read_data_T_59 = {16'h0,io_bus_read_data[15:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 99:18]
  wire [31:0] _io_wb_memory_read_data_T_62 = {16'h0,io_bus_read_data[31:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 100:18]
  wire [31:0] _io_wb_memory_read_data_T_63 = _io_wb_memory_read_data_T_44 ? _io_wb_memory_read_data_T_59 :
    _io_wb_memory_read_data_T_62; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:41]
  wire [31:0] _io_wb_memory_read_data_T_65 = 3'h0 == io_funct3 ? _io_wb_memory_read_data_T_25 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_67 = 3'h4 == io_funct3 ? _io_wb_memory_read_data_T_43 :
    _io_wb_memory_read_data_T_65; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_69 = 3'h1 == io_funct3 ? _io_wb_memory_read_data_T_55 :
    _io_wb_memory_read_data_T_67; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_71 = 3'h5 == io_funct3 ? _io_wb_memory_read_data_T_63 :
    _io_wb_memory_read_data_T_69; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_73 = 3'h2 == io_funct3 ? io_bus_read_data : _io_wb_memory_read_data_T_71; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _GEN_1 = io_bus_read_valid ? _io_wb_memory_read_data_T_73 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 52:26 68:31 70:32]
  wire [1:0] _GEN_2 = io_bus_read_valid ? 2'h0 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 42:22 68:31 39:33]
  wire  _GEN_3 = io_bus_read_valid ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 43:24 67:26 68:31]
  wire  _GEN_6 = mem_access_state == 2'h1 & _GEN_3; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:22 64:62]
  wire [31:0] _GEN_7 = mem_access_state == 2'h1 ? _GEN_1 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 52:26 64:62]
  wire  _GEN_9 = mem_access_state == 2'h0 | _GEN_6; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 56:56 58:26]
  wire  _GEN_11 = mem_access_state == 2'h0 | _T_1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 56:56 60:22]
  wire [31:0] _GEN_13 = mem_access_state == 2'h0 ? 32'h0 : _GEN_7; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 52:26 56:56]
  wire  _GEN_17 = 2'h3 == mem_address_index; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 114:27 116:{48,48}]
  wire [4:0] _io_bus_write_data_T_1 = {mem_address_index, 3'h0}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 117:89]
  wire [39:0] _GEN_4 = {{31'd0}, io_reg2_data[8:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 117:67]
  wire [39:0] _io_bus_write_data_T_2 = _GEN_4 << _io_bus_write_data_T_1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 117:67]
  wire [32:0] _io_bus_write_data_T_5 = {io_reg2_data[16:0], 16'h0}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 128:95]
  wire [32:0] _GEN_20 = _io_wb_memory_read_data_T_44 ? {{16'd0}, io_reg2_data[16:0]} : _io_bus_write_data_T_5; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 119:41 123:29 128:29]
  wire  _GEN_21 = _io_wb_memory_read_data_T_44 ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 114:27 119:41 126:36]
  wire  _T_6 = io_funct3 == 3'h2; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 131:28]
  wire  _GEN_27 = io_funct3 == 3'h1 ? _io_wb_memory_read_data_T_44 : _T_6; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:54]
  wire [32:0] _GEN_29 = io_funct3 == 3'h1 ? _GEN_20 : {{1'd0}, io_reg2_data}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 112:25 118:54]
  wire  _GEN_30 = io_funct3 == 3'h1 ? _GEN_21 : _T_6; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:54]
  wire  _GEN_32 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_20 : _GEN_27; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:48]
  wire  _GEN_33 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_22 : _GEN_27; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:48]
  wire  _GEN_34 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_24 : _GEN_30; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:48]
  wire  _GEN_35 = io_funct3 == 3'h0 ? _GEN_17 : _GEN_30; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:48]
  wire [39:0] _GEN_36 = io_funct3 == 3'h0 ? _io_bus_write_data_T_2 : {{7'd0}, _GEN_29}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:48 117:27]
  wire [1:0] _GEN_37 = io_bus_granted ? 2'h2 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 137:28 138:26 39:33]
  wire  _T_7 = mem_access_state == 2'h2; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 140:33]
  wire [1:0] _GEN_38 = io_bus_write_valid ? 2'h0 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 144:32 42:22 39:33]
  wire  _GEN_39 = io_bus_write_valid ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 144:32 43:24 142:26]
  wire  _GEN_41 = mem_access_state == 2'h2 & _GEN_39; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 140:63 53:22]
  wire [1:0] _GEN_43 = mem_access_state == 2'h2 ? _GEN_38 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 140:63 39:33]
  wire  _GEN_44 = _T | _GEN_41; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56 111:26]
  wire [39:0] _GEN_45 = _T ? _GEN_36 : 40'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56 49:21]
  wire  _GEN_47 = _T & _GEN_32; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56 50:23]
  wire  _GEN_48 = _T & _GEN_33; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56 50:23]
  wire  _GEN_49 = _T & _GEN_34; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56 50:23]
  wire  _GEN_50 = _T & _GEN_35; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56 50:23]
  wire  _GEN_51 = _T | _T_7; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56 136:22]
  wire  _GEN_53 = io_memory_write_enable & _GEN_44; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 53:22]
  wire [39:0] _GEN_54 = io_memory_write_enable ? _GEN_45 : 40'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 49:21]
  wire  _GEN_55 = io_memory_write_enable & _T; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 51:16]
  wire  _GEN_56 = io_memory_write_enable & _GEN_47; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 50:23]
  wire  _GEN_57 = io_memory_write_enable & _GEN_48; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 50:23]
  wire  _GEN_58 = io_memory_write_enable & _GEN_49; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 50:23]
  wire  _GEN_59 = io_memory_write_enable & _GEN_50; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 50:23]
  wire  _GEN_60 = io_memory_write_enable & _GEN_51; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38 46:18]
  wire [39:0] _GEN_67 = io_memory_read_enable ? 40'h0 : _GEN_54; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 49:21 55:31]
  assign io_wb_memory_read_data = io_memory_read_enable ? _GEN_13 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 52:26 55:31]
  assign io_ctrl_stall_flag = io_memory_read_enable ? _GEN_9 : _GEN_53; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:31]
  assign io_forward_to_ex = io_regs_write_source == 2'h2 ? io_csr_read_data : io_alu_result; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 150:26]
  assign io_bus_read = io_memory_read_enable & _T; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 47:15 55:31]
  assign io_bus_address = {io_alu_result[31:2],2'h0}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 48:89]
  assign io_bus_write = io_memory_read_enable ? 1'h0 : _GEN_55; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 51:16 55:31]
  assign io_bus_write_data = _GEN_67[31:0];
  assign io_bus_write_strobe_0 = io_memory_read_enable ? 1'h0 : _GEN_56; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 50:23 55:31]
  assign io_bus_write_strobe_1 = io_memory_read_enable ? 1'h0 : _GEN_57; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 50:23 55:31]
  assign io_bus_write_strobe_2 = io_memory_read_enable ? 1'h0 : _GEN_58; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 50:23 55:31]
  assign io_bus_write_strobe_3 = io_memory_read_enable ? 1'h0 : _GEN_59; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 50:23 55:31]
  assign io_bus_request = io_memory_read_enable ? _GEN_11 : _GEN_60; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:31]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 39:33]
      mem_access_state <= 2'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 39:33]
    end else if (io_memory_read_enable) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:31]
      if (mem_access_state == 2'h0) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 56:56]
        if (io_bus_granted) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 61:28]
          mem_access_state <= 2'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 62:26]
        end
      end else if (mem_access_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 64:62]
        mem_access_state <= _GEN_2;
      end
    end else if (io_memory_write_enable) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 108:38]
      if (_T) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 109:56]
        mem_access_state <= _GEN_37;
      end else begin
        mem_access_state <= _GEN_43;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mem_access_state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MEM2WB(
  input         clock,
  input         reset,
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  input  [31:0] io_regs_write_address, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  input  [31:0] io_memory_read_data, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  output [31:0] io_output_alu_result, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  output [31:0] io_output_regs_write_address, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  output [31:0] io_output_memory_read_data, // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]
);
  wire  alu_result_clock; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
  wire  alu_result_reset; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
  wire  alu_result_io_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
  wire  alu_result_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
  wire [31:0] alu_result_io_in; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
  wire [31:0] alu_result_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
  wire  memory_read_data_clock; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
  wire  memory_read_data_reset; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
  wire  memory_read_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
  wire  memory_read_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
  wire [31:0] memory_read_data_io_in; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
  wire [31:0] memory_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
  wire  regs_write_enable_io_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
  wire  regs_write_enable_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
  wire  regs_write_source_io_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
  wire  regs_write_source_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
  wire  regs_write_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
  wire  regs_write_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
  wire  instruction_address_io_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
  wire  instruction_address_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
  wire  csr_read_data_io_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
  wire  csr_read_data_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
  PipelineRegister_2 alu_result ( // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
    .clock(alu_result_clock),
    .reset(alu_result_reset),
    .io_write_enable(alu_result_io_write_enable),
    .io_flush_enable(alu_result_io_flush_enable),
    .io_in(alu_result_io_in),
    .io_out(alu_result_io_out)
  );
  PipelineRegister_2 memory_read_data ( // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
    .clock(memory_read_data_clock),
    .reset(memory_read_data_reset),
    .io_write_enable(memory_read_data_io_write_enable),
    .io_flush_enable(memory_read_data_io_flush_enable),
    .io_in(memory_read_data_io_in),
    .io_out(memory_read_data_io_out)
  );
  PipelineRegister_5 regs_write_enable ( // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_write_enable(regs_write_enable_io_write_enable),
    .io_flush_enable(regs_write_enable_io_flush_enable),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_7 regs_write_source ( // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_write_enable(regs_write_source_io_write_enable),
    .io_flush_enable(regs_write_source_io_flush_enable),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_6 regs_write_address ( // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_write_enable(regs_write_address_io_write_enable),
    .io_flush_enable(regs_write_address_io_flush_enable),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_2 instruction_address ( // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_write_enable(instruction_address_io_write_enable),
    .io_flush_enable(instruction_address_io_flush_enable),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_write_enable(csr_read_data_io_write_enable),
    .io_flush_enable(csr_read_data_io_flush_enable),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 75:33]
  assign io_output_alu_result = alu_result_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 45:24]
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 57:31]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 63:31]
  assign io_output_regs_write_address = {{27'd0}, regs_write_address_io_out}; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 69:32]
  assign io_output_memory_read_data = memory_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 51:30]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 81:27]
  assign alu_result_clock = clock;
  assign alu_result_reset = reset;
  assign alu_result_io_write_enable = 1'h1; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 43:30]
  assign alu_result_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 44:30]
  assign alu_result_io_in = io_alu_result; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 42:20]
  assign memory_read_data_clock = clock;
  assign memory_read_data_reset = reset;
  assign memory_read_data_io_write_enable = 1'h1; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 49:36]
  assign memory_read_data_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 50:36]
  assign memory_read_data_io_in = io_memory_read_data; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 48:26]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_write_enable = 1'h1; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 55:37]
  assign regs_write_enable_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 56:37]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 54:27]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_write_enable = 1'h1; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 61:37]
  assign regs_write_source_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 62:37]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 60:27]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_write_enable = 1'h1; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 67:38]
  assign regs_write_address_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 68:38]
  assign regs_write_address_io_in = io_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 66:28]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_write_enable = 1'h1; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 73:39]
  assign instruction_address_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 74:39]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 72:29]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_write_enable = 1'h1; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 79:33]
  assign csr_read_data_io_flush_enable = 1'h0; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 80:33]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 78:23]
endmodule
module WriteBack(
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 22:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 22:14]
  input  [31:0] io_memory_read_data, // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 22:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 22:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 22:14]
  output [31:0] io_regs_write_data // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 22:14]
);
  wire [31:0] _io_regs_write_data_T_1 = io_instruction_address + 32'h4; // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 37:72]
  wire [31:0] _io_regs_write_data_T_3 = 2'h1 == io_regs_write_source ? io_memory_read_data : io_alu_result; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_regs_write_data_T_5 = 2'h2 == io_regs_write_source ? io_csr_read_data : _io_regs_write_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_regs_write_data = 2'h3 == io_regs_write_source ? _io_regs_write_data_T_1 : _io_regs_write_data_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
endmodule
module Forwarding(
  input  [4:0] io_rs1_ex, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rs2_ex, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rd_mem, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input        io_reg_write_enable_mem, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rd_wb, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input        io_reg_write_enable_wb, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  output [1:0] io_aluop1_forward_ex, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  output [1:0] io_aluop2_forward_ex // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
);
  wire  _T_1 = io_reg_write_enable_mem & io_rd_mem != 5'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 38:32]
  wire  _T_5 = io_reg_write_enable_wb & io_rd_wb != 5'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 40:37]
  wire [1:0] _GEN_0 = io_reg_write_enable_wb & io_rd_wb != 5'h0 & io_rd_wb == io_rs1_ex ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 40:84 41:26 43:26]
  wire [1:0] _GEN_2 = _T_5 & io_rd_wb == io_rs2_ex ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 48:84 49:26 51:26]
  assign io_aluop1_forward_ex = io_reg_write_enable_mem & io_rd_mem != 5'h0 & io_rd_mem == io_rs1_ex ? 2'h1 : _GEN_0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 38:81 39:26]
  assign io_aluop2_forward_ex = _T_1 & io_rd_mem == io_rs2_ex ? 2'h1 : _GEN_2; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 46:81 47:26]
endmodule
module CLINT(
  input         clock,
  input         reset,
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input  [31:0] io_instruction_address_if, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input         io_jump_flag, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input  [31:0] io_jump_address, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input  [31:0] io_csr_mtvec, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input  [31:0] io_csr_mepc, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input  [31:0] io_csr_mstatus, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  input         io_interrupt_enable, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  output        io_ctrl_stall_flag, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  output        io_csr_reg_write_enable, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  output [11:0] io_csr_reg_write_address, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  output [31:0] io_csr_reg_write_data, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  output [31:0] io_id_interrupt_handler_address, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
  output        io_id_interrupt_assert // @[src/main/scala/riscv/core/fivestage/CLINT.scala 48:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 77:26]
  reg [31:0] instruction_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 78:36]
  reg [31:0] cause; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 79:22]
  reg  interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 80:33]
  reg [31:0] interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 81:42]
  reg  csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 82:37]
  reg [11:0] csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 83:38]
  reg [31:0] csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 84:35]
  wire [1:0] _GEN_0 = io_instruction == 32'h30200073 ? 2'h3 : 2'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 93:55 94:21 96:21]
  wire [1:0] _GEN_1 = io_interrupt_flag != 32'h0 & io_interrupt_enable ? 2'h2 : _GEN_0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 91:81 92:21]
  wire [1:0] interrupt_state = io_instruction == 32'h73 | io_instruction == 32'h100073 ? 2'h1 : _GEN_1; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 89:95 90:21]
  wire  _io_ctrl_stall_flag_T_1 = csr_state != 3'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 86:78]
  wire [31:0] _instruction_address_T_1 = io_jump_address - 32'h4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 106:25]
  wire [3:0] _cause_T_1 = 32'h73 == io_instruction ? 4'hb : 4'ha; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _cause_T_3 = 32'h100073 == io_instruction ? 4'h3 : _cause_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _GEN_3 = io_interrupt_flag[0] ? 32'h80000007 : 32'h8000000b; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 120:13 121:34 122:15]
  wire [31:0] _instruction_address_T_3 = io_jump_flag ? io_jump_address : io_instruction_address_if; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 125:33]
  wire [2:0] _GEN_4 = interrupt_state == 2'h3 ? 3'h3 : csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 130:57 132:17 77:26]
  wire  _T_13 = csr_state == 3'h4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 138:24]
  wire  _T_14 = csr_state == 3'h3; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 140:24]
  wire [11:0] _csr_reg_write_address_T_2 = 3'h2 == csr_state ? 12'h341 : 12'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [11:0] _csr_reg_write_address_T_4 = 3'h4 == csr_state ? 12'h342 : _csr_reg_write_address_T_2; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [11:0] _csr_reg_write_address_T_6 = 3'h1 == csr_state ? 12'h300 : _csr_reg_write_address_T_4; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [11:0] _csr_reg_write_address_T_8 = 3'h3 == csr_state ? 12'h300 : _csr_reg_write_address_T_6; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _csr_reg_write_address_T_9 = {20'h0,_csr_reg_write_address_T_8}; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 147:31]
  wire [31:0] _csr_reg_write_data_T_2 = {io_csr_mstatus[31:4],1'h0,io_csr_mstatus[2:0]}; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 163:30]
  wire [31:0] _csr_reg_write_data_T_6 = {io_csr_mstatus[31:4],io_csr_mstatus[7],io_csr_mstatus[2:0]}; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 164:27]
  wire [31:0] _csr_reg_write_data_T_8 = 3'h2 == csr_state ? instruction_address : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _GEN_18 = reset ? 32'h0 : _csr_reg_write_address_T_9; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 147:25 83:{38,38}]
  assign io_ctrl_stall_flag = interrupt_state != 2'h0 | csr_state != 3'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 86:65]
  assign io_csr_reg_write_enable = csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 167:27]
  assign io_csr_reg_write_address = csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 168:28]
  assign io_csr_reg_write_data = csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 169:25]
  assign io_id_interrupt_handler_address = interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 182:35]
  assign io_id_interrupt_assert = interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 181:26]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 77:26]
      csr_state <= 3'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 77:26]
    end else if (csr_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 100:37]
      if (interrupt_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:57]
        csr_state <= 3'h2; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 103:17]
      end else if (interrupt_state == 2'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 118:64]
        csr_state <= 3'h2; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 124:17]
      end else begin
        csr_state <= _GEN_4;
      end
    end else if (csr_state == 3'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 134:43]
      csr_state <= 3'h1; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 135:15]
    end else if (csr_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 136:46]
      csr_state <= 3'h4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 137:15]
    end else begin
      csr_state <= 3'h0;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 78:36]
      instruction_address <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 78:36]
    end else if (csr_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 100:37]
      if (interrupt_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:57]
        if (io_jump_flag) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 104:33]
          instruction_address <= _instruction_address_T_1;
        end else begin
          instruction_address <= io_instruction_address_if;
        end
      end else if (interrupt_state == 2'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 118:64]
        instruction_address <= _instruction_address_T_3; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 125:27]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 79:22]
      cause <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 79:22]
    end else if (csr_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 100:37]
      if (interrupt_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:57]
        cause <= {{28'd0}, _cause_T_3}; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 110:13]
      end else if (interrupt_state == 2'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 118:64]
        cause <= _GEN_3;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 80:33]
      interrupt_assert <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 80:33]
    end else begin
      interrupt_assert <= _T_13 | _T_14; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 171:20]
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 81:42]
      interrupt_handler_address <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 81:42]
    end else if (3'h3 == csr_state) begin // @[src/main/scala/chisel3/util/Mux.scala 77:13]
      interrupt_handler_address <= io_csr_mepc;
    end else if (3'h4 == csr_state) begin // @[src/main/scala/chisel3/util/Mux.scala 77:13]
      interrupt_handler_address <= io_csr_mtvec;
    end else begin
      interrupt_handler_address <= 32'h0;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 82:37]
      csr_reg_write_enable <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 82:37]
    end else begin
      csr_reg_write_enable <= _io_ctrl_stall_flag_T_1; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 146:24]
    end
    csr_reg_write_address <= _GEN_18[11:0]; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 147:25 83:{38,38}]
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 84:35]
      csr_reg_write_data <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 84:35]
    end else if (3'h3 == csr_state) begin // @[src/main/scala/chisel3/util/Mux.scala 77:13]
      csr_reg_write_data <= _csr_reg_write_data_T_6;
    end else if (3'h1 == csr_state) begin // @[src/main/scala/chisel3/util/Mux.scala 77:13]
      csr_reg_write_data <= _csr_reg_write_data_T_2;
    end else if (3'h4 == csr_state) begin // @[src/main/scala/chisel3/util/Mux.scala 77:13]
      csr_reg_write_data <= cause;
    end else begin
      csr_reg_write_data <= _csr_reg_write_data_T_8;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  csr_state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  instruction_address = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cause = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  interrupt_assert = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  interrupt_handler_address = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  csr_reg_write_enable = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  csr_reg_write_address = _RAND_6[11:0];
  _RAND_7 = {1{`RANDOM}};
  csr_reg_write_data = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CSR(
  input         clock,
  input         reset,
  input         io_reg_write_enable_ex, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  input  [11:0] io_reg_read_address_id, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  input  [11:0] io_reg_write_address_ex, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  input  [31:0] io_reg_write_data_ex, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  input         io_reg_write_enable_clint, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  input  [11:0] io_reg_write_address_clint, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  input  [31:0] io_reg_write_data_clint, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  output        io_interrupt_enable, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  output [31:0] io_id_reg_data, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  output [31:0] io_clint_csr_mtvec, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  output [31:0] io_clint_csr_mepc, // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
  output [31:0] io_clint_csr_mstatus // @[src/main/scala/riscv/core/fivestage/CSR.scala 35:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] cycles; // @[src/main/scala/riscv/core/fivestage/CSR.scala 57:23]
  reg [31:0] mtvec; // @[src/main/scala/riscv/core/fivestage/CSR.scala 58:22]
  reg [31:0] mcause; // @[src/main/scala/riscv/core/fivestage/CSR.scala 59:23]
  reg [31:0] mepc; // @[src/main/scala/riscv/core/fivestage/CSR.scala 60:21]
  reg [31:0] mie; // @[src/main/scala/riscv/core/fivestage/CSR.scala 61:20]
  reg [31:0] mstatus; // @[src/main/scala/riscv/core/fivestage/CSR.scala 62:24]
  reg [31:0] mscratch; // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:25]
  wire [63:0] _cycles_T_1 = cycles + 64'h1; // @[src/main/scala/riscv/core/fivestage/CSR.scala 65:20]
  wire [11:0] _GEN_0 = io_reg_write_enable_clint ? io_reg_write_address_clint : 12'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 73:21 84:41 85:23]
  wire [31:0] _GEN_1 = io_reg_write_enable_clint ? io_reg_write_data_clint : 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 74:18 84:41 86:20]
  wire [11:0] reg_write_address = io_reg_write_enable_ex ? io_reg_write_address_ex : _GEN_0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 81:32 82:23]
  wire [31:0] reg_write_data = io_reg_write_enable_ex ? io_reg_write_data_ex : _GEN_1; // @[src/main/scala/riscv/core/fivestage/CSR.scala 81:32 83:20]
  wire [31:0] _GEN_4 = reg_write_address == 12'h340 ? reg_write_data : mscratch; // @[src/main/scala/riscv/core/fivestage/CSR.scala 100:14 63:25 99:58]
  wire [31:0] _GEN_5 = reg_write_address == 12'h300 ? reg_write_data : mstatus; // @[src/main/scala/riscv/core/fivestage/CSR.scala 97:57 98:13 62:24]
  wire [31:0] _GEN_6 = reg_write_address == 12'h300 ? mscratch : _GEN_4; // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:25 97:57]
  wire [31:0] _GEN_7 = reg_write_address == 12'h304 ? reg_write_data : mie; // @[src/main/scala/riscv/core/fivestage/CSR.scala 61:20 95:53 96:9]
  wire [31:0] _GEN_8 = reg_write_address == 12'h304 ? mstatus : _GEN_5; // @[src/main/scala/riscv/core/fivestage/CSR.scala 62:24 95:53]
  wire [31:0] _GEN_9 = reg_write_address == 12'h304 ? mscratch : _GEN_6; // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:25 95:53]
  wire [31:0] _io_id_reg_data_T_1 = 12'hc00 == io_reg_read_address_id ? cycles[31:0] : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_data_T_3 = 12'hc80 == io_reg_read_address_id ? cycles[63:32] : _io_id_reg_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_data_T_5 = 12'h305 == io_reg_read_address_id ? mtvec : _io_id_reg_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_data_T_7 = 12'h342 == io_reg_read_address_id ? mcause : _io_id_reg_data_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_data_T_9 = 12'h341 == io_reg_read_address_id ? mepc : _io_id_reg_data_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_data_T_11 = 12'h304 == io_reg_read_address_id ? mie : _io_id_reg_data_T_9; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_data_T_13 = 12'h300 == io_reg_read_address_id ? mstatus : _io_id_reg_data_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_interrupt_enable = mstatus[3]; // @[src/main/scala/riscv/core/fivestage/CSR.scala 69:33]
  assign io_id_reg_data = 12'h340 == io_reg_read_address_id ? mscratch : _io_id_reg_data_T_13; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_clint_csr_mtvec = mtvec; // @[src/main/scala/riscv/core/fivestage/CSR.scala 66:22]
  assign io_clint_csr_mepc = mepc; // @[src/main/scala/riscv/core/fivestage/CSR.scala 67:21]
  assign io_clint_csr_mstatus = mstatus; // @[src/main/scala/riscv/core/fivestage/CSR.scala 68:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 57:23]
      cycles <= 64'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 57:23]
    end else begin
      cycles <= _cycles_T_1; // @[src/main/scala/riscv/core/fivestage/CSR.scala 65:10]
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 58:22]
      mtvec <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 58:22]
    end else if (reg_write_address == 12'h305) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 89:49]
      if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 81:32]
        mtvec <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/fivestage/CSR.scala 83:20]
      end else if (io_reg_write_enable_clint) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 84:41]
        mtvec <= io_reg_write_data_clint; // @[src/main/scala/riscv/core/fivestage/CSR.scala 86:20]
      end else begin
        mtvec <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 74:18]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 59:23]
      mcause <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 59:23]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 89:49]
      if (reg_write_address == 12'h342) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:56]
        if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 81:32]
          mcause <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/fivestage/CSR.scala 83:20]
        end else begin
          mcause <= _GEN_1;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 60:21]
      mepc <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 60:21]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 89:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:56]
        if (reg_write_address == 12'h341) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 93:54]
          mepc <= reg_write_data; // @[src/main/scala/riscv/core/fivestage/CSR.scala 94:10]
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 61:20]
      mie <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 61:20]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 89:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 93:54]
          mie <= _GEN_7;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 62:24]
      mstatus <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 62:24]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 89:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 93:54]
          mstatus <= _GEN_8;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:25]
      mscratch <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:25]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 89:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 93:54]
          mscratch <= _GEN_9;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  cycles = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  mtvec = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mcause = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mepc = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mie = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mstatus = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  mscratch = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4LiteMaster(
  input         clock,
  input         reset,
  output        io_channels_write_address_channel_AWVALID, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_channels_write_address_channel_AWREADY, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output        io_channels_write_data_channel_WVALID, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_channels_write_data_channel_WREADY, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_channels_write_response_channel_BVALID, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output        io_channels_write_response_channel_BREADY, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output        io_channels_read_address_channel_ARVALID, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_channels_read_address_channel_ARREADY, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_channels_read_data_channel_RVALID, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output        io_channels_read_data_channel_RREADY, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input  [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input  [1:0]  io_channels_read_data_channel_RRESP, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_bundle_read, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_bundle_write, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output [31:0] io_bundle_read_data, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input  [31:0] io_bundle_write_data, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_bundle_write_strobe_0, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_bundle_write_strobe_1, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_bundle_write_strobe_2, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input         io_bundle_write_strobe_3, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  input  [31:0] io_bundle_address, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output        io_bundle_busy, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output        io_bundle_read_valid, // @[src/main/scala/bus/AXI4Lite.scala 215:14]
  output        io_bundle_write_valid // @[src/main/scala/bus/AXI4Lite.scala 215:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/bus/AXI4Lite.scala 219:22]
  reg [31:0] addr; // @[src/main/scala/bus/AXI4Lite.scala 222:21]
  reg  read_valid; // @[src/main/scala/bus/AXI4Lite.scala 223:27]
  reg  write_valid; // @[src/main/scala/bus/AXI4Lite.scala 225:28]
  reg [31:0] write_data; // @[src/main/scala/bus/AXI4Lite.scala 227:27]
  reg  write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
  reg  write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
  reg  write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
  reg  write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
  reg  ARVALID; // @[src/main/scala/bus/AXI4Lite.scala 232:24]
  reg  RREADY; // @[src/main/scala/bus/AXI4Lite.scala 235:23]
  reg  AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 239:24]
  reg  WVALID; // @[src/main/scala/bus/AXI4Lite.scala 242:23]
  wire [1:0] io_channels_write_data_channel_WSTRB_lo = {write_strobe_1,write_strobe_0}; // @[src/main/scala/bus/AXI4Lite.scala 246:56]
  wire [1:0] io_channels_write_data_channel_WSTRB_hi = {write_strobe_3,write_strobe_2}; // @[src/main/scala/bus/AXI4Lite.scala 246:56]
  reg  BREADY; // @[src/main/scala/bus/AXI4Lite.scala 247:23]
  wire [2:0] _GEN_12 = io_channels_read_data_channel_RVALID & io_channels_read_data_channel_RRESP == 2'h0 ? 3'h0 : state
    ; // @[src/main/scala/bus/AXI4Lite.scala 278:97 279:15 219:22]
  wire  _GEN_13 = io_channels_read_data_channel_RVALID & io_channels_read_data_channel_RRESP == 2'h0 | read_valid; // @[src/main/scala/bus/AXI4Lite.scala 278:97 280:20 223:27]
  wire  _GEN_14 = io_channels_read_data_channel_RVALID & io_channels_read_data_channel_RRESP == 2'h0 | RREADY; // @[src/main/scala/bus/AXI4Lite.scala 278:97 281:16 235:23]
  wire [2:0] _GEN_16 = io_channels_write_address_channel_AWREADY & AWVALID ? 3'h4 : state; // @[src/main/scala/bus/AXI4Lite.scala 288:66 289:15 219:22]
  wire  _GEN_18 = io_channels_write_address_channel_AWREADY & AWVALID ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 286:15 288:66 291:17]
  wire [2:0] _GEN_20 = io_channels_write_data_channel_WREADY & WVALID ? 3'h5 : state; // @[src/main/scala/bus/AXI4Lite.scala 297:61 299:15 219:22]
  wire  _GEN_21 = io_channels_write_data_channel_WREADY & WVALID ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 295:14 297:61 300:16]
  wire [2:0] _GEN_22 = io_channels_write_response_channel_BVALID & BREADY ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 305:65 306:15 219:22]
  wire  _GEN_23 = io_channels_write_response_channel_BVALID & BREADY | write_valid; // @[src/main/scala/bus/AXI4Lite.scala 305:65 307:21 225:28]
  wire  _GEN_24 = io_channels_write_response_channel_BVALID & BREADY ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 304:14 305:65 308:16]
  wire  _GEN_25 = 3'h5 == state ? _GEN_24 : BREADY; // @[src/main/scala/bus/AXI4Lite.scala 250:17 247:23]
  wire [2:0] _GEN_26 = 3'h5 == state ? _GEN_22 : state; // @[src/main/scala/bus/AXI4Lite.scala 250:17 219:22]
  wire  _GEN_27 = 3'h5 == state ? _GEN_23 : write_valid; // @[src/main/scala/bus/AXI4Lite.scala 250:17 225:28]
  wire  _GEN_28 = 3'h4 == state ? _GEN_21 : WVALID; // @[src/main/scala/bus/AXI4Lite.scala 250:17 242:23]
  wire [31:0] _GEN_29 = 3'h4 == state ? addr : 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 250:17 240:44]
  wire [2:0] _GEN_30 = 3'h4 == state ? _GEN_20 : _GEN_26; // @[src/main/scala/bus/AXI4Lite.scala 250:17]
  wire  _GEN_31 = 3'h4 == state ? BREADY : _GEN_25; // @[src/main/scala/bus/AXI4Lite.scala 250:17 247:23]
  wire  _GEN_32 = 3'h4 == state ? write_valid : _GEN_27; // @[src/main/scala/bus/AXI4Lite.scala 250:17 225:28]
  wire  _GEN_33 = 3'h3 == state ? _GEN_18 : AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 250:17 239:24]
  wire [31:0] _GEN_34 = 3'h3 == state ? addr : _GEN_29; // @[src/main/scala/bus/AXI4Lite.scala 250:17]
  wire [2:0] _GEN_35 = 3'h3 == state ? _GEN_16 : _GEN_30; // @[src/main/scala/bus/AXI4Lite.scala 250:17]
  wire  _GEN_36 = 3'h3 == state ? WVALID : _GEN_28; // @[src/main/scala/bus/AXI4Lite.scala 250:17 242:23]
  wire  _GEN_37 = 3'h3 == state ? BREADY : _GEN_31; // @[src/main/scala/bus/AXI4Lite.scala 250:17 247:23]
  wire  _GEN_38 = 3'h3 == state ? write_valid : _GEN_32; // @[src/main/scala/bus/AXI4Lite.scala 250:17 225:28]
  wire [31:0] _GEN_44 = 3'h2 == state ? 32'h0 : _GEN_34; // @[src/main/scala/bus/AXI4Lite.scala 250:17 240:44]
  wire [31:0] _GEN_49 = 3'h1 == state ? addr : 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 250:17 231:43]
  wire [31:0] _GEN_55 = 3'h1 == state ? 32'h0 : _GEN_44; // @[src/main/scala/bus/AXI4Lite.scala 250:17 240:44]
  assign io_channels_write_address_channel_AWVALID = AWVALID; // @[src/main/scala/bus/AXI4Lite.scala 241:45]
  assign io_channels_write_address_channel_AWADDR = 3'h0 == state ? 32'h0 : _GEN_55; // @[src/main/scala/bus/AXI4Lite.scala 250:17 240:44]
  assign io_channels_write_data_channel_WVALID = WVALID; // @[src/main/scala/bus/AXI4Lite.scala 243:41]
  assign io_channels_write_data_channel_WDATA = write_data; // @[src/main/scala/bus/AXI4Lite.scala 244:40]
  assign io_channels_write_data_channel_WSTRB = {io_channels_write_data_channel_WSTRB_hi,
    io_channels_write_data_channel_WSTRB_lo}; // @[src/main/scala/bus/AXI4Lite.scala 246:56]
  assign io_channels_write_response_channel_BREADY = BREADY; // @[src/main/scala/bus/AXI4Lite.scala 248:45]
  assign io_channels_read_address_channel_ARVALID = ARVALID; // @[src/main/scala/bus/AXI4Lite.scala 233:44]
  assign io_channels_read_address_channel_ARADDR = 3'h0 == state ? 32'h0 : _GEN_49; // @[src/main/scala/bus/AXI4Lite.scala 250:17 231:43]
  assign io_channels_read_data_channel_RREADY = RREADY; // @[src/main/scala/bus/AXI4Lite.scala 236:40]
  assign io_bundle_read_data = io_channels_read_data_channel_RDATA; // @[src/main/scala/bus/AXI4Lite.scala 238:23]
  assign io_bundle_busy = state != 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 220:27]
  assign io_bundle_read_valid = read_valid; // @[src/main/scala/bus/AXI4Lite.scala 224:24]
  assign io_bundle_write_valid = write_valid; // @[src/main/scala/bus/AXI4Lite.scala 226:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 219:22]
      state <= 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 219:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 258:29]
        state <= 3'h3; // @[src/main/scala/bus/AXI4Lite.scala 259:15]
      end else if (io_bundle_read) begin // @[src/main/scala/bus/AXI4Lite.scala 263:34]
        state <= 3'h1; // @[src/main/scala/bus/AXI4Lite.scala 264:15]
      end
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_channels_read_address_channel_ARREADY & ARVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 271:65]
        state <= 3'h2; // @[src/main/scala/bus/AXI4Lite.scala 272:15]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      state <= _GEN_12;
    end else begin
      state <= _GEN_35;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 222:21]
      addr <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 222:21]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 258:29]
        addr <= io_bundle_address; // @[src/main/scala/bus/AXI4Lite.scala 260:14]
      end else if (io_bundle_read) begin // @[src/main/scala/bus/AXI4Lite.scala 263:34]
        addr <= io_bundle_address; // @[src/main/scala/bus/AXI4Lite.scala 265:14]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 223:27]
      read_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 223:27]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      read_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 256:18]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
        read_valid <= _GEN_13;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 225:28]
      write_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 225:28]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      write_valid <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 257:19]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
        write_valid <= _GEN_38;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 227:27]
      write_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 227:27]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 258:29]
        write_data <= io_bundle_write_data; // @[src/main/scala/bus/AXI4Lite.scala 261:20]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 228:29]
      write_strobe_0 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 258:29]
        write_strobe_0 <= io_bundle_write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 262:22]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 228:29]
      write_strobe_1 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 258:29]
        write_strobe_1 <= io_bundle_write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 262:22]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 228:29]
      write_strobe_2 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 258:29]
        write_strobe_2 <= io_bundle_write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 262:22]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 228:29]
      write_strobe_3 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 228:29]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_bundle_write) begin // @[src/main/scala/bus/AXI4Lite.scala 258:29]
        write_strobe_3 <= io_bundle_write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 262:22]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 232:24]
      ARVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 232:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      ARVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 254:15]
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (io_channels_read_address_channel_ARREADY & ARVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 271:65]
        ARVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 274:17]
      end else begin
        ARVALID <= 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 269:15]
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 235:23]
      RREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 235:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      RREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 255:14]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
        RREADY <= _GEN_14;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 239:24]
      AWVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 239:24]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      AWVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 253:15]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
        AWVALID <= _GEN_33;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 242:23]
      WVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 242:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      WVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 252:14]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
        WVALID <= _GEN_36;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 247:23]
      BREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 247:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 250:17]
          BREADY <= _GEN_37;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  read_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  write_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  write_data = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  write_strobe_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  write_strobe_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  write_strobe_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  write_strobe_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  ARVALID = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  RREADY = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  AWVALID = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  WVALID = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  BREADY = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CPU(
  input         clock,
  input         reset,
  output        io_axi4_channels_write_address_channel_AWVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input         io_axi4_channels_write_address_channel_AWREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output [31:0] io_axi4_channels_write_address_channel_AWADDR, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output        io_axi4_channels_write_data_channel_WVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input         io_axi4_channels_write_data_channel_WREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output [31:0] io_axi4_channels_write_data_channel_WDATA, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output [3:0]  io_axi4_channels_write_data_channel_WSTRB, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input         io_axi4_channels_write_response_channel_BVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output        io_axi4_channels_write_response_channel_BREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output        io_axi4_channels_read_address_channel_ARVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input         io_axi4_channels_read_address_channel_ARREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output [31:0] io_axi4_channels_read_address_channel_ARADDR, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input         io_axi4_channels_read_data_channel_RVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output        io_axi4_channels_read_data_channel_RREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input  [31:0] io_axi4_channels_read_data_channel_RDATA, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input         io_stall_flag_bus, // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
  input         io_instruction_valid // @[src/main/scala/riscv/core/fivestage/CPU.scala 23:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ctrl_io_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_stall_flag_if; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_stall_flag_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_stall_flag_bus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire [4:0] ctrl_io_rs1_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire [4:0] ctrl_io_rs2_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_memory_read_enable_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire [4:0] ctrl_io_rd_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_if_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_id_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_pc_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_if_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_id_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  ctrl_io_ex_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
  wire  regs_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire  regs_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire  regs_io_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire [4:0] regs_io_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire [31:0] regs_io_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire [4:0] regs_io_read_address1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire [4:0] regs_io_read_address2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire [31:0] regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire [31:0] regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
  wire  inst_fetch_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire  inst_fetch_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire  inst_fetch_io_stall_flag_ctrl; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire  inst_fetch_io_jump_flag_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire [31:0] inst_fetch_io_jump_address_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire  inst_fetch_io_instruction_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire [31:0] inst_fetch_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire [31:0] inst_fetch_io_bus_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire  inst_fetch_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire [31:0] inst_fetch_io_id_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire [31:0] inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
  wire  if2id_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire  if2id_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire  if2id_io_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire  if2id_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire [31:0] if2id_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire [31:0] if2id_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire [31:0] if2id_io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire [31:0] if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire [31:0] if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire [31:0] if2id_io_output_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
  wire [31:0] id_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [31:0] id_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [31:0] id_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [31:0] id_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [31:0] id_io_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [4:0] id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [4:0] id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [31:0] id_io_ex_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [1:0] id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [4:0] id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [11:0] id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire [31:0] id_io_if_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
  wire  id2ex_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [4:0] id2ex_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [1:0] id2ex_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [11:0] id2ex_io_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [4:0] id2ex_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [1:0] id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_output_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [11:0] id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire  id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
  wire [31:0] ex_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire  ex_io_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire  ex_io_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_forward_from_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_forward_from_wb; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [1:0] ex_io_aluop1_forward; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [1:0] ex_io_aluop2_forward; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_mem_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire [31:0] ex_io_csr_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
  wire  ex2mem_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_io_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [1:0] ex2mem_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [1:0] ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire [31:0] ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
  wire  mem_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [2:0] mem_io_funct3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [1:0] mem_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_forward_to_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_read; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_bus_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_write; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire [31:0] mem_io_bus_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_write_strobe_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_write_strobe_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_write_strobe_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_write_strobe_3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_request; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem_io_bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
  wire  mem2wb_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire  mem2wb_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire  mem2wb_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [1:0] mem2wb_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire  mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [1:0] mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
  wire [31:0] wb_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:18]
  wire [31:0] wb_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:18]
  wire [31:0] wb_io_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:18]
  wire [1:0] wb_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:18]
  wire [31:0] wb_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:18]
  wire [31:0] wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:18]
  wire [4:0] forwarding_io_rs1_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire [4:0] forwarding_io_rs2_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire [4:0] forwarding_io_rd_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire  forwarding_io_reg_write_enable_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire [4:0] forwarding_io_rd_wb; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire  forwarding_io_reg_write_enable_wb; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire [1:0] forwarding_io_aluop1_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire [1:0] forwarding_io_aluop2_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
  wire  clint_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire  clint_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_instruction_address_if; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire  clint_io_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_csr_mtvec; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_csr_mepc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_csr_mstatus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire  clint_io_interrupt_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire  clint_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire  clint_io_csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [11:0] clint_io_csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire [31:0] clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire  clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
  wire  csr_regs_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire  csr_regs_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire  csr_regs_io_reg_write_enable_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [11:0] csr_regs_io_reg_read_address_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [11:0] csr_regs_io_reg_write_address_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [31:0] csr_regs_io_reg_write_data_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire  csr_regs_io_reg_write_enable_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [11:0] csr_regs_io_reg_write_address_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [31:0] csr_regs_io_reg_write_data_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire  csr_regs_io_interrupt_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [31:0] csr_regs_io_id_reg_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [31:0] csr_regs_io_clint_csr_mtvec; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [31:0] csr_regs_io_clint_csr_mepc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire [31:0] csr_regs_io_clint_csr_mstatus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
  wire  axi4_master_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [31:0] axi4_master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [31:0] axi4_master_io_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [3:0] axi4_master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [31:0] axi4_master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [31:0] axi4_master_io_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [1:0] axi4_master_io_channels_read_data_channel_RRESP; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_read; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_write; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [31:0] axi4_master_io_bundle_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [31:0] axi4_master_io_bundle_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_write_strobe_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_write_strobe_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_write_strobe_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_write_strobe_3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire [31:0] axi4_master_io_bundle_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_busy; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  wire  axi4_master_io_bundle_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
  reg  mem_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 51:28]
  wire  _T = ~mem_io_bus_request; // @[src/main/scala/riscv/core/fivestage/CPU.scala 60:10]
  wire  _GEN_0 = ~mem_io_bus_request ? 1'h0 : mem_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 60:31 61:19 51:28]
  wire  _axi4_master_io_bundle_read_T_2 = ~axi4_master_io_bundle_busy & ~axi4_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 66:63]
  wire  _GEN_9 = mem_granted & _GEN_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 65:17]
  wire  _GEN_10 = _axi4_master_io_bundle_read_T_2 | _GEN_9; // @[src/main/scala/riscv/core/fivestage/CPU.scala 75:76 76:19]
  Control ctrl ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 25:20]
    .io_jump_flag(ctrl_io_jump_flag),
    .io_stall_flag_if(ctrl_io_stall_flag_if),
    .io_stall_flag_mem(ctrl_io_stall_flag_mem),
    .io_stall_flag_clint(ctrl_io_stall_flag_clint),
    .io_stall_flag_bus(ctrl_io_stall_flag_bus),
    .io_rs1_id(ctrl_io_rs1_id),
    .io_rs2_id(ctrl_io_rs2_id),
    .io_memory_read_enable_ex(ctrl_io_memory_read_enable_ex),
    .io_rd_ex(ctrl_io_rd_ex),
    .io_if_flush(ctrl_io_if_flush),
    .io_id_flush(ctrl_io_id_flush),
    .io_pc_stall(ctrl_io_pc_stall),
    .io_if_stall(ctrl_io_if_stall),
    .io_id_stall(ctrl_io_id_stall),
    .io_ex_stall(ctrl_io_ex_stall)
  );
  RegisterFile regs ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 26:20]
    .clock(regs_clock),
    .reset(regs_reset),
    .io_write_enable(regs_io_write_enable),
    .io_write_address(regs_io_write_address),
    .io_write_data(regs_io_write_data),
    .io_read_address1(regs_io_read_address1),
    .io_read_address2(regs_io_read_address2),
    .io_read_data1(regs_io_read_data1),
    .io_read_data2(regs_io_read_data2)
  );
  InstructionFetch inst_fetch ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 27:26]
    .clock(inst_fetch_clock),
    .reset(inst_fetch_reset),
    .io_stall_flag_ctrl(inst_fetch_io_stall_flag_ctrl),
    .io_jump_flag_id(inst_fetch_io_jump_flag_id),
    .io_jump_address_id(inst_fetch_io_jump_address_id),
    .io_instruction_valid(inst_fetch_io_instruction_valid),
    .io_bus_address(inst_fetch_io_bus_address),
    .io_bus_data(inst_fetch_io_bus_data),
    .io_ctrl_stall_flag(inst_fetch_io_ctrl_stall_flag),
    .io_id_instruction_address(inst_fetch_io_id_instruction_address),
    .io_id_instruction(inst_fetch_io_id_instruction)
  );
  IF2ID if2id ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 28:21]
    .clock(if2id_clock),
    .reset(if2id_reset),
    .io_stall_flag(if2id_io_stall_flag),
    .io_flush_enable(if2id_io_flush_enable),
    .io_instruction(if2id_io_instruction),
    .io_instruction_address(if2id_io_instruction_address),
    .io_interrupt_flag(if2id_io_interrupt_flag),
    .io_output_instruction(if2id_io_output_instruction),
    .io_output_instruction_address(if2id_io_output_instruction_address),
    .io_output_interrupt_flag(if2id_io_output_interrupt_flag)
  );
  InstructionDecode id ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 29:18]
    .io_instruction(id_io_instruction),
    .io_instruction_address(id_io_instruction_address),
    .io_reg1_data(id_io_reg1_data),
    .io_reg2_data(id_io_reg2_data),
    .io_interrupt_assert(id_io_interrupt_assert),
    .io_interrupt_handler_address(id_io_interrupt_handler_address),
    .io_regs_reg1_read_address(id_io_regs_reg1_read_address),
    .io_regs_reg2_read_address(id_io_regs_reg2_read_address),
    .io_ex_immediate(id_io_ex_immediate),
    .io_ex_aluop1_source(id_io_ex_aluop1_source),
    .io_ex_aluop2_source(id_io_ex_aluop2_source),
    .io_ex_memory_read_enable(id_io_ex_memory_read_enable),
    .io_ex_memory_write_enable(id_io_ex_memory_write_enable),
    .io_ex_reg_write_source(id_io_ex_reg_write_source),
    .io_ex_reg_write_enable(id_io_ex_reg_write_enable),
    .io_ex_reg_write_address(id_io_ex_reg_write_address),
    .io_ex_csr_address(id_io_ex_csr_address),
    .io_ex_csr_write_enable(id_io_ex_csr_write_enable),
    .io_if_jump_flag(id_io_if_jump_flag),
    .io_if_jump_address(id_io_if_jump_address)
  );
  ID2EX id2ex ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 30:21]
    .clock(id2ex_clock),
    .reset(id2ex_reset),
    .io_stall_flag(id2ex_io_stall_flag),
    .io_flush_enable(id2ex_io_flush_enable),
    .io_instruction(id2ex_io_instruction),
    .io_instruction_address(id2ex_io_instruction_address),
    .io_regs_write_enable(id2ex_io_regs_write_enable),
    .io_regs_write_address(id2ex_io_regs_write_address),
    .io_regs_write_source(id2ex_io_regs_write_source),
    .io_reg1_data(id2ex_io_reg1_data),
    .io_reg2_data(id2ex_io_reg2_data),
    .io_immediate(id2ex_io_immediate),
    .io_aluop1_source(id2ex_io_aluop1_source),
    .io_aluop2_source(id2ex_io_aluop2_source),
    .io_csr_write_enable(id2ex_io_csr_write_enable),
    .io_csr_address(id2ex_io_csr_address),
    .io_memory_read_enable(id2ex_io_memory_read_enable),
    .io_memory_write_enable(id2ex_io_memory_write_enable),
    .io_csr_read_data(id2ex_io_csr_read_data),
    .io_output_instruction(id2ex_io_output_instruction),
    .io_output_instruction_address(id2ex_io_output_instruction_address),
    .io_output_regs_write_enable(id2ex_io_output_regs_write_enable),
    .io_output_regs_write_address(id2ex_io_output_regs_write_address),
    .io_output_regs_write_source(id2ex_io_output_regs_write_source),
    .io_output_reg1_data(id2ex_io_output_reg1_data),
    .io_output_reg2_data(id2ex_io_output_reg2_data),
    .io_output_immediate(id2ex_io_output_immediate),
    .io_output_aluop1_source(id2ex_io_output_aluop1_source),
    .io_output_aluop2_source(id2ex_io_output_aluop2_source),
    .io_output_csr_write_enable(id2ex_io_output_csr_write_enable),
    .io_output_csr_address(id2ex_io_output_csr_address),
    .io_output_memory_read_enable(id2ex_io_output_memory_read_enable),
    .io_output_memory_write_enable(id2ex_io_output_memory_write_enable),
    .io_output_csr_read_data(id2ex_io_output_csr_read_data)
  );
  Execute ex ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:18]
    .io_instruction(ex_io_instruction),
    .io_instruction_address(ex_io_instruction_address),
    .io_reg1_data(ex_io_reg1_data),
    .io_reg2_data(ex_io_reg2_data),
    .io_immediate(ex_io_immediate),
    .io_aluop1_source(ex_io_aluop1_source),
    .io_aluop2_source(ex_io_aluop2_source),
    .io_csr_read_data(ex_io_csr_read_data),
    .io_forward_from_mem(ex_io_forward_from_mem),
    .io_forward_from_wb(ex_io_forward_from_wb),
    .io_aluop1_forward(ex_io_aluop1_forward),
    .io_aluop2_forward(ex_io_aluop2_forward),
    .io_mem_alu_result(ex_io_mem_alu_result),
    .io_csr_write_data(ex_io_csr_write_data)
  );
  EX2MEM ex2mem ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 32:22]
    .clock(ex2mem_clock),
    .reset(ex2mem_reset),
    .io_stall_flag(ex2mem_io_stall_flag),
    .io_regs_write_enable(ex2mem_io_regs_write_enable),
    .io_regs_write_source(ex2mem_io_regs_write_source),
    .io_regs_write_address(ex2mem_io_regs_write_address),
    .io_instruction_address(ex2mem_io_instruction_address),
    .io_instruction(ex2mem_io_instruction),
    .io_reg1_data(ex2mem_io_reg1_data),
    .io_reg2_data(ex2mem_io_reg2_data),
    .io_memory_read_enable(ex2mem_io_memory_read_enable),
    .io_memory_write_enable(ex2mem_io_memory_write_enable),
    .io_alu_result(ex2mem_io_alu_result),
    .io_csr_read_data(ex2mem_io_csr_read_data),
    .io_output_regs_write_enable(ex2mem_io_output_regs_write_enable),
    .io_output_regs_write_source(ex2mem_io_output_regs_write_source),
    .io_output_regs_write_address(ex2mem_io_output_regs_write_address),
    .io_output_instruction_address(ex2mem_io_output_instruction_address),
    .io_output_instruction(ex2mem_io_output_instruction),
    .io_output_reg2_data(ex2mem_io_output_reg2_data),
    .io_output_memory_read_enable(ex2mem_io_output_memory_read_enable),
    .io_output_memory_write_enable(ex2mem_io_output_memory_write_enable),
    .io_output_alu_result(ex2mem_io_output_alu_result),
    .io_output_csr_read_data(ex2mem_io_output_csr_read_data)
  );
  MemoryAccess mem ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:19]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_alu_result(mem_io_alu_result),
    .io_reg2_data(mem_io_reg2_data),
    .io_memory_read_enable(mem_io_memory_read_enable),
    .io_memory_write_enable(mem_io_memory_write_enable),
    .io_funct3(mem_io_funct3),
    .io_regs_write_source(mem_io_regs_write_source),
    .io_csr_read_data(mem_io_csr_read_data),
    .io_wb_memory_read_data(mem_io_wb_memory_read_data),
    .io_ctrl_stall_flag(mem_io_ctrl_stall_flag),
    .io_forward_to_ex(mem_io_forward_to_ex),
    .io_bus_read(mem_io_bus_read),
    .io_bus_address(mem_io_bus_address),
    .io_bus_read_data(mem_io_bus_read_data),
    .io_bus_read_valid(mem_io_bus_read_valid),
    .io_bus_write(mem_io_bus_write),
    .io_bus_write_data(mem_io_bus_write_data),
    .io_bus_write_strobe_0(mem_io_bus_write_strobe_0),
    .io_bus_write_strobe_1(mem_io_bus_write_strobe_1),
    .io_bus_write_strobe_2(mem_io_bus_write_strobe_2),
    .io_bus_write_strobe_3(mem_io_bus_write_strobe_3),
    .io_bus_write_valid(mem_io_bus_write_valid),
    .io_bus_request(mem_io_bus_request),
    .io_bus_granted(mem_io_bus_granted)
  );
  MEM2WB mem2wb ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:22]
    .clock(mem2wb_clock),
    .reset(mem2wb_reset),
    .io_instruction_address(mem2wb_io_instruction_address),
    .io_alu_result(mem2wb_io_alu_result),
    .io_regs_write_enable(mem2wb_io_regs_write_enable),
    .io_regs_write_source(mem2wb_io_regs_write_source),
    .io_regs_write_address(mem2wb_io_regs_write_address),
    .io_memory_read_data(mem2wb_io_memory_read_data),
    .io_csr_read_data(mem2wb_io_csr_read_data),
    .io_output_instruction_address(mem2wb_io_output_instruction_address),
    .io_output_alu_result(mem2wb_io_output_alu_result),
    .io_output_regs_write_enable(mem2wb_io_output_regs_write_enable),
    .io_output_regs_write_source(mem2wb_io_output_regs_write_source),
    .io_output_regs_write_address(mem2wb_io_output_regs_write_address),
    .io_output_memory_read_data(mem2wb_io_output_memory_read_data),
    .io_output_csr_read_data(mem2wb_io_output_csr_read_data)
  );
  WriteBack wb ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:18]
    .io_instruction_address(wb_io_instruction_address),
    .io_alu_result(wb_io_alu_result),
    .io_memory_read_data(wb_io_memory_read_data),
    .io_regs_write_source(wb_io_regs_write_source),
    .io_csr_read_data(wb_io_csr_read_data),
    .io_regs_write_data(wb_io_regs_write_data)
  );
  Forwarding forwarding ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:26]
    .io_rs1_ex(forwarding_io_rs1_ex),
    .io_rs2_ex(forwarding_io_rs2_ex),
    .io_rd_mem(forwarding_io_rd_mem),
    .io_reg_write_enable_mem(forwarding_io_reg_write_enable_mem),
    .io_rd_wb(forwarding_io_rd_wb),
    .io_reg_write_enable_wb(forwarding_io_reg_write_enable_wb),
    .io_aluop1_forward_ex(forwarding_io_aluop1_forward_ex),
    .io_aluop2_forward_ex(forwarding_io_aluop2_forward_ex)
  );
  CLINT clint ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:21]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_interrupt_flag(clint_io_interrupt_flag),
    .io_instruction(clint_io_instruction),
    .io_instruction_address_if(clint_io_instruction_address_if),
    .io_jump_flag(clint_io_jump_flag),
    .io_jump_address(clint_io_jump_address),
    .io_csr_mtvec(clint_io_csr_mtvec),
    .io_csr_mepc(clint_io_csr_mepc),
    .io_csr_mstatus(clint_io_csr_mstatus),
    .io_interrupt_enable(clint_io_interrupt_enable),
    .io_ctrl_stall_flag(clint_io_ctrl_stall_flag),
    .io_csr_reg_write_enable(clint_io_csr_reg_write_enable),
    .io_csr_reg_write_address(clint_io_csr_reg_write_address),
    .io_csr_reg_write_data(clint_io_csr_reg_write_data),
    .io_id_interrupt_handler_address(clint_io_id_interrupt_handler_address),
    .io_id_interrupt_assert(clint_io_id_interrupt_assert)
  );
  CSR csr_regs ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:24]
    .clock(csr_regs_clock),
    .reset(csr_regs_reset),
    .io_reg_write_enable_ex(csr_regs_io_reg_write_enable_ex),
    .io_reg_read_address_id(csr_regs_io_reg_read_address_id),
    .io_reg_write_address_ex(csr_regs_io_reg_write_address_ex),
    .io_reg_write_data_ex(csr_regs_io_reg_write_data_ex),
    .io_reg_write_enable_clint(csr_regs_io_reg_write_enable_clint),
    .io_reg_write_address_clint(csr_regs_io_reg_write_address_clint),
    .io_reg_write_data_clint(csr_regs_io_reg_write_data_clint),
    .io_interrupt_enable(csr_regs_io_interrupt_enable),
    .io_id_reg_data(csr_regs_io_id_reg_data),
    .io_clint_csr_mtvec(csr_regs_io_clint_csr_mtvec),
    .io_clint_csr_mepc(csr_regs_io_clint_csr_mepc),
    .io_clint_csr_mstatus(csr_regs_io_clint_csr_mstatus)
  );
  AXI4LiteMaster axi4_master ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:27]
    .clock(axi4_master_clock),
    .reset(axi4_master_reset),
    .io_channels_write_address_channel_AWVALID(axi4_master_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(axi4_master_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(axi4_master_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(axi4_master_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(axi4_master_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(axi4_master_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(axi4_master_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(axi4_master_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(axi4_master_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(axi4_master_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(axi4_master_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(axi4_master_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(axi4_master_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(axi4_master_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(axi4_master_io_channels_read_data_channel_RDATA),
    .io_channels_read_data_channel_RRESP(axi4_master_io_channels_read_data_channel_RRESP),
    .io_bundle_read(axi4_master_io_bundle_read),
    .io_bundle_write(axi4_master_io_bundle_write),
    .io_bundle_read_data(axi4_master_io_bundle_read_data),
    .io_bundle_write_data(axi4_master_io_bundle_write_data),
    .io_bundle_write_strobe_0(axi4_master_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(axi4_master_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(axi4_master_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(axi4_master_io_bundle_write_strobe_3),
    .io_bundle_address(axi4_master_io_bundle_address),
    .io_bundle_busy(axi4_master_io_bundle_busy),
    .io_bundle_read_valid(axi4_master_io_bundle_read_valid),
    .io_bundle_write_valid(axi4_master_io_bundle_write_valid)
  );
  assign io_axi4_channels_write_address_channel_AWVALID = axi4_master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_write_address_channel_AWADDR = axi4_master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_write_data_channel_WVALID = axi4_master_io_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_write_data_channel_WDATA = axi4_master_io_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_write_data_channel_WSTRB = axi4_master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_write_response_channel_BREADY = axi4_master_io_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_read_address_channel_ARVALID = axi4_master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_read_address_channel_ARADDR = axi4_master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_axi4_channels_read_data_channel_RREADY = axi4_master_io_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign io_bus_address = mem_granted ? mem_io_bus_address : inst_fetch_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 54:20 68:20]
  assign ctrl_io_jump_flag = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 89:21]
  assign ctrl_io_stall_flag_if = inst_fetch_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 90:25]
  assign ctrl_io_stall_flag_mem = mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 91:26]
  assign ctrl_io_stall_flag_clint = clint_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 92:28]
  assign ctrl_io_stall_flag_bus = io_stall_flag_bus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 93:26]
  assign ctrl_io_rs1_id = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 94:18]
  assign ctrl_io_rs2_id = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 95:18]
  assign ctrl_io_memory_read_enable_ex = ex2mem_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 96:33]
  assign ctrl_io_rd_ex = ex2mem_io_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 97:17]
  assign regs_clock = clock;
  assign regs_reset = reset;
  assign regs_io_write_enable = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 99:24]
  assign regs_io_write_address = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 100:25]
  assign regs_io_write_data = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 101:22]
  assign regs_io_read_address1 = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 102:25]
  assign regs_io_read_address2 = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 103:25]
  assign inst_fetch_clock = clock;
  assign inst_fetch_reset = reset;
  assign inst_fetch_io_stall_flag_ctrl = ctrl_io_pc_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 108:33]
  assign inst_fetch_io_jump_flag_id = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 109:30]
  assign inst_fetch_io_jump_address_id = id_io_if_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 110:33]
  assign inst_fetch_io_instruction_valid = io_instruction_valid & axi4_master_io_bundle_read_valid & ~mem_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 80:95]
  assign inst_fetch_io_bus_data = axi4_master_io_bundle_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 81:26]
  assign if2id_clock = clock;
  assign if2id_reset = reset;
  assign if2id_io_stall_flag = ctrl_io_if_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 112:23]
  assign if2id_io_flush_enable = ctrl_io_if_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 113:25]
  assign if2id_io_instruction = inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 114:24]
  assign if2id_io_instruction_address = inst_fetch_io_id_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 115:32]
  assign if2id_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 116:27]
  assign id_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 120:21]
  assign id_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 121:29]
  assign id_io_reg1_data = regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 118:19]
  assign id_io_reg2_data = regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 119:19]
  assign id_io_interrupt_assert = clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CPU.scala 122:26]
  assign id_io_interrupt_handler_address = clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 123:35]
  assign id2ex_clock = clock;
  assign id2ex_reset = reset;
  assign id2ex_io_stall_flag = ctrl_io_id_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 125:23]
  assign id2ex_io_flush_enable = ctrl_io_id_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 126:25]
  assign id2ex_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 127:24]
  assign id2ex_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 128:32]
  assign id2ex_io_regs_write_enable = id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 129:30]
  assign id2ex_io_regs_write_address = id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 130:31]
  assign id2ex_io_regs_write_source = id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 131:30]
  assign id2ex_io_reg1_data = regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 132:22]
  assign id2ex_io_reg2_data = regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 133:22]
  assign id2ex_io_immediate = id_io_ex_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 134:22]
  assign id2ex_io_aluop1_source = id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 135:26]
  assign id2ex_io_aluop2_source = id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 136:26]
  assign id2ex_io_csr_write_enable = id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 137:29]
  assign id2ex_io_csr_address = id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 138:24]
  assign id2ex_io_memory_read_enable = id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 139:31]
  assign id2ex_io_memory_write_enable = id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 140:32]
  assign id2ex_io_csr_read_data = csr_regs_io_id_reg_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 141:26]
  assign ex_io_instruction = id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 143:21]
  assign ex_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 144:29]
  assign ex_io_reg1_data = id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:19]
  assign ex_io_reg2_data = id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 146:19]
  assign ex_io_immediate = id2ex_io_output_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 147:19]
  assign ex_io_aluop1_source = id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 148:23]
  assign ex_io_aluop2_source = id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 149:23]
  assign ex_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 150:23]
  assign ex_io_forward_from_mem = mem_io_forward_to_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 151:26]
  assign ex_io_forward_from_wb = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:25]
  assign ex_io_aluop1_forward = forwarding_io_aluop1_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 153:24]
  assign ex_io_aluop2_forward = forwarding_io_aluop2_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 154:24]
  assign ex2mem_clock = clock;
  assign ex2mem_reset = reset;
  assign ex2mem_io_stall_flag = ctrl_io_ex_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 156:24]
  assign ex2mem_io_regs_write_enable = id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 158:31]
  assign ex2mem_io_regs_write_source = id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 159:31]
  assign ex2mem_io_regs_write_address = {{27'd0}, id2ex_io_output_regs_write_address}; // @[src/main/scala/riscv/core/fivestage/CPU.scala 160:32]
  assign ex2mem_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 161:33]
  assign ex2mem_io_instruction = id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 162:25]
  assign ex2mem_io_reg1_data = id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 163:23]
  assign ex2mem_io_reg2_data = id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 164:23]
  assign ex2mem_io_memory_read_enable = id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 165:32]
  assign ex2mem_io_memory_write_enable = id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 166:33]
  assign ex2mem_io_alu_result = ex_io_mem_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 167:24]
  assign ex2mem_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 168:27]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 170:21]
  assign mem_io_reg2_data = ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 171:20]
  assign mem_io_memory_read_enable = ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 172:29]
  assign mem_io_memory_write_enable = ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 173:30]
  assign mem_io_funct3 = ex2mem_io_output_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 174:48]
  assign mem_io_regs_write_source = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 175:28]
  assign mem_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 176:24]
  assign mem_io_bus_read_data = axi4_master_io_bundle_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 83:24]
  assign mem_io_bus_read_valid = axi4_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 84:25]
  assign mem_io_bus_write_valid = axi4_master_io_bundle_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 85:26]
  assign mem_io_bus_granted = mem_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 87:22]
  assign mem2wb_clock = clock;
  assign mem2wb_reset = reset;
  assign mem2wb_io_instruction_address = ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 178:33]
  assign mem2wb_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 179:24]
  assign mem2wb_io_regs_write_enable = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 180:31]
  assign mem2wb_io_regs_write_source = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 181:31]
  assign mem2wb_io_regs_write_address = ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 182:32]
  assign mem2wb_io_memory_read_data = mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 183:30]
  assign mem2wb_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 184:27]
  assign wb_io_instruction_address = mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 186:29]
  assign wb_io_alu_result = mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 187:20]
  assign wb_io_memory_read_data = mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 188:26]
  assign wb_io_regs_write_source = mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 189:27]
  assign wb_io_csr_read_data = mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 190:23]
  assign forwarding_io_rs1_ex = id2ex_io_output_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 192:54]
  assign forwarding_io_rs2_ex = id2ex_io_output_instruction[24:20]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 193:54]
  assign forwarding_io_rd_mem = ex2mem_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 194:24]
  assign forwarding_io_reg_write_enable_mem = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 195:38]
  assign forwarding_io_rd_wb = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 196:23]
  assign forwarding_io_reg_write_enable_wb = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 197:37]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_interrupt_flag = if2id_io_output_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 207:27]
  assign clint_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 199:24]
  assign clint_io_instruction_address_if = inst_fetch_io_id_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 200:35]
  assign clint_io_jump_flag = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 201:22]
  assign clint_io_jump_address = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 202:25]
  assign clint_io_csr_mtvec = csr_regs_io_clint_csr_mtvec; // @[src/main/scala/riscv/core/fivestage/CPU.scala 204:22]
  assign clint_io_csr_mepc = csr_regs_io_clint_csr_mepc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 203:21]
  assign clint_io_csr_mstatus = csr_regs_io_clint_csr_mstatus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 205:24]
  assign clint_io_interrupt_enable = csr_regs_io_interrupt_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 206:29]
  assign csr_regs_clock = clock;
  assign csr_regs_reset = reset;
  assign csr_regs_io_reg_write_enable_ex = id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 209:35]
  assign csr_regs_io_reg_read_address_id = id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 212:35]
  assign csr_regs_io_reg_write_address_ex = id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 210:36]
  assign csr_regs_io_reg_write_data_ex = ex_io_csr_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 211:33]
  assign csr_regs_io_reg_write_enable_clint = clint_io_csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 213:38]
  assign csr_regs_io_reg_write_address_clint = clint_io_csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 214:39]
  assign csr_regs_io_reg_write_data_clint = clint_io_csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 215:36]
  assign axi4_master_clock = clock;
  assign axi4_master_reset = reset;
  assign axi4_master_io_channels_write_address_channel_AWREADY = io_axi4_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign axi4_master_io_channels_write_data_channel_WREADY = io_axi4_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign axi4_master_io_channels_write_response_channel_BVALID = io_axi4_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign axi4_master_io_channels_read_address_channel_ARREADY = io_axi4_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign axi4_master_io_channels_read_data_channel_RVALID = io_axi4_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign axi4_master_io_channels_read_data_channel_RDATA = io_axi4_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign axi4_master_io_channels_read_data_channel_RRESP = 2'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:27]
  assign axi4_master_io_bundle_read = mem_granted ? mem_io_bus_read : ~axi4_master_io_bundle_busy & ~
    axi4_master_io_bundle_read_valid & _T; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 55:32 66:32]
  assign axi4_master_io_bundle_write = mem_granted & mem_io_bus_write; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 57:33 69:33]
  assign axi4_master_io_bundle_write_data = mem_granted ? mem_io_bus_write_data : 32'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 58:38 70:38]
  assign axi4_master_io_bundle_write_strobe_0 = mem_granted & mem_io_bus_write_strobe_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 59:40 71:40]
  assign axi4_master_io_bundle_write_strobe_1 = mem_granted & mem_io_bus_write_strobe_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 59:40 71:40]
  assign axi4_master_io_bundle_write_strobe_2 = mem_granted & mem_io_bus_write_strobe_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 59:40 71:40]
  assign axi4_master_io_bundle_write_strobe_3 = mem_granted & mem_io_bus_write_strobe_3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 59:40 71:40]
  assign axi4_master_io_bundle_address = mem_granted ? mem_io_bus_address : inst_fetch_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 52:21 54:20 68:20]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 51:28]
      mem_granted <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 51:28]
    end else if (mem_io_bus_request) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 74:28]
      mem_granted <= _GEN_10;
    end else begin
      mem_granted <= _GEN_9;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mem_granted = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CPU_1(
  input         clock,
  input         reset,
  output        io_axi4_channels_write_address_channel_AWVALID, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input         io_axi4_channels_write_address_channel_AWREADY, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output [31:0] io_axi4_channels_write_address_channel_AWADDR, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output        io_axi4_channels_write_data_channel_WVALID, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input         io_axi4_channels_write_data_channel_WREADY, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output [31:0] io_axi4_channels_write_data_channel_WDATA, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output [3:0]  io_axi4_channels_write_data_channel_WSTRB, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input         io_axi4_channels_write_response_channel_BVALID, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output        io_axi4_channels_write_response_channel_BREADY, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output        io_axi4_channels_read_address_channel_ARVALID, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input         io_axi4_channels_read_address_channel_ARREADY, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output [31:0] io_axi4_channels_read_address_channel_ARADDR, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input         io_axi4_channels_read_data_channel_RVALID, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output        io_axi4_channels_read_data_channel_RREADY, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input  [31:0] io_axi4_channels_read_data_channel_RDATA, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input         io_stall_flag_bus, // @[src/main/scala/riscv/core/CPU.scala 23:14]
  input         io_instruction_valid // @[src/main/scala/riscv/core/CPU.scala 23:14]
);
  wire  cpu_clock; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_reset; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire [31:0] cpu_io_axi4_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire [31:0] cpu_io_axi4_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire [3:0] cpu_io_axi4_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire [31:0] cpu_io_axi4_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_axi4_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire [31:0] cpu_io_axi4_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire [31:0] cpu_io_bus_address; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire [31:0] cpu_io_interrupt_flag; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_stall_flag_bus; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  wire  cpu_io_instruction_valid; // @[src/main/scala/riscv/core/CPU.scala 29:23]
  CPU cpu ( // @[src/main/scala/riscv/core/CPU.scala 29:23]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_axi4_channels_write_address_channel_AWVALID(cpu_io_axi4_channels_write_address_channel_AWVALID),
    .io_axi4_channels_write_address_channel_AWREADY(cpu_io_axi4_channels_write_address_channel_AWREADY),
    .io_axi4_channels_write_address_channel_AWADDR(cpu_io_axi4_channels_write_address_channel_AWADDR),
    .io_axi4_channels_write_data_channel_WVALID(cpu_io_axi4_channels_write_data_channel_WVALID),
    .io_axi4_channels_write_data_channel_WREADY(cpu_io_axi4_channels_write_data_channel_WREADY),
    .io_axi4_channels_write_data_channel_WDATA(cpu_io_axi4_channels_write_data_channel_WDATA),
    .io_axi4_channels_write_data_channel_WSTRB(cpu_io_axi4_channels_write_data_channel_WSTRB),
    .io_axi4_channels_write_response_channel_BVALID(cpu_io_axi4_channels_write_response_channel_BVALID),
    .io_axi4_channels_write_response_channel_BREADY(cpu_io_axi4_channels_write_response_channel_BREADY),
    .io_axi4_channels_read_address_channel_ARVALID(cpu_io_axi4_channels_read_address_channel_ARVALID),
    .io_axi4_channels_read_address_channel_ARREADY(cpu_io_axi4_channels_read_address_channel_ARREADY),
    .io_axi4_channels_read_address_channel_ARADDR(cpu_io_axi4_channels_read_address_channel_ARADDR),
    .io_axi4_channels_read_data_channel_RVALID(cpu_io_axi4_channels_read_data_channel_RVALID),
    .io_axi4_channels_read_data_channel_RREADY(cpu_io_axi4_channels_read_data_channel_RREADY),
    .io_axi4_channels_read_data_channel_RDATA(cpu_io_axi4_channels_read_data_channel_RDATA),
    .io_bus_address(cpu_io_bus_address),
    .io_interrupt_flag(cpu_io_interrupt_flag),
    .io_stall_flag_bus(cpu_io_stall_flag_bus),
    .io_instruction_valid(cpu_io_instruction_valid)
  );
  assign io_axi4_channels_write_address_channel_AWVALID = cpu_io_axi4_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_write_address_channel_AWADDR = cpu_io_axi4_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_write_data_channel_WVALID = cpu_io_axi4_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_write_data_channel_WDATA = cpu_io_axi4_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_write_data_channel_WSTRB = cpu_io_axi4_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_write_response_channel_BREADY = cpu_io_axi4_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_read_address_channel_ARVALID = cpu_io_axi4_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_read_address_channel_ARADDR = cpu_io_axi4_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_axi4_channels_read_data_channel_RREADY = cpu_io_axi4_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign io_bus_address = cpu_io_bus_address; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_axi4_channels_write_address_channel_AWREADY = io_axi4_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_axi4_channels_write_data_channel_WREADY = io_axi4_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_axi4_channels_write_response_channel_BVALID = io_axi4_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_axi4_channels_read_address_channel_ARREADY = io_axi4_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_axi4_channels_read_data_channel_RVALID = io_axi4_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_axi4_channels_read_data_channel_RDATA = io_axi4_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_stall_flag_bus = io_stall_flag_bus; // @[src/main/scala/riscv/core/CPU.scala 30:14]
  assign cpu_io_instruction_valid = io_instruction_valid; // @[src/main/scala/riscv/core/CPU.scala 30:14]
endmodule
module BlockRAM(
  input         clock,
  input  [31:0] io_read_address, // @[src/main/scala/peripheral/Memory.scala 24:14]
  input  [31:0] io_write_address, // @[src/main/scala/peripheral/Memory.scala 24:14]
  input  [31:0] io_write_data, // @[src/main/scala/peripheral/Memory.scala 24:14]
  input         io_write_enable, // @[src/main/scala/peripheral/Memory.scala 24:14]
  input         io_write_strobe_0, // @[src/main/scala/peripheral/Memory.scala 24:14]
  input         io_write_strobe_1, // @[src/main/scala/peripheral/Memory.scala 24:14]
  input         io_write_strobe_2, // @[src/main/scala/peripheral/Memory.scala 24:14]
  input         io_write_strobe_3, // @[src/main/scala/peripheral/Memory.scala 24:14]
  output [31:0] io_read_data // @[src/main/scala/peripheral/Memory.scala 24:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_0_io_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_0_io_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_0_io_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_0_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_0_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_0_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_0_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_0_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_0_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_0_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  reg  mem_0_io_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_0_io_read_data_MPORT_addr_pipe_0;
  reg  mem_0_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_0_io_debug_read_data_MPORT_addr_pipe_0;
  reg [7:0] mem_1 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_1_io_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_1_io_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_1_io_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_1_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_1_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_1_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_1_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_1_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_1_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_1_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  reg  mem_1_io_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_1_io_read_data_MPORT_addr_pipe_0;
  reg  mem_1_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_1_io_debug_read_data_MPORT_addr_pipe_0;
  reg [7:0] mem_2 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_2_io_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_2_io_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_2_io_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_2_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_2_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_2_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_2_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_2_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_2_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_2_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  reg  mem_2_io_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_2_io_read_data_MPORT_addr_pipe_0;
  reg  mem_2_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_2_io_debug_read_data_MPORT_addr_pipe_0;
  reg [7:0] mem_3 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_3_io_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_3_io_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_3_io_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_3_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_3_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_3_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [7:0] mem_3_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire [12:0] mem_3_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_3_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 36:24]
  wire  mem_3_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 36:24]
  reg  mem_3_io_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_3_io_read_data_MPORT_addr_pipe_0;
  reg  mem_3_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_3_io_debug_read_data_MPORT_addr_pipe_0;
  wire [31:0] _T = {{2'd0}, io_write_address[31:2]}; // @[src/main/scala/peripheral/Memory.scala 42:33]
  wire [31:0] _io_read_data_T = {{2'd0}, io_read_address[31:2]}; // @[src/main/scala/peripheral/Memory.scala 44:45]
  wire [15:0] io_read_data_lo = {mem_1_io_read_data_MPORT_data,mem_0_io_read_data_MPORT_data}; // @[src/main/scala/peripheral/Memory.scala 44:69]
  wire [15:0] io_read_data_hi = {mem_3_io_read_data_MPORT_data,mem_2_io_read_data_MPORT_data}; // @[src/main/scala/peripheral/Memory.scala 44:69]
  assign mem_0_io_read_data_MPORT_en = mem_0_io_read_data_MPORT_en_pipe_0;
  assign mem_0_io_read_data_MPORT_addr = mem_0_io_read_data_MPORT_addr_pipe_0;
  assign mem_0_io_read_data_MPORT_data = mem_0[mem_0_io_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_0_io_debug_read_data_MPORT_en = mem_0_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_0_io_debug_read_data_MPORT_addr = mem_0_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_0_io_debug_read_data_MPORT_data = mem_0[mem_0_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_0_MPORT_data = io_write_data[7:0];
  assign mem_0_MPORT_addr = _T[12:0];
  assign mem_0_MPORT_mask = io_write_strobe_0;
  assign mem_0_MPORT_en = io_write_enable;
  assign mem_1_io_read_data_MPORT_en = mem_1_io_read_data_MPORT_en_pipe_0;
  assign mem_1_io_read_data_MPORT_addr = mem_1_io_read_data_MPORT_addr_pipe_0;
  assign mem_1_io_read_data_MPORT_data = mem_1[mem_1_io_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_1_io_debug_read_data_MPORT_en = mem_1_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_1_io_debug_read_data_MPORT_addr = mem_1_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_1_io_debug_read_data_MPORT_data = mem_1[mem_1_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_1_MPORT_data = io_write_data[15:8];
  assign mem_1_MPORT_addr = _T[12:0];
  assign mem_1_MPORT_mask = io_write_strobe_1;
  assign mem_1_MPORT_en = io_write_enable;
  assign mem_2_io_read_data_MPORT_en = mem_2_io_read_data_MPORT_en_pipe_0;
  assign mem_2_io_read_data_MPORT_addr = mem_2_io_read_data_MPORT_addr_pipe_0;
  assign mem_2_io_read_data_MPORT_data = mem_2[mem_2_io_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_2_io_debug_read_data_MPORT_en = mem_2_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_2_io_debug_read_data_MPORT_addr = mem_2_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_2_io_debug_read_data_MPORT_data = mem_2[mem_2_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_2_MPORT_data = io_write_data[23:16];
  assign mem_2_MPORT_addr = _T[12:0];
  assign mem_2_MPORT_mask = io_write_strobe_2;
  assign mem_2_MPORT_en = io_write_enable;
  assign mem_3_io_read_data_MPORT_en = mem_3_io_read_data_MPORT_en_pipe_0;
  assign mem_3_io_read_data_MPORT_addr = mem_3_io_read_data_MPORT_addr_pipe_0;
  assign mem_3_io_read_data_MPORT_data = mem_3[mem_3_io_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_3_io_debug_read_data_MPORT_en = mem_3_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_3_io_debug_read_data_MPORT_addr = mem_3_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_3_io_debug_read_data_MPORT_data = mem_3[mem_3_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 36:24]
  assign mem_3_MPORT_data = io_write_data[31:24];
  assign mem_3_MPORT_addr = _T[12:0];
  assign mem_3_MPORT_mask = io_write_strobe_3;
  assign mem_3_MPORT_en = io_write_enable;
  assign io_read_data = {io_read_data_hi,io_read_data_lo}; // @[src/main/scala/peripheral/Memory.scala 44:69]
  always @(posedge clock) begin
    if (mem_0_MPORT_en & mem_0_MPORT_mask) begin
      mem_0[mem_0_MPORT_addr] <= mem_0_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
    end
    mem_0_io_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_io_read_data_MPORT_addr_pipe_0 <= _io_read_data_T[12:0];
    end
    mem_0_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
    if (mem_1_MPORT_en & mem_1_MPORT_mask) begin
      mem_1[mem_1_MPORT_addr] <= mem_1_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
    end
    mem_1_io_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_io_read_data_MPORT_addr_pipe_0 <= _io_read_data_T[12:0];
    end
    mem_1_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
    if (mem_2_MPORT_en & mem_2_MPORT_mask) begin
      mem_2[mem_2_MPORT_addr] <= mem_2_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
    end
    mem_2_io_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_io_read_data_MPORT_addr_pipe_0 <= _io_read_data_T[12:0];
    end
    mem_2_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
    if (mem_3_MPORT_en & mem_3_MPORT_mask) begin
      mem_3[mem_3_MPORT_addr] <= mem_3_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 36:24]
    end
    mem_3_io_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_io_read_data_MPORT_addr_pipe_0 <= _io_read_data_T[12:0];
    end
    mem_3_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_1[initvar] = _RAND_5[7:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_2[initvar] = _RAND_10[7:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_3[initvar] = _RAND_15[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_io_read_data_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_io_read_data_MPORT_addr_pipe_0 = _RAND_2[12:0];
  _RAND_3 = {1{`RANDOM}};
  mem_0_io_debug_read_data_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mem_0_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_4[12:0];
  _RAND_6 = {1{`RANDOM}};
  mem_1_io_read_data_MPORT_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mem_1_io_read_data_MPORT_addr_pipe_0 = _RAND_7[12:0];
  _RAND_8 = {1{`RANDOM}};
  mem_1_io_debug_read_data_MPORT_en_pipe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mem_1_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_9[12:0];
  _RAND_11 = {1{`RANDOM}};
  mem_2_io_read_data_MPORT_en_pipe_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  mem_2_io_read_data_MPORT_addr_pipe_0 = _RAND_12[12:0];
  _RAND_13 = {1{`RANDOM}};
  mem_2_io_debug_read_data_MPORT_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  mem_2_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_14[12:0];
  _RAND_16 = {1{`RANDOM}};
  mem_3_io_read_data_MPORT_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  mem_3_io_read_data_MPORT_addr_pipe_0 = _RAND_17[12:0];
  _RAND_18 = {1{`RANDOM}};
  mem_3_io_debug_read_data_MPORT_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  mem_3_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_19[12:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4LiteSlave_1(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_bundle_write, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  input  [31:0] io_bundle_read_data, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output [31:0] io_bundle_write_data, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_bundle_write_strobe_0, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_bundle_write_strobe_1, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_bundle_write_strobe_2, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output        io_bundle_write_strobe_3, // @[src/main/scala/bus/AXI4Lite.scala 121:14]
  output [31:0] io_bundle_address // @[src/main/scala/bus/AXI4Lite.scala 121:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[src/main/scala/bus/AXI4Lite.scala 125:22]
  reg [31:0] addr; // @[src/main/scala/bus/AXI4Lite.scala 126:21]
  reg  write; // @[src/main/scala/bus/AXI4Lite.scala 130:22]
  reg [31:0] write_data; // @[src/main/scala/bus/AXI4Lite.scala 132:27]
  reg  write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
  reg  write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
  reg  write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
  reg  write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
  reg  ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 137:24]
  reg  RVALID; // @[src/main/scala/bus/AXI4Lite.scala 139:23]
  reg  AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 146:24]
  reg  WREADY; // @[src/main/scala/bus/AXI4Lite.scala 148:23]
  reg  BVALID; // @[src/main/scala/bus/AXI4Lite.scala 151:23]
  wire [2:0] _GEN_6 = io_channels_read_data_channel_RREADY & RVALID ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 179:60 180:15 125:22]
  wire  _GEN_7 = io_channels_read_data_channel_RREADY & RVALID ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 178:14 179:60 181:16]
  wire [31:0] _GEN_8 = io_channels_write_address_channel_AWVALID & AWREADY ? io_channels_write_address_channel_AWADDR :
    addr; // @[src/main/scala/bus/AXI4Lite.scala 186:66 187:14 126:21]
  wire [2:0] _GEN_9 = io_channels_write_address_channel_AWVALID & AWREADY ? 3'h4 : state; // @[src/main/scala/bus/AXI4Lite.scala 186:66 188:15 125:22]
  wire  _GEN_10 = io_channels_write_address_channel_AWVALID & AWREADY ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 185:15 186:66 189:17]
  wire [2:0] _GEN_11 = io_channels_write_data_channel_WVALID & WREADY ? 3'h5 : state; // @[src/main/scala/bus/AXI4Lite.scala 194:61 195:15 125:22]
  wire  _GEN_13 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[0] :
    write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 194:61 197:22 134:29]
  wire  _GEN_14 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[1] :
    write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 194:61 197:22 134:29]
  wire  _GEN_15 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[2] :
    write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 194:61 197:22 134:29]
  wire  _GEN_16 = io_channels_write_data_channel_WVALID & WREADY ? io_channels_write_data_channel_WSTRB[3] :
    write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 194:61 197:22 134:29]
  wire  _GEN_17 = io_channels_write_data_channel_WVALID & WREADY | write; // @[src/main/scala/bus/AXI4Lite.scala 194:61 198:15 130:22]
  wire  _GEN_18 = io_channels_write_data_channel_WVALID & WREADY ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 193:14 194:61 199:16]
  wire [2:0] _GEN_19 = io_channels_write_response_channel_BREADY & BVALID ? 3'h0 : state; // @[src/main/scala/bus/AXI4Lite.scala 205:65 206:15 125:22]
  wire  _GEN_20 = io_channels_write_response_channel_BREADY & BVALID ? 1'h0 : write; // @[src/main/scala/bus/AXI4Lite.scala 205:65 207:15 130:22]
  wire  _GEN_21 = io_channels_write_response_channel_BREADY & BVALID ? 1'h0 : 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 204:14 205:65 208:16]
  wire  _GEN_22 = 3'h5 == state ? 1'h0 : WREADY; // @[src/main/scala/bus/AXI4Lite.scala 156:17 203:14 148:23]
  wire  _GEN_23 = 3'h5 == state ? _GEN_21 : BVALID; // @[src/main/scala/bus/AXI4Lite.scala 156:17 151:23]
  wire [2:0] _GEN_24 = 3'h5 == state ? _GEN_19 : state; // @[src/main/scala/bus/AXI4Lite.scala 156:17 125:22]
  wire  _GEN_25 = 3'h5 == state ? _GEN_20 : write; // @[src/main/scala/bus/AXI4Lite.scala 156:17 130:22]
  wire  _GEN_26 = 3'h4 == state ? _GEN_18 : _GEN_22; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire [2:0] _GEN_27 = 3'h4 == state ? _GEN_11 : _GEN_24; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire  _GEN_29 = 3'h4 == state ? _GEN_13 : write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_30 = 3'h4 == state ? _GEN_14 : write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_31 = 3'h4 == state ? _GEN_15 : write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_32 = 3'h4 == state ? _GEN_16 : write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_33 = 3'h4 == state ? _GEN_17 : _GEN_25; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire  _GEN_34 = 3'h4 == state ? BVALID : _GEN_23; // @[src/main/scala/bus/AXI4Lite.scala 156:17 151:23]
  wire  _GEN_35 = 3'h3 == state ? _GEN_10 : AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 156:17 146:24]
  wire [31:0] _GEN_36 = 3'h3 == state ? _GEN_8 : addr; // @[src/main/scala/bus/AXI4Lite.scala 156:17 126:21]
  wire [2:0] _GEN_37 = 3'h3 == state ? _GEN_9 : _GEN_27; // @[src/main/scala/bus/AXI4Lite.scala 156:17]
  wire  _GEN_38 = 3'h3 == state ? WREADY : _GEN_26; // @[src/main/scala/bus/AXI4Lite.scala 156:17 148:23]
  wire  _GEN_40 = 3'h3 == state ? write_strobe_0 : _GEN_29; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_41 = 3'h3 == state ? write_strobe_1 : _GEN_30; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_42 = 3'h3 == state ? write_strobe_2 : _GEN_31; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_43 = 3'h3 == state ? write_strobe_3 : _GEN_32; // @[src/main/scala/bus/AXI4Lite.scala 156:17 134:29]
  wire  _GEN_44 = 3'h3 == state ? write : _GEN_33; // @[src/main/scala/bus/AXI4Lite.scala 156:17 130:22]
  wire  _GEN_45 = 3'h3 == state ? BVALID : _GEN_34; // @[src/main/scala/bus/AXI4Lite.scala 156:17 151:23]
  assign io_channels_write_address_channel_AWREADY = AWREADY; // @[src/main/scala/bus/AXI4Lite.scala 147:45]
  assign io_channels_write_data_channel_WREADY = WREADY; // @[src/main/scala/bus/AXI4Lite.scala 149:41]
  assign io_channels_write_response_channel_BVALID = BVALID; // @[src/main/scala/bus/AXI4Lite.scala 152:45]
  assign io_channels_read_address_channel_ARREADY = ARREADY; // @[src/main/scala/bus/AXI4Lite.scala 138:44]
  assign io_channels_read_data_channel_RVALID = RVALID; // @[src/main/scala/bus/AXI4Lite.scala 140:40]
  assign io_channels_read_data_channel_RDATA = io_bundle_read_data; // @[src/main/scala/bus/AXI4Lite.scala 144:39]
  assign io_bundle_write = write; // @[src/main/scala/bus/AXI4Lite.scala 131:19]
  assign io_bundle_write_data = write_data; // @[src/main/scala/bus/AXI4Lite.scala 133:24]
  assign io_bundle_write_strobe_0 = write_strobe_0; // @[src/main/scala/bus/AXI4Lite.scala 135:26]
  assign io_bundle_write_strobe_1 = write_strobe_1; // @[src/main/scala/bus/AXI4Lite.scala 135:26]
  assign io_bundle_write_strobe_2 = write_strobe_2; // @[src/main/scala/bus/AXI4Lite.scala 135:26]
  assign io_bundle_write_strobe_3 = write_strobe_3; // @[src/main/scala/bus/AXI4Lite.scala 135:26]
  assign io_bundle_address = addr; // @[src/main/scala/bus/AXI4Lite.scala 127:21]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 125:22]
      state <= 3'h0; // @[src/main/scala/bus/AXI4Lite.scala 125:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (io_channels_write_address_channel_AWVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 162:55]
        state <= 3'h3; // @[src/main/scala/bus/AXI4Lite.scala 163:15]
      end else if (io_channels_read_address_channel_ARVALID) begin // @[src/main/scala/bus/AXI4Lite.scala 164:60]
        state <= 3'h1; // @[src/main/scala/bus/AXI4Lite.scala 165:15]
      end
    end else if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 170:65]
        state <= 3'h2; // @[src/main/scala/bus/AXI4Lite.scala 171:15]
      end
    end else if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      state <= _GEN_6;
    end else begin
      state <= _GEN_37;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 126:21]
      addr <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 126:21]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 170:65]
          addr <= io_channels_read_address_channel_ARADDR; // @[src/main/scala/bus/AXI4Lite.scala 172:14]
        end
      end else if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        addr <= _GEN_36;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 130:22]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 130:22]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      write <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 159:13]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        write <= _GEN_44;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 132:27]
      write_data <= 32'h0; // @[src/main/scala/bus/AXI4Lite.scala 132:27]
    end else begin
      write_data <= io_channels_write_data_channel_WDATA;
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 134:29]
      write_strobe_0 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          write_strobe_0 <= _GEN_40;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 134:29]
      write_strobe_1 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          write_strobe_1 <= _GEN_41;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 134:29]
      write_strobe_2 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          write_strobe_2 <= _GEN_42;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 134:29]
      write_strobe_3 <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 134:29]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          write_strobe_3 <= _GEN_43;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 137:24]
      ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 137:24]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (3'h1 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (io_channels_read_address_channel_ARVALID & ARREADY) begin // @[src/main/scala/bus/AXI4Lite.scala 170:65]
          ARREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 174:17]
        end else begin
          ARREADY <= 1'h1; // @[src/main/scala/bus/AXI4Lite.scala 169:15]
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 139:23]
      RVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 139:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      RVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 160:14]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (3'h2 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        RVALID <= _GEN_7;
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 146:24]
      AWREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 146:24]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          AWREADY <= _GEN_35;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 148:23]
      WREADY <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 148:23]
    end else if (!(3'h0 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
          WREADY <= _GEN_38;
        end
      end
    end
    if (reset) begin // @[src/main/scala/bus/AXI4Lite.scala 151:23]
      BVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 151:23]
    end else if (3'h0 == state) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      BVALID <= 1'h0; // @[src/main/scala/bus/AXI4Lite.scala 161:14]
    end else if (!(3'h1 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
      if (!(3'h2 == state)) begin // @[src/main/scala/bus/AXI4Lite.scala 156:17]
        BVALID <= _GEN_45;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  write = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  write_data = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  write_strobe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  write_strobe_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  write_strobe_2 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  write_strobe_3 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ARREADY = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  RVALID = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  AWREADY = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  WREADY = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  BVALID = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Memory(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/Memory.scala 50:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input  [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/Memory.scala 50:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input  [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/peripheral/Memory.scala 50:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/Memory.scala 50:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input  [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/Memory.scala 50:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/Memory.scala 50:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/Memory.scala 50:14]
  output [31:0] io_channels_read_data_channel_RDATA // @[src/main/scala/peripheral/Memory.scala 50:14]
);
  wire  mem_clock; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire [31:0] mem_io_read_address; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire [31:0] mem_io_write_address; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire [31:0] mem_io_write_data; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire  mem_io_write_enable; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire  mem_io_write_strobe_0; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire  mem_io_write_strobe_1; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire  mem_io_write_strobe_2; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire  mem_io_write_strobe_3; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire [31:0] mem_io_read_data; // @[src/main/scala/peripheral/Memory.scala 57:19]
  wire  slave_clock; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_reset; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [31:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [3:0] slave_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [31:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire  slave_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/Memory.scala 58:21]
  wire [31:0] slave_io_bundle_address; // @[src/main/scala/peripheral/Memory.scala 58:21]
  BlockRAM mem ( // @[src/main/scala/peripheral/Memory.scala 57:19]
    .clock(mem_clock),
    .io_read_address(mem_io_read_address),
    .io_write_address(mem_io_write_address),
    .io_write_data(mem_io_write_data),
    .io_write_enable(mem_io_write_enable),
    .io_write_strobe_0(mem_io_write_strobe_0),
    .io_write_strobe_1(mem_io_write_strobe_1),
    .io_write_strobe_2(mem_io_write_strobe_2),
    .io_write_strobe_3(mem_io_write_strobe_3),
    .io_read_data(mem_io_read_data)
  );
  AXI4LiteSlave_1 slave ( // @[src/main/scala/peripheral/Memory.scala 58:21]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(slave_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_write_data(slave_io_bundle_write_data),
    .io_bundle_write_strobe_0(slave_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(slave_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(slave_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(slave_io_bundle_write_strobe_3),
    .io_bundle_address(slave_io_bundle_address)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign mem_clock = clock;
  assign mem_io_read_address = slave_io_bundle_address; // @[src/main/scala/peripheral/Memory.scala 67:23]
  assign mem_io_write_address = slave_io_bundle_address; // @[src/main/scala/peripheral/Memory.scala 64:24]
  assign mem_io_write_data = slave_io_bundle_write_data; // @[src/main/scala/peripheral/Memory.scala 63:21]
  assign mem_io_write_enable = slave_io_bundle_write; // @[src/main/scala/peripheral/Memory.scala 62:23]
  assign mem_io_write_strobe_0 = slave_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/Memory.scala 65:23]
  assign mem_io_write_strobe_1 = slave_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/Memory.scala 65:23]
  assign mem_io_write_strobe_2 = slave_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/Memory.scala 65:23]
  assign mem_io_write_strobe_3 = slave_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/Memory.scala 65:23]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_write_address_channel_AWADDR = io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_write_data_channel_WSTRB = io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_read_address_channel_ARADDR = io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Memory.scala 59:21]
  assign slave_io_bundle_read_data = mem_io_read_data; // @[src/main/scala/peripheral/Memory.scala 68:29]
endmodule
module Timer(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/Timer.scala 23:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/Timer.scala 23:14]
  input  [7:0]  io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/Timer.scala 23:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/Timer.scala 23:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/Timer.scala 23:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/Timer.scala 23:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/Timer.scala 23:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/Timer.scala 23:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/Timer.scala 23:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/Timer.scala 23:14]
  input  [7:0]  io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/Timer.scala 23:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/Timer.scala 23:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/Timer.scala 23:14]
  output [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/Timer.scala 23:14]
  output        io_signal_interrupt // @[src/main/scala/peripheral/Timer.scala 23:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  slave_clock; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_reset; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire [7:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire [7:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_bundle_read; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/Timer.scala 30:21]
  wire [7:0] slave_io_bundle_address; // @[src/main/scala/peripheral/Timer.scala 30:21]
  reg [31:0] count; // @[src/main/scala/peripheral/Timer.scala 33:22]
  reg [31:0] limit; // @[src/main/scala/peripheral/Timer.scala 34:22]
  reg  enabled; // @[src/main/scala/peripheral/Timer.scala 36:24]
  wire [31:0] _slave_io_bundle_read_data_T_1 = 8'h4 == slave_io_bundle_address ? limit : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _slave_io_bundle_read_data_T_3 = 8'h8 == slave_io_bundle_address ? {{31'd0}, enabled} :
    _slave_io_bundle_read_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _GEN_1 = slave_io_bundle_address == 8'h8 ? slave_io_bundle_write_data != 32'h0 : enabled; // @[src/main/scala/peripheral/Timer.scala 55:51 56:15 36:24]
  wire  _GEN_4 = slave_io_bundle_address == 8'h4 ? enabled : _GEN_1; // @[src/main/scala/peripheral/Timer.scala 36:24 52:45]
  wire  _GEN_7 = slave_io_bundle_write ? _GEN_4 : enabled; // @[src/main/scala/peripheral/Timer.scala 36:24 51:31]
  wire [31:0] _io_signal_interrupt_T_1 = limit - 32'ha; // @[src/main/scala/peripheral/Timer.scala 60:54]
  wire [31:0] _count_T_1 = count + 32'h1; // @[src/main/scala/peripheral/Timer.scala 65:20]
  AXI4LiteSlave slave ( // @[src/main/scala/peripheral/Timer.scala 30:21]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_read(slave_io_bundle_read),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_write_data(slave_io_bundle_write_data),
    .io_bundle_address(slave_io_bundle_address)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign io_signal_interrupt = enabled & count >= _io_signal_interrupt_T_1; // @[src/main/scala/peripheral/Timer.scala 60:34]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_channels_write_address_channel_AWADDR = io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_channels_read_address_channel_ARADDR = io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/Timer.scala 31:21]
  assign slave_io_bundle_read_data = slave_io_bundle_read ? _slave_io_bundle_read_data_T_3 : 32'h0; // @[src/main/scala/peripheral/Timer.scala 39:29 41:30 42:31]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/Timer.scala 33:22]
      count <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 33:22]
    end else if (count >= limit) begin // @[src/main/scala/peripheral/Timer.scala 62:24]
      count <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 63:11]
    end else begin
      count <= _count_T_1; // @[src/main/scala/peripheral/Timer.scala 65:11]
    end
    if (reset) begin // @[src/main/scala/peripheral/Timer.scala 34:22]
      limit <= 32'h5f5e100; // @[src/main/scala/peripheral/Timer.scala 34:22]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/Timer.scala 51:31]
      if (slave_io_bundle_address == 8'h4) begin // @[src/main/scala/peripheral/Timer.scala 52:45]
        limit <= slave_io_bundle_write_data; // @[src/main/scala/peripheral/Timer.scala 53:13]
      end
    end
    enabled <= reset | _GEN_7; // @[src/main/scala/peripheral/Timer.scala 36:{24,24}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  limit = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  enabled = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DummySlave(
  input         clock,
  input         reset,
  input         io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  output        io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input  [3:0]  io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input         io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  output        io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input  [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input  [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  output        io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input         io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input         io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  output        io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input  [3:0]  io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  output        io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  input         io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/DummySlave.scala 24:14]
  output [31:0] io_channels_read_data_channel_RDATA // @[src/main/scala/peripheral/DummySlave.scala 24:14]
);
  wire  slave_clock; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_reset; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [31:0] slave_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [31:0] slave_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [3:0] slave_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [31:0] slave_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [31:0] slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_bundle_write; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [31:0] slave_io_bundle_read_data; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [31:0] slave_io_bundle_write_data; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire  slave_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  wire [31:0] slave_io_bundle_address; // @[src/main/scala/peripheral/DummySlave.scala 28:21]
  AXI4LiteSlave_1 slave ( // @[src/main/scala/peripheral/DummySlave.scala 28:21]
    .clock(slave_clock),
    .reset(slave_reset),
    .io_channels_write_address_channel_AWVALID(slave_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(slave_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(slave_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(slave_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(slave_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(slave_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(slave_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(slave_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(slave_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(slave_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(slave_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(slave_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(slave_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(slave_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(slave_io_channels_read_data_channel_RDATA),
    .io_bundle_write(slave_io_bundle_write),
    .io_bundle_read_data(slave_io_bundle_read_data),
    .io_bundle_write_data(slave_io_bundle_write_data),
    .io_bundle_write_strobe_0(slave_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(slave_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(slave_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(slave_io_bundle_write_strobe_3),
    .io_bundle_address(slave_io_bundle_address)
  );
  assign io_channels_write_address_channel_AWREADY = slave_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign io_channels_write_data_channel_WREADY = slave_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign io_channels_write_response_channel_BVALID = slave_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign io_channels_read_address_channel_ARREADY = slave_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign io_channels_read_data_channel_RVALID = slave_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign io_channels_read_data_channel_RDATA = slave_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_clock = clock;
  assign slave_reset = reset;
  assign slave_io_channels_write_address_channel_AWVALID = io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_write_address_channel_AWADDR = {{28'd0}, io_channels_write_address_channel_AWADDR}; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_write_data_channel_WVALID = io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_write_data_channel_WDATA = io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_write_data_channel_WSTRB = io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_write_response_channel_BREADY = io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_read_address_channel_ARVALID = io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_read_address_channel_ARADDR = {{28'd0}, io_channels_read_address_channel_ARADDR}; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_channels_read_data_channel_RREADY = io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/DummySlave.scala 29:21]
  assign slave_io_bundle_read_data = 32'hdeadbeef; // @[src/main/scala/peripheral/DummySlave.scala 31:29]
endmodule
module DummyMaster(
  input         clock,
  input         reset,
  output        io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  input         io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output        io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  input         io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  input         io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output        io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output        io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  input         io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  input         io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  output        io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
  input  [31:0] io_channels_read_data_channel_RDATA // @[src/main/scala/peripheral/DummyMaster.scala 23:14]
);
  wire  master_clock; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_reset; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [31:0] master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [31:0] master_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [3:0] master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [31:0] master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [31:0] master_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [1:0] master_io_channels_read_data_channel_RRESP; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_read; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_write; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [31:0] master_io_bundle_read_data; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [31:0] master_io_bundle_write_data; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire [31:0] master_io_bundle_address; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_busy; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_read_valid; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  wire  master_io_bundle_write_valid; // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
  AXI4LiteMaster master ( // @[src/main/scala/peripheral/DummyMaster.scala 26:22]
    .clock(master_clock),
    .reset(master_reset),
    .io_channels_write_address_channel_AWVALID(master_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(master_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(master_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(master_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(master_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(master_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(master_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(master_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(master_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(master_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(master_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(master_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(master_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(master_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(master_io_channels_read_data_channel_RDATA),
    .io_channels_read_data_channel_RRESP(master_io_channels_read_data_channel_RRESP),
    .io_bundle_read(master_io_bundle_read),
    .io_bundle_write(master_io_bundle_write),
    .io_bundle_read_data(master_io_bundle_read_data),
    .io_bundle_write_data(master_io_bundle_write_data),
    .io_bundle_write_strobe_0(master_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(master_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(master_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(master_io_bundle_write_strobe_3),
    .io_bundle_address(master_io_bundle_address),
    .io_bundle_busy(master_io_bundle_busy),
    .io_bundle_read_valid(master_io_bundle_read_valid),
    .io_bundle_write_valid(master_io_bundle_write_valid)
  );
  assign io_channels_write_address_channel_AWVALID = master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_write_address_channel_AWADDR = master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_write_data_channel_WVALID = master_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_write_data_channel_WDATA = master_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_write_data_channel_WSTRB = master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_write_response_channel_BREADY = master_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_read_address_channel_ARVALID = master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_read_address_channel_ARADDR = master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign io_channels_read_data_channel_RREADY = master_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_clock = clock;
  assign master_reset = reset;
  assign master_io_channels_write_address_channel_AWREADY = io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_io_channels_write_data_channel_WREADY = io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_io_channels_write_response_channel_BVALID = io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_io_channels_read_address_channel_ARREADY = io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_io_channels_read_data_channel_RVALID = io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_io_channels_read_data_channel_RDATA = io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_io_channels_read_data_channel_RRESP = 2'h0; // @[src/main/scala/peripheral/DummyMaster.scala 27:22]
  assign master_io_bundle_read = 1'h0; // @[src/main/scala/peripheral/DummyMaster.scala 31:25]
  assign master_io_bundle_write = 1'h0; // @[src/main/scala/peripheral/DummyMaster.scala 30:26]
  assign master_io_bundle_write_data = 32'h0; // @[src/main/scala/peripheral/DummyMaster.scala 29:31]
  assign master_io_bundle_write_strobe_0 = 1'h0; // @[src/main/scala/peripheral/DummyMaster.scala 28:{43,43}]
  assign master_io_bundle_write_strobe_1 = 1'h0; // @[src/main/scala/peripheral/DummyMaster.scala 28:{43,43}]
  assign master_io_bundle_write_strobe_2 = 1'h0; // @[src/main/scala/peripheral/DummyMaster.scala 28:{43,43}]
  assign master_io_bundle_write_strobe_3 = 1'h0; // @[src/main/scala/peripheral/DummyMaster.scala 28:{43,43}]
  assign master_io_bundle_address = 32'h0; // @[src/main/scala/peripheral/DummyMaster.scala 32:28]
endmodule
module BusSwitch(
  input         clock,
  input         reset,
  input  [31:0] io_address, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_0_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_0_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_0_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_0_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_0_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_0_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [3:0]  io_slaves_0_write_data_channel_WSTRB, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_0_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_0_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_0_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_0_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_0_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_0_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_0_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_0_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_1_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_1_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_1_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_1_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_1_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_1_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_2_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_2_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_2_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_2_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_2_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_2_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_2_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_2_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_2_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_2_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_2_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_2_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_2_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_2_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_3_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_3_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_3_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_3_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_3_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_3_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_4_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_4_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_4_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_4_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_4_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_4_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_4_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_4_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_4_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_4_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_slaves_4_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_4_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_slaves_4_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_4_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_5_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_5_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_5_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_5_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_5_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_5_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_6_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_6_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_6_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_6_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_6_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_6_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_7_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_7_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_7_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_7_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_slaves_7_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_slaves_7_read_data_channel_RDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_master_write_address_channel_AWVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_master_write_address_channel_AWREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_master_write_address_channel_AWADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_master_write_data_channel_WVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_master_write_data_channel_WREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_master_write_data_channel_WDATA, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [3:0]  io_master_write_data_channel_WSTRB, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_master_write_response_channel_BVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_master_write_response_channel_BREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_master_read_address_channel_ARVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_master_read_address_channel_ARREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input  [31:0] io_master_read_address_channel_ARADDR, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output        io_master_read_data_channel_RVALID, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  input         io_master_read_data_channel_RREADY, // @[src/main/scala/bus/BusSwitch.scala 22:14]
  output [31:0] io_master_read_data_channel_RDATA // @[src/main/scala/bus/BusSwitch.scala 22:14]
);
  wire  dummy_clock; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_reset; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_write_address_channel_AWVALID; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire [31:0] dummy_io_channels_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_write_data_channel_WVALID; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire [31:0] dummy_io_channels_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire [3:0] dummy_io_channels_write_data_channel_WSTRB; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_write_response_channel_BREADY; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_read_address_channel_ARVALID; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire [31:0] dummy_io_channels_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire  dummy_io_channels_read_data_channel_RREADY; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire [31:0] dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/bus/BusSwitch.scala 27:21]
  wire [2:0] index = io_address[31:29]; // @[src/main/scala/bus/BusSwitch.scala 28:25]
  wire  _GEN_9 = 3'h1 == index ? io_slaves_1_write_address_channel_AWREADY : io_slaves_0_write_address_channel_AWREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_10 = 3'h2 == index ? io_slaves_2_write_address_channel_AWREADY : _GEN_9; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_11 = 3'h3 == index ? io_slaves_3_write_address_channel_AWREADY : _GEN_10; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_12 = 3'h4 == index ? io_slaves_4_write_address_channel_AWREADY : _GEN_11; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_13 = 3'h5 == index ? io_slaves_5_write_address_channel_AWREADY : _GEN_12; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_14 = 3'h6 == index ? io_slaves_6_write_address_channel_AWREADY : _GEN_13; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_41 = 3'h1 == index ? io_slaves_1_write_data_channel_WREADY : io_slaves_0_write_data_channel_WREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_42 = 3'h2 == index ? io_slaves_2_write_data_channel_WREADY : _GEN_41; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_43 = 3'h3 == index ? io_slaves_3_write_data_channel_WREADY : _GEN_42; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_44 = 3'h4 == index ? io_slaves_4_write_data_channel_WREADY : _GEN_43; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_45 = 3'h5 == index ? io_slaves_5_write_data_channel_WREADY : _GEN_44; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_46 = 3'h6 == index ? io_slaves_6_write_data_channel_WREADY : _GEN_45; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_65 = 3'h1 == index ? io_slaves_1_write_response_channel_BVALID : io_slaves_0_write_response_channel_BVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_66 = 3'h2 == index ? io_slaves_2_write_response_channel_BVALID : _GEN_65; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_67 = 3'h3 == index ? io_slaves_3_write_response_channel_BVALID : _GEN_66; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_68 = 3'h4 == index ? io_slaves_4_write_response_channel_BVALID : _GEN_67; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_69 = 3'h5 == index ? io_slaves_5_write_response_channel_BVALID : _GEN_68; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_70 = 3'h6 == index ? io_slaves_6_write_response_channel_BVALID : _GEN_69; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_97 = 3'h1 == index ? io_slaves_1_read_address_channel_ARREADY : io_slaves_0_read_address_channel_ARREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_98 = 3'h2 == index ? io_slaves_2_read_address_channel_ARREADY : _GEN_97; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_99 = 3'h3 == index ? io_slaves_3_read_address_channel_ARREADY : _GEN_98; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_100 = 3'h4 == index ? io_slaves_4_read_address_channel_ARREADY : _GEN_99; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_101 = 3'h5 == index ? io_slaves_5_read_address_channel_ARREADY : _GEN_100; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_102 = 3'h6 == index ? io_slaves_6_read_address_channel_ARREADY : _GEN_101; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_121 = 3'h1 == index ? io_slaves_1_read_data_channel_RVALID : io_slaves_0_read_data_channel_RVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_122 = 3'h2 == index ? io_slaves_2_read_data_channel_RVALID : _GEN_121; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_123 = 3'h3 == index ? io_slaves_3_read_data_channel_RVALID : _GEN_122; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_124 = 3'h4 == index ? io_slaves_4_read_data_channel_RVALID : _GEN_123; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_125 = 3'h5 == index ? io_slaves_5_read_data_channel_RVALID : _GEN_124; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire  _GEN_126 = 3'h6 == index ? io_slaves_6_read_data_channel_RVALID : _GEN_125; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire [31:0] _GEN_137 = 3'h1 == index ? io_slaves_1_read_data_channel_RDATA : io_slaves_0_read_data_channel_RDATA; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire [31:0] _GEN_138 = 3'h2 == index ? io_slaves_2_read_data_channel_RDATA : _GEN_137; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire [31:0] _GEN_139 = 3'h3 == index ? io_slaves_3_read_data_channel_RDATA : _GEN_138; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire [31:0] _GEN_140 = 3'h4 == index ? io_slaves_4_read_data_channel_RDATA : _GEN_139; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire [31:0] _GEN_141 = 3'h5 == index ? io_slaves_5_read_data_channel_RDATA : _GEN_140; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  wire [31:0] _GEN_142 = 3'h6 == index ? io_slaves_6_read_data_channel_RDATA : _GEN_141; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  DummyMaster dummy ( // @[src/main/scala/bus/BusSwitch.scala 27:21]
    .clock(dummy_clock),
    .reset(dummy_reset),
    .io_channels_write_address_channel_AWVALID(dummy_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(dummy_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(dummy_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(dummy_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(dummy_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(dummy_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(dummy_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(dummy_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(dummy_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(dummy_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(dummy_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(dummy_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(dummy_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(dummy_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(dummy_io_channels_read_data_channel_RDATA)
  );
  assign io_slaves_0_write_address_channel_AWVALID = 3'h0 == index ? io_master_write_address_channel_AWVALID :
    dummy_io_channels_write_address_channel_AWVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_write_address_channel_AWADDR = 3'h0 == index ? io_master_write_address_channel_AWADDR :
    dummy_io_channels_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_write_data_channel_WVALID = 3'h0 == index ? io_master_write_data_channel_WVALID :
    dummy_io_channels_write_data_channel_WVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_write_data_channel_WDATA = 3'h0 == index ? io_master_write_data_channel_WDATA :
    dummy_io_channels_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_write_data_channel_WSTRB = 3'h0 == index ? io_master_write_data_channel_WSTRB :
    dummy_io_channels_write_data_channel_WSTRB; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_write_response_channel_BREADY = 3'h0 == index ? io_master_write_response_channel_BREADY :
    dummy_io_channels_write_response_channel_BREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_read_address_channel_ARVALID = 3'h0 == index ? io_master_read_address_channel_ARVALID :
    dummy_io_channels_read_address_channel_ARVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_read_address_channel_ARADDR = 3'h0 == index ? io_master_read_address_channel_ARADDR :
    dummy_io_channels_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_0_read_data_channel_RREADY = 3'h0 == index ? io_master_read_data_channel_RREADY :
    dummy_io_channels_read_data_channel_RREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_write_address_channel_AWVALID = 3'h2 == index ? io_master_write_address_channel_AWVALID :
    dummy_io_channels_write_address_channel_AWVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_write_address_channel_AWADDR = 3'h2 == index ? io_master_write_address_channel_AWADDR :
    dummy_io_channels_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_write_data_channel_WVALID = 3'h2 == index ? io_master_write_data_channel_WVALID :
    dummy_io_channels_write_data_channel_WVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_write_data_channel_WDATA = 3'h2 == index ? io_master_write_data_channel_WDATA :
    dummy_io_channels_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_write_response_channel_BREADY = 3'h2 == index ? io_master_write_response_channel_BREADY :
    dummy_io_channels_write_response_channel_BREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_read_address_channel_ARVALID = 3'h2 == index ? io_master_read_address_channel_ARVALID :
    dummy_io_channels_read_address_channel_ARVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_read_address_channel_ARADDR = 3'h2 == index ? io_master_read_address_channel_ARADDR :
    dummy_io_channels_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_2_read_data_channel_RREADY = 3'h2 == index ? io_master_read_data_channel_RREADY :
    dummy_io_channels_read_data_channel_RREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_write_address_channel_AWVALID = 3'h4 == index ? io_master_write_address_channel_AWVALID :
    dummy_io_channels_write_address_channel_AWVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_write_address_channel_AWADDR = 3'h4 == index ? io_master_write_address_channel_AWADDR :
    dummy_io_channels_write_address_channel_AWADDR; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_write_data_channel_WVALID = 3'h4 == index ? io_master_write_data_channel_WVALID :
    dummy_io_channels_write_data_channel_WVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_write_data_channel_WDATA = 3'h4 == index ? io_master_write_data_channel_WDATA :
    dummy_io_channels_write_data_channel_WDATA; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_write_response_channel_BREADY = 3'h4 == index ? io_master_write_response_channel_BREADY :
    dummy_io_channels_write_response_channel_BREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_read_address_channel_ARVALID = 3'h4 == index ? io_master_read_address_channel_ARVALID :
    dummy_io_channels_read_address_channel_ARVALID; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_read_address_channel_ARADDR = 3'h4 == index ? io_master_read_address_channel_ARADDR :
    dummy_io_channels_read_address_channel_ARADDR; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_slaves_4_read_data_channel_RREADY = 3'h4 == index ? io_master_read_data_channel_RREADY :
    dummy_io_channels_read_data_channel_RREADY; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13} 30:18]
  assign io_master_write_address_channel_AWREADY = 3'h7 == index ? io_slaves_7_write_address_channel_AWREADY : _GEN_14; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  assign io_master_write_data_channel_WREADY = 3'h7 == index ? io_slaves_7_write_data_channel_WREADY : _GEN_46; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  assign io_master_write_response_channel_BVALID = 3'h7 == index ? io_slaves_7_write_response_channel_BVALID : _GEN_70; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  assign io_master_read_address_channel_ARREADY = 3'h7 == index ? io_slaves_7_read_address_channel_ARREADY : _GEN_102; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  assign io_master_read_data_channel_RVALID = 3'h7 == index ? io_slaves_7_read_data_channel_RVALID : _GEN_126; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  assign io_master_read_data_channel_RDATA = 3'h7 == index ? io_slaves_7_read_data_channel_RDATA : _GEN_142; // @[src/main/scala/bus/BusSwitch.scala 32:{13,13}]
  assign dummy_clock = clock;
  assign dummy_reset = reset;
  assign dummy_io_channels_write_address_channel_AWREADY = io_slaves_7_write_address_channel_AWREADY; // @[src/main/scala/bus/BusSwitch.scala 30:18]
  assign dummy_io_channels_write_data_channel_WREADY = io_slaves_7_write_data_channel_WREADY; // @[src/main/scala/bus/BusSwitch.scala 30:18]
  assign dummy_io_channels_write_response_channel_BVALID = io_slaves_7_write_response_channel_BVALID; // @[src/main/scala/bus/BusSwitch.scala 30:18]
  assign dummy_io_channels_read_address_channel_ARREADY = io_slaves_7_read_address_channel_ARREADY; // @[src/main/scala/bus/BusSwitch.scala 30:18]
  assign dummy_io_channels_read_data_channel_RVALID = io_slaves_7_read_data_channel_RVALID; // @[src/main/scala/bus/BusSwitch.scala 30:18]
  assign dummy_io_channels_read_data_channel_RDATA = io_slaves_7_read_data_channel_RDATA; // @[src/main/scala/bus/BusSwitch.scala 30:18]
endmodule
module InstructionROM(
  input         clock,
  input  [31:0] io_address, // @[src/main/scala/peripheral/InstructionROM.scala 28:14]
  output [31:0] io_data // @[src/main/scala/peripheral/InstructionROM.scala 28:14]
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1050]; // @[src/main/scala/peripheral/InstructionROM.scala 34:24]
  wire  mem_io_data_MPORT_en; // @[src/main/scala/peripheral/InstructionROM.scala 34:24]
  wire [10:0] mem_io_data_MPORT_addr; // @[src/main/scala/peripheral/InstructionROM.scala 34:24]
  wire [31:0] mem_io_data_MPORT_data; // @[src/main/scala/peripheral/InstructionROM.scala 34:24]
  reg  mem_io_data_MPORT_en_pipe_0;
  reg [10:0] mem_io_data_MPORT_addr_pipe_0;
  assign mem_io_data_MPORT_en = mem_io_data_MPORT_en_pipe_0;
  assign mem_io_data_MPORT_addr = mem_io_data_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_data_MPORT_data = mem[mem_io_data_MPORT_addr]; // @[src/main/scala/peripheral/InstructionROM.scala 34:24]
  `else
  assign mem_io_data_MPORT_data = mem_io_data_MPORT_addr >= 11'h41b ? _RAND_0[31:0] : mem[mem_io_data_MPORT_addr]; // @[src/main/scala/peripheral/InstructionROM.scala 34:24]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign io_data = mem_io_data_MPORT_data; // @[src/main/scala/peripheral/InstructionROM.scala 40:11]
  always @(posedge clock) begin
    mem_io_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_data_MPORT_addr_pipe_0 <= io_address[10:0];
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
  integer initvar;
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_0 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_data_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_data_MPORT_addr_pipe_0 = _RAND_2[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
initial begin
  $readmemh("/root/yatcpu/lab4/verilog/say_goodbye.asmbin.txt", mem);
end
endmodule
module ROMLoader(
  input         clock,
  input         reset,
  output        io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input         io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output        io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input         io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input         io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output        io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output        io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input         io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input         io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output        io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input  [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output [31:0] io_rom_address, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input  [31:0] io_rom_data, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  input         io_load_start, // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
  output        io_load_finished // @[src/main/scala/peripheral/ROMLoader.scala 23:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  master_clock; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_reset; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [31:0] master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [31:0] master_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [3:0] master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [31:0] master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [31:0] master_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [1:0] master_io_channels_read_data_channel_RRESP; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_read; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_write; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [31:0] master_io_bundle_read_data; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [31:0] master_io_bundle_write_data; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire [31:0] master_io_bundle_address; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_busy; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_read_valid; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  wire  master_io_bundle_write_valid; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  reg [31:0] address; // @[src/main/scala/peripheral/ROMLoader.scala 36:24]
  reg  valid; // @[src/main/scala/peripheral/ROMLoader.scala 37:22]
  reg  loading; // @[src/main/scala/peripheral/ROMLoader.scala 38:24]
  wire  _GEN_1 = io_load_start | loading; // @[src/main/scala/peripheral/ROMLoader.scala 43:23 45:13 38:24]
  wire [31:0] _GEN_2 = io_load_start ? 32'h0 : address; // @[src/main/scala/peripheral/ROMLoader.scala 43:23 46:13 36:24]
  wire  _T_1 = ~master_io_bundle_busy; // @[src/main/scala/peripheral/ROMLoader.scala 54:20]
  wire  _T_3 = address >= 32'h41a; // @[src/main/scala/peripheral/ROMLoader.scala 54:54]
  wire [33:0] _GEN_34 = {address, 2'h0}; // @[src/main/scala/peripheral/ROMLoader.scala 64:46]
  wire [34:0] _master_io_bundle_address_T = {{1'd0}, _GEN_34}; // @[src/main/scala/peripheral/ROMLoader.scala 64:46]
  wire [34:0] _master_io_bundle_address_T_2 = _master_io_bundle_address_T + 35'h1000; // @[src/main/scala/peripheral/ROMLoader.scala 64:61]
  wire [31:0] _GEN_5 = valid ? io_rom_data : 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 60:19 50:31 62:37]
  wire [34:0] _GEN_10 = valid ? _master_io_bundle_address_T_2 : 35'h0; // @[src/main/scala/peripheral/ROMLoader.scala 60:19 52:28 64:34]
  wire  _GEN_11 = _T_1 & ~master_io_bundle_write_valid & valid; // @[src/main/scala/peripheral/ROMLoader.scala 49:26 59:67]
  wire [31:0] _GEN_12 = _T_1 & ~master_io_bundle_write_valid ? _GEN_5 : 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 50:31 59:67]
  wire [34:0] _GEN_17 = _T_1 & ~master_io_bundle_write_valid ? _GEN_10 : 35'h0; // @[src/main/scala/peripheral/ROMLoader.scala 52:28 59:67]
  wire [31:0] _address_T_1 = address + 32'h1; // @[src/main/scala/peripheral/ROMLoader.scala 72:28]
  wire [34:0] _GEN_31 = loading ? _GEN_17 : 35'h0; // @[src/main/scala/peripheral/ROMLoader.scala 57:17 52:28]
  AXI4LiteMaster master ( // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    .clock(master_clock),
    .reset(master_reset),
    .io_channels_write_address_channel_AWVALID(master_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(master_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(master_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(master_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(master_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(master_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(master_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(master_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(master_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(master_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(master_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(master_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(master_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(master_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(master_io_channels_read_data_channel_RDATA),
    .io_channels_read_data_channel_RRESP(master_io_channels_read_data_channel_RRESP),
    .io_bundle_read(master_io_bundle_read),
    .io_bundle_write(master_io_bundle_write),
    .io_bundle_read_data(master_io_bundle_read_data),
    .io_bundle_write_data(master_io_bundle_write_data),
    .io_bundle_write_strobe_0(master_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(master_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(master_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(master_io_bundle_write_strobe_3),
    .io_bundle_address(master_io_bundle_address),
    .io_bundle_busy(master_io_bundle_busy),
    .io_bundle_read_valid(master_io_bundle_read_valid),
    .io_bundle_write_valid(master_io_bundle_write_valid)
  );
  assign io_channels_write_address_channel_AWVALID = master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_write_address_channel_AWADDR = master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_write_data_channel_WVALID = master_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_write_data_channel_WDATA = master_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_write_data_channel_WSTRB = master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_write_response_channel_BREADY = master_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_read_address_channel_ARVALID = master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_read_address_channel_ARADDR = master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_channels_read_data_channel_RREADY = master_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign io_rom_address = address; // @[src/main/scala/peripheral/ROMLoader.scala 79:18]
  assign io_load_finished = ~loading & ~master_io_bundle_busy & address >= 32'h41a; // @[src/main/scala/peripheral/ROMLoader.scala 54:43]
  assign master_clock = clock;
  assign master_reset = reset;
  assign master_io_channels_write_address_channel_AWREADY = io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign master_io_channels_write_data_channel_WREADY = io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign master_io_channels_write_response_channel_BVALID = io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign master_io_channels_read_address_channel_ARREADY = io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign master_io_channels_read_data_channel_RVALID = io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign master_io_channels_read_data_channel_RDATA = io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign master_io_channels_read_data_channel_RRESP = 2'h0; // @[src/main/scala/peripheral/ROMLoader.scala 34:22]
  assign master_io_bundle_read = 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 40:25]
  assign master_io_bundle_write = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 57:17 49:26]
  assign master_io_bundle_write_data = loading ? _GEN_12 : 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 57:17 50:31]
  assign master_io_bundle_write_strobe_0 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 57:17 51:33]
  assign master_io_bundle_write_strobe_1 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 57:17 51:33]
  assign master_io_bundle_write_strobe_2 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 57:17 51:33]
  assign master_io_bundle_write_strobe_3 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 57:17 51:33]
  assign master_io_bundle_address = _GEN_31[31:0];
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 36:24]
      address <= 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 36:24]
    end else if (loading) begin // @[src/main/scala/peripheral/ROMLoader.scala 57:17]
      if (master_io_bundle_write_valid) begin // @[src/main/scala/peripheral/ROMLoader.scala 67:40]
        if (_T_3) begin // @[src/main/scala/peripheral/ROMLoader.scala 68:41]
          address <= _GEN_2;
        end else begin
          address <= _address_T_1; // @[src/main/scala/peripheral/ROMLoader.scala 72:17]
        end
      end
    end else begin
      address <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 37:22]
      valid <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 37:22]
    end else if (loading) begin // @[src/main/scala/peripheral/ROMLoader.scala 57:17]
      if (master_io_bundle_write_valid) begin // @[src/main/scala/peripheral/ROMLoader.scala 67:40]
        valid <= _T_3;
      end else begin
        valid <= 1'h1; // @[src/main/scala/peripheral/ROMLoader.scala 58:11]
      end
    end else if (io_load_start) begin // @[src/main/scala/peripheral/ROMLoader.scala 43:23]
      valid <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 44:11]
    end
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 38:24]
      loading <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 38:24]
    end else if (loading) begin // @[src/main/scala/peripheral/ROMLoader.scala 57:17]
      if (master_io_bundle_write_valid) begin // @[src/main/scala/peripheral/ROMLoader.scala 67:40]
        if (_T_3) begin // @[src/main/scala/peripheral/ROMLoader.scala 68:41]
          loading <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 69:17]
        end else begin
          loading <= 1'h1; // @[src/main/scala/peripheral/ROMLoader.scala 71:17]
        end
      end else begin
        loading <= _GEN_1;
      end
    end else begin
      loading <= _GEN_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  address = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  loading = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Top(
  input   clock,
  input   reset,
  output  io_led, // @[src/main/scala/board/z710/z710/Top.scala 26:14]
  output  io_tx, // @[src/main/scala/board/z710/z710/Top.scala 26:14]
  input   io_rx // @[src/main/scala/board/z710/z710/Top.scala 26:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  uart_clock; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_reset; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire [7:0] uart_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire [31:0] uart_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire [7:0] uart_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire [31:0] uart_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_rxd; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_txd; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  uart_io_signal_interrupt; // @[src/main/scala/board/z710/z710/Top.scala 39:20]
  wire  cpu_clock; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_reset; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire [31:0] cpu_io_axi4_channels_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire [31:0] cpu_io_axi4_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire [3:0] cpu_io_axi4_channels_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire [31:0] cpu_io_axi4_channels_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_axi4_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire [31:0] cpu_io_axi4_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire [31:0] cpu_io_bus_address; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire [31:0] cpu_io_interrupt_flag; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_stall_flag_bus; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  cpu_io_instruction_valid; // @[src/main/scala/board/z710/z710/Top.scala 43:19]
  wire  mem_clock; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_reset; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire [31:0] mem_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire [31:0] mem_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire [3:0] mem_io_channels_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire [31:0] mem_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  mem_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire [31:0] mem_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 44:19]
  wire  timer_clock; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_reset; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire [7:0] timer_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire [31:0] timer_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire [7:0] timer_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire [31:0] timer_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  timer_io_signal_interrupt; // @[src/main/scala/board/z710/z710/Top.scala 45:21]
  wire  dummy_clock; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_reset; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire [3:0] dummy_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire [31:0] dummy_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire [3:0] dummy_io_channels_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire [3:0] dummy_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  dummy_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire [31:0] dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 46:21]
  wire  bus_switch_clock; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_reset; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_address; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_0_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_0_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [3:0] bus_switch_io_slaves_0_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_0_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_0_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_0_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_1_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_1_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_1_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_1_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_1_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_1_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_2_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_2_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_2_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_2_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_2_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_3_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_3_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_3_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_3_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_3_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_3_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_4_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_4_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_4_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_4_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_4_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_5_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_5_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_5_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_5_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_5_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_5_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_6_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_6_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_6_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_6_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_6_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_6_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_7_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_7_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_7_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_7_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_slaves_7_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_slaves_7_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_master_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_master_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [3:0] bus_switch_io_master_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_master_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  bus_switch_io_master_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire [31:0] bus_switch_io_master_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 48:26]
  wire  instruction_rom_clock; // @[src/main/scala/board/z710/z710/Top.scala 50:31]
  wire [31:0] instruction_rom_io_address; // @[src/main/scala/board/z710/z710/Top.scala 50:31]
  wire [31:0] instruction_rom_io_data; // @[src/main/scala/board/z710/z710/Top.scala 50:31]
  wire  rom_loader_clock; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_reset; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_channels_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire [3:0] rom_loader_io_channels_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_channels_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_rom_address; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_rom_data; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_load_start; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  wire  rom_loader_io_load_finished; // @[src/main/scala/board/z710/z710/Top.scala 51:26]
  reg [1:0] boot_state; // @[src/main/scala/board/z710/z710/Top.scala 37:27]
  wire  _GEN_1 = 2'h3 == boot_state ? 1'h0 : 1'h1; // @[src/main/scala/board/z710/z710/Top.scala 68:22 64:25 82:29]
  wire  _GEN_4 = 2'h1 == boot_state ? rom_loader_io_channels_write_address_channel_AWVALID :
    bus_switch_io_slaves_0_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire  _GEN_5 = 2'h1 == boot_state ? mem_io_channels_write_address_channel_AWREADY :
    dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 68:22 67:26 76:30]
  wire [31:0] _GEN_6 = 2'h1 == boot_state ? rom_loader_io_channels_write_address_channel_AWADDR :
    bus_switch_io_slaves_0_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire  _GEN_8 = 2'h1 == boot_state ? rom_loader_io_channels_write_data_channel_WVALID :
    bus_switch_io_slaves_0_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire  _GEN_9 = 2'h1 == boot_state ? mem_io_channels_write_data_channel_WREADY :
    dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 68:22 67:26 76:30]
  wire [31:0] _GEN_10 = 2'h1 == boot_state ? rom_loader_io_channels_write_data_channel_WDATA :
    bus_switch_io_slaves_0_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire [3:0] _GEN_11 = 2'h1 == boot_state ? rom_loader_io_channels_write_data_channel_WSTRB :
    bus_switch_io_slaves_0_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire  _GEN_12 = 2'h1 == boot_state ? mem_io_channels_write_response_channel_BVALID :
    dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 68:22 67:26 76:30]
  wire  _GEN_13 = 2'h1 == boot_state ? rom_loader_io_channels_write_response_channel_BREADY :
    bus_switch_io_slaves_0_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire  _GEN_15 = 2'h1 == boot_state ? rom_loader_io_channels_read_address_channel_ARVALID :
    bus_switch_io_slaves_0_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire  _GEN_16 = 2'h1 == boot_state ? mem_io_channels_read_address_channel_ARREADY :
    dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 68:22 67:26 76:30]
  wire [31:0] _GEN_17 = 2'h1 == boot_state ? rom_loader_io_channels_read_address_channel_ARADDR :
    bus_switch_io_slaves_0_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire  _GEN_19 = 2'h1 == boot_state ? mem_io_channels_read_data_channel_RVALID :
    dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 68:22 67:26 76:30]
  wire  _GEN_20 = 2'h1 == boot_state ? rom_loader_io_channels_read_data_channel_RREADY :
    bus_switch_io_slaves_0_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 68:22 66:27 76:30]
  wire [31:0] _GEN_21 = 2'h1 == boot_state ? mem_io_channels_read_data_channel_RDATA :
    dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 68:22 67:26 76:30]
  wire  _GEN_25 = 2'h1 == boot_state ? 1'h0 : 2'h3 == boot_state; // @[src/main/scala/board/z710/z710/Top.scala 68:22 65:28]
  wire [1:0] _cpu_io_interrupt_flag_T = {uart_io_signal_interrupt,timer_io_signal_interrupt}; // @[src/main/scala/board/z710/z710/Top.scala 90:31]
  reg [31:0] led_count; // @[src/main/scala/board/z710/z710/Top.scala 99:26]
  wire [31:0] _led_count_T_1 = led_count + 32'h1; // @[src/main/scala/board/z710/z710/Top.scala 103:28]
  Uart uart ( // @[src/main/scala/board/z710/z710/Top.scala 39:20]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_channels_write_address_channel_AWVALID(uart_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(uart_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(uart_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(uart_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(uart_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(uart_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(uart_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(uart_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(uart_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(uart_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(uart_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(uart_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(uart_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(uart_io_channels_read_data_channel_RDATA),
    .io_rxd(uart_io_rxd),
    .io_txd(uart_io_txd),
    .io_signal_interrupt(uart_io_signal_interrupt)
  );
  CPU_1 cpu ( // @[src/main/scala/board/z710/z710/Top.scala 43:19]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_axi4_channels_write_address_channel_AWVALID(cpu_io_axi4_channels_write_address_channel_AWVALID),
    .io_axi4_channels_write_address_channel_AWREADY(cpu_io_axi4_channels_write_address_channel_AWREADY),
    .io_axi4_channels_write_address_channel_AWADDR(cpu_io_axi4_channels_write_address_channel_AWADDR),
    .io_axi4_channels_write_data_channel_WVALID(cpu_io_axi4_channels_write_data_channel_WVALID),
    .io_axi4_channels_write_data_channel_WREADY(cpu_io_axi4_channels_write_data_channel_WREADY),
    .io_axi4_channels_write_data_channel_WDATA(cpu_io_axi4_channels_write_data_channel_WDATA),
    .io_axi4_channels_write_data_channel_WSTRB(cpu_io_axi4_channels_write_data_channel_WSTRB),
    .io_axi4_channels_write_response_channel_BVALID(cpu_io_axi4_channels_write_response_channel_BVALID),
    .io_axi4_channels_write_response_channel_BREADY(cpu_io_axi4_channels_write_response_channel_BREADY),
    .io_axi4_channels_read_address_channel_ARVALID(cpu_io_axi4_channels_read_address_channel_ARVALID),
    .io_axi4_channels_read_address_channel_ARREADY(cpu_io_axi4_channels_read_address_channel_ARREADY),
    .io_axi4_channels_read_address_channel_ARADDR(cpu_io_axi4_channels_read_address_channel_ARADDR),
    .io_axi4_channels_read_data_channel_RVALID(cpu_io_axi4_channels_read_data_channel_RVALID),
    .io_axi4_channels_read_data_channel_RREADY(cpu_io_axi4_channels_read_data_channel_RREADY),
    .io_axi4_channels_read_data_channel_RDATA(cpu_io_axi4_channels_read_data_channel_RDATA),
    .io_bus_address(cpu_io_bus_address),
    .io_interrupt_flag(cpu_io_interrupt_flag),
    .io_stall_flag_bus(cpu_io_stall_flag_bus),
    .io_instruction_valid(cpu_io_instruction_valid)
  );
  Memory mem ( // @[src/main/scala/board/z710/z710/Top.scala 44:19]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_channels_write_address_channel_AWVALID(mem_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(mem_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(mem_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(mem_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(mem_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(mem_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(mem_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(mem_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(mem_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(mem_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(mem_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(mem_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(mem_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(mem_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(mem_io_channels_read_data_channel_RDATA)
  );
  Timer timer ( // @[src/main/scala/board/z710/z710/Top.scala 45:21]
    .clock(timer_clock),
    .reset(timer_reset),
    .io_channels_write_address_channel_AWVALID(timer_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(timer_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(timer_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(timer_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(timer_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(timer_io_channels_write_data_channel_WDATA),
    .io_channels_write_response_channel_BVALID(timer_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(timer_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(timer_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(timer_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(timer_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(timer_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(timer_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(timer_io_channels_read_data_channel_RDATA),
    .io_signal_interrupt(timer_io_signal_interrupt)
  );
  DummySlave dummy ( // @[src/main/scala/board/z710/z710/Top.scala 46:21]
    .clock(dummy_clock),
    .reset(dummy_reset),
    .io_channels_write_address_channel_AWVALID(dummy_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(dummy_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(dummy_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(dummy_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(dummy_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(dummy_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(dummy_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(dummy_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(dummy_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(dummy_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(dummy_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(dummy_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(dummy_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(dummy_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(dummy_io_channels_read_data_channel_RDATA)
  );
  BusSwitch bus_switch ( // @[src/main/scala/board/z710/z710/Top.scala 48:26]
    .clock(bus_switch_clock),
    .reset(bus_switch_reset),
    .io_address(bus_switch_io_address),
    .io_slaves_0_write_address_channel_AWVALID(bus_switch_io_slaves_0_write_address_channel_AWVALID),
    .io_slaves_0_write_address_channel_AWREADY(bus_switch_io_slaves_0_write_address_channel_AWREADY),
    .io_slaves_0_write_address_channel_AWADDR(bus_switch_io_slaves_0_write_address_channel_AWADDR),
    .io_slaves_0_write_data_channel_WVALID(bus_switch_io_slaves_0_write_data_channel_WVALID),
    .io_slaves_0_write_data_channel_WREADY(bus_switch_io_slaves_0_write_data_channel_WREADY),
    .io_slaves_0_write_data_channel_WDATA(bus_switch_io_slaves_0_write_data_channel_WDATA),
    .io_slaves_0_write_data_channel_WSTRB(bus_switch_io_slaves_0_write_data_channel_WSTRB),
    .io_slaves_0_write_response_channel_BVALID(bus_switch_io_slaves_0_write_response_channel_BVALID),
    .io_slaves_0_write_response_channel_BREADY(bus_switch_io_slaves_0_write_response_channel_BREADY),
    .io_slaves_0_read_address_channel_ARVALID(bus_switch_io_slaves_0_read_address_channel_ARVALID),
    .io_slaves_0_read_address_channel_ARREADY(bus_switch_io_slaves_0_read_address_channel_ARREADY),
    .io_slaves_0_read_address_channel_ARADDR(bus_switch_io_slaves_0_read_address_channel_ARADDR),
    .io_slaves_0_read_data_channel_RVALID(bus_switch_io_slaves_0_read_data_channel_RVALID),
    .io_slaves_0_read_data_channel_RREADY(bus_switch_io_slaves_0_read_data_channel_RREADY),
    .io_slaves_0_read_data_channel_RDATA(bus_switch_io_slaves_0_read_data_channel_RDATA),
    .io_slaves_1_write_address_channel_AWREADY(bus_switch_io_slaves_1_write_address_channel_AWREADY),
    .io_slaves_1_write_data_channel_WREADY(bus_switch_io_slaves_1_write_data_channel_WREADY),
    .io_slaves_1_write_response_channel_BVALID(bus_switch_io_slaves_1_write_response_channel_BVALID),
    .io_slaves_1_read_address_channel_ARREADY(bus_switch_io_slaves_1_read_address_channel_ARREADY),
    .io_slaves_1_read_data_channel_RVALID(bus_switch_io_slaves_1_read_data_channel_RVALID),
    .io_slaves_1_read_data_channel_RDATA(bus_switch_io_slaves_1_read_data_channel_RDATA),
    .io_slaves_2_write_address_channel_AWVALID(bus_switch_io_slaves_2_write_address_channel_AWVALID),
    .io_slaves_2_write_address_channel_AWREADY(bus_switch_io_slaves_2_write_address_channel_AWREADY),
    .io_slaves_2_write_address_channel_AWADDR(bus_switch_io_slaves_2_write_address_channel_AWADDR),
    .io_slaves_2_write_data_channel_WVALID(bus_switch_io_slaves_2_write_data_channel_WVALID),
    .io_slaves_2_write_data_channel_WREADY(bus_switch_io_slaves_2_write_data_channel_WREADY),
    .io_slaves_2_write_data_channel_WDATA(bus_switch_io_slaves_2_write_data_channel_WDATA),
    .io_slaves_2_write_response_channel_BVALID(bus_switch_io_slaves_2_write_response_channel_BVALID),
    .io_slaves_2_write_response_channel_BREADY(bus_switch_io_slaves_2_write_response_channel_BREADY),
    .io_slaves_2_read_address_channel_ARVALID(bus_switch_io_slaves_2_read_address_channel_ARVALID),
    .io_slaves_2_read_address_channel_ARREADY(bus_switch_io_slaves_2_read_address_channel_ARREADY),
    .io_slaves_2_read_address_channel_ARADDR(bus_switch_io_slaves_2_read_address_channel_ARADDR),
    .io_slaves_2_read_data_channel_RVALID(bus_switch_io_slaves_2_read_data_channel_RVALID),
    .io_slaves_2_read_data_channel_RREADY(bus_switch_io_slaves_2_read_data_channel_RREADY),
    .io_slaves_2_read_data_channel_RDATA(bus_switch_io_slaves_2_read_data_channel_RDATA),
    .io_slaves_3_write_address_channel_AWREADY(bus_switch_io_slaves_3_write_address_channel_AWREADY),
    .io_slaves_3_write_data_channel_WREADY(bus_switch_io_slaves_3_write_data_channel_WREADY),
    .io_slaves_3_write_response_channel_BVALID(bus_switch_io_slaves_3_write_response_channel_BVALID),
    .io_slaves_3_read_address_channel_ARREADY(bus_switch_io_slaves_3_read_address_channel_ARREADY),
    .io_slaves_3_read_data_channel_RVALID(bus_switch_io_slaves_3_read_data_channel_RVALID),
    .io_slaves_3_read_data_channel_RDATA(bus_switch_io_slaves_3_read_data_channel_RDATA),
    .io_slaves_4_write_address_channel_AWVALID(bus_switch_io_slaves_4_write_address_channel_AWVALID),
    .io_slaves_4_write_address_channel_AWREADY(bus_switch_io_slaves_4_write_address_channel_AWREADY),
    .io_slaves_4_write_address_channel_AWADDR(bus_switch_io_slaves_4_write_address_channel_AWADDR),
    .io_slaves_4_write_data_channel_WVALID(bus_switch_io_slaves_4_write_data_channel_WVALID),
    .io_slaves_4_write_data_channel_WREADY(bus_switch_io_slaves_4_write_data_channel_WREADY),
    .io_slaves_4_write_data_channel_WDATA(bus_switch_io_slaves_4_write_data_channel_WDATA),
    .io_slaves_4_write_response_channel_BVALID(bus_switch_io_slaves_4_write_response_channel_BVALID),
    .io_slaves_4_write_response_channel_BREADY(bus_switch_io_slaves_4_write_response_channel_BREADY),
    .io_slaves_4_read_address_channel_ARVALID(bus_switch_io_slaves_4_read_address_channel_ARVALID),
    .io_slaves_4_read_address_channel_ARREADY(bus_switch_io_slaves_4_read_address_channel_ARREADY),
    .io_slaves_4_read_address_channel_ARADDR(bus_switch_io_slaves_4_read_address_channel_ARADDR),
    .io_slaves_4_read_data_channel_RVALID(bus_switch_io_slaves_4_read_data_channel_RVALID),
    .io_slaves_4_read_data_channel_RREADY(bus_switch_io_slaves_4_read_data_channel_RREADY),
    .io_slaves_4_read_data_channel_RDATA(bus_switch_io_slaves_4_read_data_channel_RDATA),
    .io_slaves_5_write_address_channel_AWREADY(bus_switch_io_slaves_5_write_address_channel_AWREADY),
    .io_slaves_5_write_data_channel_WREADY(bus_switch_io_slaves_5_write_data_channel_WREADY),
    .io_slaves_5_write_response_channel_BVALID(bus_switch_io_slaves_5_write_response_channel_BVALID),
    .io_slaves_5_read_address_channel_ARREADY(bus_switch_io_slaves_5_read_address_channel_ARREADY),
    .io_slaves_5_read_data_channel_RVALID(bus_switch_io_slaves_5_read_data_channel_RVALID),
    .io_slaves_5_read_data_channel_RDATA(bus_switch_io_slaves_5_read_data_channel_RDATA),
    .io_slaves_6_write_address_channel_AWREADY(bus_switch_io_slaves_6_write_address_channel_AWREADY),
    .io_slaves_6_write_data_channel_WREADY(bus_switch_io_slaves_6_write_data_channel_WREADY),
    .io_slaves_6_write_response_channel_BVALID(bus_switch_io_slaves_6_write_response_channel_BVALID),
    .io_slaves_6_read_address_channel_ARREADY(bus_switch_io_slaves_6_read_address_channel_ARREADY),
    .io_slaves_6_read_data_channel_RVALID(bus_switch_io_slaves_6_read_data_channel_RVALID),
    .io_slaves_6_read_data_channel_RDATA(bus_switch_io_slaves_6_read_data_channel_RDATA),
    .io_slaves_7_write_address_channel_AWREADY(bus_switch_io_slaves_7_write_address_channel_AWREADY),
    .io_slaves_7_write_data_channel_WREADY(bus_switch_io_slaves_7_write_data_channel_WREADY),
    .io_slaves_7_write_response_channel_BVALID(bus_switch_io_slaves_7_write_response_channel_BVALID),
    .io_slaves_7_read_address_channel_ARREADY(bus_switch_io_slaves_7_read_address_channel_ARREADY),
    .io_slaves_7_read_data_channel_RVALID(bus_switch_io_slaves_7_read_data_channel_RVALID),
    .io_slaves_7_read_data_channel_RDATA(bus_switch_io_slaves_7_read_data_channel_RDATA),
    .io_master_write_address_channel_AWVALID(bus_switch_io_master_write_address_channel_AWVALID),
    .io_master_write_address_channel_AWREADY(bus_switch_io_master_write_address_channel_AWREADY),
    .io_master_write_address_channel_AWADDR(bus_switch_io_master_write_address_channel_AWADDR),
    .io_master_write_data_channel_WVALID(bus_switch_io_master_write_data_channel_WVALID),
    .io_master_write_data_channel_WREADY(bus_switch_io_master_write_data_channel_WREADY),
    .io_master_write_data_channel_WDATA(bus_switch_io_master_write_data_channel_WDATA),
    .io_master_write_data_channel_WSTRB(bus_switch_io_master_write_data_channel_WSTRB),
    .io_master_write_response_channel_BVALID(bus_switch_io_master_write_response_channel_BVALID),
    .io_master_write_response_channel_BREADY(bus_switch_io_master_write_response_channel_BREADY),
    .io_master_read_address_channel_ARVALID(bus_switch_io_master_read_address_channel_ARVALID),
    .io_master_read_address_channel_ARREADY(bus_switch_io_master_read_address_channel_ARREADY),
    .io_master_read_address_channel_ARADDR(bus_switch_io_master_read_address_channel_ARADDR),
    .io_master_read_data_channel_RVALID(bus_switch_io_master_read_data_channel_RVALID),
    .io_master_read_data_channel_RREADY(bus_switch_io_master_read_data_channel_RREADY),
    .io_master_read_data_channel_RDATA(bus_switch_io_master_read_data_channel_RDATA)
  );
  InstructionROM instruction_rom ( // @[src/main/scala/board/z710/z710/Top.scala 50:31]
    .clock(instruction_rom_clock),
    .io_address(instruction_rom_io_address),
    .io_data(instruction_rom_io_data)
  );
  ROMLoader rom_loader ( // @[src/main/scala/board/z710/z710/Top.scala 51:26]
    .clock(rom_loader_clock),
    .reset(rom_loader_reset),
    .io_channels_write_address_channel_AWVALID(rom_loader_io_channels_write_address_channel_AWVALID),
    .io_channels_write_address_channel_AWREADY(rom_loader_io_channels_write_address_channel_AWREADY),
    .io_channels_write_address_channel_AWADDR(rom_loader_io_channels_write_address_channel_AWADDR),
    .io_channels_write_data_channel_WVALID(rom_loader_io_channels_write_data_channel_WVALID),
    .io_channels_write_data_channel_WREADY(rom_loader_io_channels_write_data_channel_WREADY),
    .io_channels_write_data_channel_WDATA(rom_loader_io_channels_write_data_channel_WDATA),
    .io_channels_write_data_channel_WSTRB(rom_loader_io_channels_write_data_channel_WSTRB),
    .io_channels_write_response_channel_BVALID(rom_loader_io_channels_write_response_channel_BVALID),
    .io_channels_write_response_channel_BREADY(rom_loader_io_channels_write_response_channel_BREADY),
    .io_channels_read_address_channel_ARVALID(rom_loader_io_channels_read_address_channel_ARVALID),
    .io_channels_read_address_channel_ARREADY(rom_loader_io_channels_read_address_channel_ARREADY),
    .io_channels_read_address_channel_ARADDR(rom_loader_io_channels_read_address_channel_ARADDR),
    .io_channels_read_data_channel_RVALID(rom_loader_io_channels_read_data_channel_RVALID),
    .io_channels_read_data_channel_RREADY(rom_loader_io_channels_read_data_channel_RREADY),
    .io_channels_read_data_channel_RDATA(rom_loader_io_channels_read_data_channel_RDATA),
    .io_rom_address(rom_loader_io_rom_address),
    .io_rom_data(rom_loader_io_rom_data),
    .io_load_start(rom_loader_io_load_start),
    .io_load_finished(rom_loader_io_load_finished)
  );
  assign io_led = led_count >= 32'h2faf080; // @[src/main/scala/board/z710/z710/Top.scala 106:24]
  assign io_tx = uart_io_txd; // @[src/main/scala/board/z710/z710/Top.scala 40:9]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_channels_write_address_channel_AWVALID = bus_switch_io_slaves_2_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_channels_write_address_channel_AWADDR = bus_switch_io_slaves_2_write_address_channel_AWADDR[7:0]; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_channels_write_data_channel_WVALID = bus_switch_io_slaves_2_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_channels_write_data_channel_WDATA = bus_switch_io_slaves_2_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_channels_write_response_channel_BREADY = bus_switch_io_slaves_2_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_channels_read_address_channel_ARVALID = bus_switch_io_slaves_2_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_channels_read_address_channel_ARADDR = bus_switch_io_slaves_2_read_address_channel_ARADDR[7:0]; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_channels_read_data_channel_RREADY = bus_switch_io_slaves_2_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign uart_io_rxd = io_rx; // @[src/main/scala/board/z710/z710/Top.scala 41:15]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_axi4_channels_write_address_channel_AWREADY = bus_switch_io_master_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign cpu_io_axi4_channels_write_data_channel_WREADY = bus_switch_io_master_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign cpu_io_axi4_channels_write_response_channel_BVALID = bus_switch_io_master_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign cpu_io_axi4_channels_read_address_channel_ARREADY = bus_switch_io_master_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign cpu_io_axi4_channels_read_data_channel_RVALID = bus_switch_io_master_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign cpu_io_axi4_channels_read_data_channel_RDATA = bus_switch_io_master_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign cpu_io_interrupt_flag = {{30'd0}, _cpu_io_interrupt_flag_T}; // @[src/main/scala/board/z710/z710/Top.scala 90:25]
  assign cpu_io_stall_flag_bus = 2'h0 == boot_state | (2'h1 == boot_state | _GEN_1); // @[src/main/scala/board/z710/z710/Top.scala 68:22 64:25]
  assign cpu_io_instruction_valid = 2'h0 == boot_state ? 1'h0 : _GEN_25; // @[src/main/scala/board/z710/z710/Top.scala 68:22 65:28]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_channels_write_address_channel_AWVALID = 2'h0 == boot_state ?
    rom_loader_io_channels_write_address_channel_AWVALID : _GEN_4; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_write_address_channel_AWADDR = 2'h0 == boot_state ?
    rom_loader_io_channels_write_address_channel_AWADDR : _GEN_6; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_write_data_channel_WVALID = 2'h0 == boot_state ?
    rom_loader_io_channels_write_data_channel_WVALID : _GEN_8; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_write_data_channel_WDATA = 2'h0 == boot_state ? rom_loader_io_channels_write_data_channel_WDATA
     : _GEN_10; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_write_data_channel_WSTRB = 2'h0 == boot_state ? rom_loader_io_channels_write_data_channel_WSTRB
     : _GEN_11; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_write_response_channel_BREADY = 2'h0 == boot_state ?
    rom_loader_io_channels_write_response_channel_BREADY : _GEN_13; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_read_address_channel_ARVALID = 2'h0 == boot_state ?
    rom_loader_io_channels_read_address_channel_ARVALID : _GEN_15; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_read_address_channel_ARADDR = 2'h0 == boot_state ?
    rom_loader_io_channels_read_address_channel_ARADDR : _GEN_17; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign mem_io_channels_read_data_channel_RREADY = 2'h0 == boot_state ? rom_loader_io_channels_read_data_channel_RREADY
     : _GEN_20; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign timer_clock = clock;
  assign timer_reset = reset;
  assign timer_io_channels_write_address_channel_AWVALID = bus_switch_io_slaves_4_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign timer_io_channels_write_address_channel_AWADDR = bus_switch_io_slaves_4_write_address_channel_AWADDR[7:0]; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign timer_io_channels_write_data_channel_WVALID = bus_switch_io_slaves_4_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign timer_io_channels_write_data_channel_WDATA = bus_switch_io_slaves_4_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign timer_io_channels_write_response_channel_BREADY = bus_switch_io_slaves_4_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign timer_io_channels_read_address_channel_ARVALID = bus_switch_io_slaves_4_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign timer_io_channels_read_address_channel_ARADDR = bus_switch_io_slaves_4_read_address_channel_ARADDR[7:0]; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign timer_io_channels_read_data_channel_RREADY = bus_switch_io_slaves_4_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign dummy_clock = clock;
  assign dummy_reset = reset;
  assign dummy_io_channels_write_address_channel_AWVALID = rom_loader_io_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_write_address_channel_AWADDR = rom_loader_io_channels_write_address_channel_AWADDR[3:0]; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_write_data_channel_WVALID = rom_loader_io_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_write_data_channel_WDATA = rom_loader_io_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_write_data_channel_WSTRB = rom_loader_io_channels_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_write_response_channel_BREADY = rom_loader_io_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_read_address_channel_ARVALID = rom_loader_io_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_read_address_channel_ARADDR = rom_loader_io_channels_read_address_channel_ARADDR[3:0]; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign dummy_io_channels_read_data_channel_RREADY = rom_loader_io_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 67:26]
  assign bus_switch_clock = clock;
  assign bus_switch_reset = reset;
  assign bus_switch_io_address = cpu_io_bus_address; // @[src/main/scala/board/z710/z710/Top.scala 56:25]
  assign bus_switch_io_slaves_0_write_address_channel_AWREADY = mem_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 66:27]
  assign bus_switch_io_slaves_0_write_data_channel_WREADY = mem_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 66:27]
  assign bus_switch_io_slaves_0_write_response_channel_BVALID = mem_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 66:27]
  assign bus_switch_io_slaves_0_read_address_channel_ARREADY = mem_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 66:27]
  assign bus_switch_io_slaves_0_read_data_channel_RVALID = mem_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 66:27]
  assign bus_switch_io_slaves_0_read_data_channel_RDATA = mem_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 66:27]
  assign bus_switch_io_slaves_1_write_address_channel_AWREADY = dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_1_write_data_channel_WREADY = dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_1_write_response_channel_BVALID = dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_1_read_address_channel_ARREADY = dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_1_read_data_channel_RVALID = dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_1_read_data_channel_RDATA = dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_2_write_address_channel_AWREADY = uart_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign bus_switch_io_slaves_2_write_data_channel_WREADY = uart_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign bus_switch_io_slaves_2_write_response_channel_BVALID = uart_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign bus_switch_io_slaves_2_read_address_channel_ARREADY = uart_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign bus_switch_io_slaves_2_read_data_channel_RVALID = uart_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign bus_switch_io_slaves_2_read_data_channel_RDATA = uart_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 87:27]
  assign bus_switch_io_slaves_3_write_address_channel_AWREADY = dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_3_write_data_channel_WREADY = dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_3_write_response_channel_BVALID = dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_3_read_address_channel_ARREADY = dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_3_read_data_channel_RVALID = dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_3_read_data_channel_RDATA = dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_4_write_address_channel_AWREADY = timer_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign bus_switch_io_slaves_4_write_data_channel_WREADY = timer_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign bus_switch_io_slaves_4_write_response_channel_BVALID = timer_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign bus_switch_io_slaves_4_read_address_channel_ARREADY = timer_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign bus_switch_io_slaves_4_read_data_channel_RVALID = timer_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign bus_switch_io_slaves_4_read_data_channel_RDATA = timer_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 88:27]
  assign bus_switch_io_slaves_5_write_address_channel_AWREADY = dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_5_write_data_channel_WREADY = dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_5_write_response_channel_BVALID = dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_5_read_address_channel_ARREADY = dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_5_read_data_channel_RVALID = dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_5_read_data_channel_RDATA = dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_6_write_address_channel_AWREADY = dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_6_write_data_channel_WREADY = dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_6_write_response_channel_BVALID = dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_6_read_address_channel_ARREADY = dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_6_read_data_channel_RVALID = dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_6_read_data_channel_RDATA = dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_7_write_address_channel_AWREADY = dummy_io_channels_write_address_channel_AWREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_7_write_data_channel_WREADY = dummy_io_channels_write_data_channel_WREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_7_write_response_channel_BVALID = dummy_io_channels_write_response_channel_BVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_7_read_address_channel_ARREADY = dummy_io_channels_read_address_channel_ARREADY; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_7_read_data_channel_RVALID = dummy_io_channels_read_data_channel_RVALID; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_slaves_7_read_data_channel_RDATA = dummy_io_channels_read_data_channel_RDATA; // @[src/main/scala/board/z710/z710/Top.scala 58:29]
  assign bus_switch_io_master_write_address_channel_AWVALID = cpu_io_axi4_channels_write_address_channel_AWVALID; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_write_address_channel_AWADDR = cpu_io_axi4_channels_write_address_channel_AWADDR; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_write_data_channel_WVALID = cpu_io_axi4_channels_write_data_channel_WVALID; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_write_data_channel_WDATA = cpu_io_axi4_channels_write_data_channel_WDATA; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_write_data_channel_WSTRB = cpu_io_axi4_channels_write_data_channel_WSTRB; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_write_response_channel_BREADY = cpu_io_axi4_channels_write_response_channel_BREADY; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_read_address_channel_ARVALID = cpu_io_axi4_channels_read_address_channel_ARVALID; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_read_address_channel_ARADDR = cpu_io_axi4_channels_read_address_channel_ARADDR; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign bus_switch_io_master_read_data_channel_RREADY = cpu_io_axi4_channels_read_data_channel_RREADY; // @[src/main/scala/board/z710/z710/Top.scala 55:24]
  assign instruction_rom_clock = clock;
  assign instruction_rom_io_address = rom_loader_io_rom_address; // @[src/main/scala/board/z710/z710/Top.scala 63:30]
  assign rom_loader_clock = clock;
  assign rom_loader_reset = reset;
  assign rom_loader_io_channels_write_address_channel_AWREADY = 2'h0 == boot_state ?
    mem_io_channels_write_address_channel_AWREADY : _GEN_5; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign rom_loader_io_channels_write_data_channel_WREADY = 2'h0 == boot_state ?
    mem_io_channels_write_data_channel_WREADY : _GEN_9; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign rom_loader_io_channels_write_response_channel_BVALID = 2'h0 == boot_state ?
    mem_io_channels_write_response_channel_BVALID : _GEN_12; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign rom_loader_io_channels_read_address_channel_ARREADY = 2'h0 == boot_state ?
    mem_io_channels_read_address_channel_ARREADY : _GEN_16; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign rom_loader_io_channels_read_data_channel_RVALID = 2'h0 == boot_state ? mem_io_channels_read_data_channel_RVALID
     : _GEN_19; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign rom_loader_io_channels_read_data_channel_RDATA = 2'h0 == boot_state ? mem_io_channels_read_data_channel_RDATA
     : _GEN_21; // @[src/main/scala/board/z710/z710/Top.scala 68:22 72:30]
  assign rom_loader_io_rom_data = instruction_rom_io_data; // @[src/main/scala/board/z710/z710/Top.scala 62:26]
  assign rom_loader_io_load_start = 2'h0 == boot_state; // @[src/main/scala/board/z710/z710/Top.scala 68:22]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/board/z710/z710/Top.scala 37:27]
      boot_state <= 2'h0; // @[src/main/scala/board/z710/z710/Top.scala 37:27]
    end else if (2'h0 == boot_state) begin // @[src/main/scala/board/z710/z710/Top.scala 68:22]
      boot_state <= 2'h1; // @[src/main/scala/board/z710/z710/Top.scala 71:18]
    end else if (2'h1 == boot_state) begin // @[src/main/scala/board/z710/z710/Top.scala 68:22]
      if (rom_loader_io_load_finished) begin // @[src/main/scala/board/z710/z710/Top.scala 77:41]
        boot_state <= 2'h3; // @[src/main/scala/board/z710/z710/Top.scala 78:20]
      end
    end
    if (reset) begin // @[src/main/scala/board/z710/z710/Top.scala 99:26]
      led_count <= 32'h0; // @[src/main/scala/board/z710/z710/Top.scala 99:26]
    end else if (led_count >= 32'h5f5e100) begin // @[src/main/scala/board/z710/z710/Top.scala 100:34]
      led_count <= 32'h0; // @[src/main/scala/board/z710/z710/Top.scala 101:15]
    end else begin
      led_count <= _led_count_T_1; // @[src/main/scala/board/z710/z710/Top.scala 103:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  boot_state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  led_count = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
