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
  input        io_jump_instruction_id, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_if, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_mem, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_clint, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_stall_flag_bus, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input  [4:0] io_rs1_id, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input  [4:0] io_rs2_id, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_memory_read_enable_ex, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input  [4:0] io_rd_ex, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_memory_read_enable_mem, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input  [4:0] io_rd_mem, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  input        io_csr_start_paging, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_if_flush, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_id_flush, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_pc_stall, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_if_stall, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_id_stall, // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
  output       io_ex_stall // @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]
);
  wire  _id_hazard_T_3 = io_rd_ex == io_rs1_id; // @[src/main/scala/riscv/core/fivestage/Control.scala 44:105]
  wire  _id_hazard_T_5 = _id_hazard_T_3 | io_rd_ex == io_rs2_id; // @[src/main/scala/riscv/core/fivestage/Control.scala 45:5]
  wire  _id_hazard_T_6 = (io_memory_read_enable_ex | io_jump_instruction_id) & io_rd_ex != 5'h0 & _id_hazard_T_5; // @[src/main/scala/riscv/core/fivestage/Control.scala 44:92]
  wire  _id_hazard_T_11 = io_rd_mem == io_rs2_id; // @[src/main/scala/riscv/core/fivestage/Control.scala 47:7]
  wire  _id_hazard_T_13 = io_jump_instruction_id & io_memory_read_enable_mem & io_rd_mem != 5'h0 & (io_rd_mem ==
    io_rs1_id | _id_hazard_T_11); // @[src/main/scala/riscv/core/fivestage/Control.scala 46:78]
  wire  id_hazard = _id_hazard_T_6 | _id_hazard_T_13; // @[src/main/scala/riscv/core/fivestage/Control.scala 45:32]
  wire  _io_pc_stall_T = io_stall_flag_mem | io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/Control.scala 51:36]
  assign io_if_flush = io_jump_flag & ~id_hazard | io_csr_start_paging; // @[src/main/scala/riscv/core/fivestage/Control.scala 48:45]
  assign io_id_flush = id_hazard | io_csr_start_paging; // @[src/main/scala/riscv/core/fivestage/Control.scala 49:28]
  assign io_pc_stall = io_stall_flag_mem | io_stall_flag_clint | id_hazard | io_stall_flag_bus | io_stall_flag_if; // @[src/main/scala/riscv/core/fivestage/Control.scala 51:93]
  assign io_if_stall = _io_pc_stall_T | id_hazard; // @[src/main/scala/riscv/core/fivestage/Control.scala 52:59]
  assign io_id_stall = io_stall_flag_mem | io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/Control.scala 53:36]
  assign io_ex_stall = io_stall_flag_mem | io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/Control.scala 54:36]
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
  input         io_stall_flag_ctrl, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  input         io_jump_flag_id, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  input  [31:0] io_jump_address_id, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  input  [31:0] io_physical_address, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  output        io_ctrl_stall_flag, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  output [31:0] io_id_instruction_address, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  output [31:0] io_id_instruction, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  output        io_pc_valid, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  output        io_bus_read, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  input  [31:0] io_bus_read_data, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  input         io_bus_read_valid, // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
  input         io_bus_granted // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 45:29]
  reg [31:0] pc; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 46:19]
  reg  state; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 47:22]
  reg  pc_valid; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 48:25]
  wire  _GEN_0 = ~pc_valid & pc == 32'h1000 | pc_valid; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 58:57 59:14 48:25]
  wire [31:0] _pc_T_1 = pc + 32'h4; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 63:8]
  wire  _T_3 = ~io_bus_read_valid; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 70:8]
  wire  _GEN_1 = io_jump_flag_id | pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 71:27 72:20 45:29]
  wire  _GEN_2 = ~io_bus_read_valid ? _GEN_1 : pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 70:28 45:29]
  wire  _T_4 = ~state; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 83:16]
  wire  _GEN_5 = io_bus_read_valid ? 1'h0 : state; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 90:31 91:15 47:22]
  wire  _GEN_8 = state ? _GEN_5 : state; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 47:22 87:47]
  wire  _GEN_11 = ~state | _GEN_8; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 83:41 86:13]
  wire  _io_id_instruction_T_3 = io_bus_read_valid & ~pending_jump & ~io_jump_flag_id; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 97:40]
  assign io_ctrl_stall_flag = _T_3 | pending_jump; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 101:44]
  assign io_id_instruction_address = pc; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 102:29]
  assign io_id_instruction = _io_id_instruction_T_3 ? io_bus_read_data : 32'h13; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 96:27]
  assign io_pc_valid = pc_valid; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 56:15]
  assign io_bus_read = io_bus_granted & _T_4; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 51:15 82:24]
  assign io_bus_address = io_physical_address; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 103:18]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 45:29]
      pending_jump <= 1'h0; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 45:29]
    end else if (io_bus_read_valid) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 76:27]
      if (pending_jump) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 77:24]
        pending_jump <= 1'h0; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 78:20]
      end else begin
        pending_jump <= _GEN_2;
      end
    end else begin
      pending_jump <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 46:19]
      pc <= 32'h1000; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 46:19]
    end else if (io_jump_flag_id) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= io_jump_address_id;
    end else if (!(io_stall_flag_ctrl)) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= _pc_T_1;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 47:22]
      state <= 1'h0; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 47:22]
    end else if (io_bus_granted) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 82:24]
      state <= _GEN_11;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 48:25]
      pc_valid <= 1'h0; // @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 48:25]
    end else begin
      pc_valid <= _GEN_0;
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
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pc_valid = _RAND_3[0:0];
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
  input  [31:0] io_forward_from_mem, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input  [31:0] io_forward_from_wb, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input  [1:0]  io_reg1_forward, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  input  [1:0]  io_reg2_forward, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
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
  output        io_ctrl_jump_instruction, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [31:0] io_clint_jump_address, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output        io_if_jump_flag, // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
  output [31:0] io_if_jump_address // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]
);
  wire [6:0] opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 168:30]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 169:30]
  wire [4:0] rd = io_instruction[11:7]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 171:26]
  wire [4:0] rs1 = io_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 172:27]
  wire  _io_regs_reg1_read_address_T = opcode == 7'h37; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 175:43]
  wire [19:0] _io_ex_immediate_T_2 = io_instruction[31] ? 20'hfffff : 20'h0; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:48]
  wire [31:0] _io_ex_immediate_T_4 = {_io_ex_immediate_T_2,io_instruction[31:20]}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:43]
  wire [20:0] _io_ex_immediate_T_7 = io_instruction[31] ? 21'h1fffff : 21'h0; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:37]
  wire [31:0] _io_ex_immediate_T_9 = {_io_ex_immediate_T_7,io_instruction[30:20]}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:32]
  wire [31:0] _io_ex_immediate_T_25 = {_io_ex_immediate_T_7,io_instruction[30:25],rd}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:32]
  wire [31:0] _io_ex_immediate_T_32 = {_io_ex_immediate_T_2,io_instruction[7],io_instruction[30:25],io_instruction[11:8]
    ,1'h0}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:32]
  wire [31:0] _io_ex_immediate_T_34 = {io_instruction[31:12],12'h0}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 187:30]
  wire [11:0] _io_ex_immediate_T_39 = io_instruction[31] ? 12'hfff : 12'h0; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:35]
  wire [31:0] _io_ex_immediate_T_43 = {_io_ex_immediate_T_39,io_instruction[19:12],io_instruction[20],io_instruction[30:
    21],1'h0}; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:30]
  wire [31:0] _io_ex_immediate_T_45 = 7'h13 == opcode ? _io_ex_immediate_T_9 : _io_ex_immediate_T_4; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire  _io_ex_immediate_T_46 = 7'h3 == opcode; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire [31:0] _io_ex_immediate_T_47 = 7'h3 == opcode ? _io_ex_immediate_T_9 : _io_ex_immediate_T_45; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire  _io_ex_immediate_T_48 = 7'h67 == opcode; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire [31:0] _io_ex_immediate_T_49 = 7'h67 == opcode ? _io_ex_immediate_T_9 : _io_ex_immediate_T_47; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire [31:0] _io_ex_immediate_T_51 = 7'h23 == opcode ? _io_ex_immediate_T_25 : _io_ex_immediate_T_49; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire [31:0] _io_ex_immediate_T_53 = 7'h63 == opcode ? _io_ex_immediate_T_32 : _io_ex_immediate_T_51; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire [31:0] _io_ex_immediate_T_55 = 7'h37 == opcode ? _io_ex_immediate_T_34 : _io_ex_immediate_T_53; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire [31:0] _io_ex_immediate_T_57 = 7'h17 == opcode ? _io_ex_immediate_T_34 : _io_ex_immediate_T_55; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire  _io_ex_immediate_T_58 = 7'h6f == opcode; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  wire  _io_ex_aluop1_source_T = opcode == 7'h17; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:12]
  wire  _io_ex_aluop1_source_T_1 = opcode == 7'h63; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:45]
  wire  _io_ex_aluop1_source_T_3 = opcode == 7'h6f; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:78]
  wire  _io_ex_aluop2_source_T = opcode == 7'h33; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 199:12]
  wire  _io_ex_memory_read_enable_T = opcode == 7'h3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 203:38]
  wire [1:0] _io_ex_reg_write_source_T_1 = _io_ex_immediate_T_46 ? 2'h1 : 2'h0; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
  wire [1:0] _io_ex_reg_write_source_T_3 = 7'h73 == opcode ? 2'h2 : _io_ex_reg_write_source_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
  wire [1:0] _io_ex_reg_write_source_T_5 = _io_ex_immediate_T_58 ? 2'h3 : _io_ex_reg_write_source_T_3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
  wire  _io_ex_reg_write_enable_T_4 = _io_ex_aluop2_source_T | opcode == 7'h13 | _io_ex_memory_read_enable_T; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 213:97]
  wire  _io_ex_reg_write_enable_T_10 = _io_ex_reg_write_enable_T_4 | _io_ex_aluop1_source_T |
    _io_regs_reg1_read_address_T | _io_ex_aluop1_source_T_3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:105]
  wire  _io_ex_reg_write_enable_T_11 = opcode == 7'h67; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:46]
  wire  _io_ex_reg_write_enable_T_13 = opcode == 7'h73; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:80]
  wire  _io_ex_csr_write_enable_T_4 = funct3 == 3'h2; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 220:14]
  wire  _io_ex_csr_write_enable_T_5 = funct3 == 3'h1 | funct3 == 3'h5 | _io_ex_csr_write_enable_T_4; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 219:83]
  wire  _io_ex_csr_write_enable_T_8 = funct3 == 3'h3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 221:14]
  wire  _io_ex_csr_write_enable_T_9 = _io_ex_csr_write_enable_T_5 | funct3 == 3'h6 | _io_ex_csr_write_enable_T_8; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 220:85]
  wire  _io_ex_csr_write_enable_T_11 = _io_ex_csr_write_enable_T_9 | funct3 == 3'h7; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 221:44]
  wire [31:0] _reg1_data_T_1 = 2'h1 == io_reg1_forward ? io_forward_from_mem : io_reg1_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 224:59]
  wire [31:0] reg1_data = 2'h2 == io_reg1_forward ? io_forward_from_wb : _reg1_data_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 224:59]
  wire [31:0] _reg2_data_T_1 = 2'h1 == io_reg2_forward ? io_forward_from_mem : io_reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 230:59]
  wire [31:0] reg2_data = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 230:59]
  wire  _io_ctrl_jump_instruction_T_2 = _io_ex_aluop1_source_T_3 | _io_ex_reg_write_enable_T_11; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 236:61]
  wire  _instruction_jump_flag_T_4 = reg1_data == reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 242:45]
  wire  _instruction_jump_flag_T_5 = reg1_data != reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 243:45]
  wire [31:0] _instruction_jump_flag_T_6 = 2'h2 == io_reg1_forward ? io_forward_from_wb : _reg1_data_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 244:45]
  wire [31:0] _instruction_jump_flag_T_7 = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 244:64]
  wire  _instruction_jump_flag_T_8 = $signed(_instruction_jump_flag_T_6) < $signed(_instruction_jump_flag_T_7); // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 244:52]
  wire  _instruction_jump_flag_T_11 = $signed(_instruction_jump_flag_T_6) >= $signed(_instruction_jump_flag_T_7); // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 245:52]
  wire  _instruction_jump_flag_T_12 = reg1_data < reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 246:53]
  wire  _instruction_jump_flag_T_13 = reg1_data >= reg2_data; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 247:53]
  wire  _instruction_jump_flag_T_17 = 3'h1 == funct3 ? _instruction_jump_flag_T_5 : 3'h0 == funct3 &
    _instruction_jump_flag_T_4; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
  wire  _instruction_jump_flag_T_19 = 3'h4 == funct3 ? _instruction_jump_flag_T_8 : _instruction_jump_flag_T_17; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
  wire  _instruction_jump_flag_T_21 = 3'h5 == funct3 ? _instruction_jump_flag_T_11 : _instruction_jump_flag_T_19; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
  wire  _instruction_jump_flag_T_23 = 3'h6 == funct3 ? _instruction_jump_flag_T_12 : _instruction_jump_flag_T_21; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
  wire  _instruction_jump_flag_T_25 = 3'h7 == funct3 ? _instruction_jump_flag_T_13 : _instruction_jump_flag_T_23; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
  wire  _instruction_jump_flag_T_26 = _io_ex_aluop1_source_T_1 & _instruction_jump_flag_T_25; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:37]
  wire  instruction_jump_flag = _io_ctrl_jump_instruction_T_2 | _instruction_jump_flag_T_26; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 239:36]
  wire [31:0] _instruction_jump_address_T_1 = _io_ex_reg_write_enable_T_11 ? reg1_data : io_instruction_address; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 250:55]
  wire [31:0] instruction_jump_address = io_ex_immediate + _instruction_jump_address_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 250:50]
  assign io_regs_reg1_read_address = opcode == 7'h37 ? 5'h0 : rs1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 175:35]
  assign io_regs_reg2_read_address = io_instruction[24:20]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 173:27]
  assign io_ex_immediate = 7'h6f == opcode ? _io_ex_immediate_T_43 : _io_ex_immediate_T_57; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
  assign io_ex_aluop1_source = opcode == 7'h17 | opcode == 7'h63 | opcode == 7'h6f; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:68]
  assign io_ex_aluop2_source = _io_ex_aluop2_source_T ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 198:29]
  assign io_ex_memory_read_enable = opcode == 7'h3; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 203:38]
  assign io_ex_memory_write_enable = opcode == 7'h23; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 204:39]
  assign io_ex_reg_write_source = _io_ex_immediate_T_48 ? 2'h3 : _io_ex_reg_write_source_T_5; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
  assign io_ex_reg_write_enable = _io_ex_reg_write_enable_T_10 | opcode == 7'h67 | opcode == 7'h73; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:69]
  assign io_ex_reg_write_address = io_instruction[11:7]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 216:44]
  assign io_ex_csr_address = io_instruction[31:20]; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 217:38]
  assign io_ex_csr_write_enable = _io_ex_reg_write_enable_T_13 & _io_ex_csr_write_enable_T_11; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 218:59]
  assign io_ctrl_jump_instruction = _io_ctrl_jump_instruction_T_2 | _io_ex_aluop1_source_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 237:36]
  assign io_clint_jump_address = io_ex_immediate + _instruction_jump_address_T_1; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 250:50]
  assign io_if_jump_flag = io_interrupt_assert | instruction_jump_flag; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 253:42]
  assign io_if_jump_address = io_interrupt_assert ? io_interrupt_handler_address : instruction_jump_address; // @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 254:28]
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
  input  [3:0]  io_func, // @[src/main/scala/riscv/core/fivestage/ALU.scala 26:14]
  input  [31:0] io_op1, // @[src/main/scala/riscv/core/fivestage/ALU.scala 26:14]
  input  [31:0] io_op2, // @[src/main/scala/riscv/core/fivestage/ALU.scala 26:14]
  output [31:0] io_result // @[src/main/scala/riscv/core/fivestage/ALU.scala 26:14]
);
  wire [31:0] _io_result_T_1 = io_op1 + io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 38:27]
  wire [31:0] _io_result_T_3 = io_op1 - io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 41:27]
  wire [62:0] _GEN_10 = {{31'd0}, io_op1}; // @[src/main/scala/riscv/core/fivestage/ALU.scala 44:27]
  wire [62:0] _io_result_T_5 = _GEN_10 << io_op2[4:0]; // @[src/main/scala/riscv/core/fivestage/ALU.scala 44:27]
  wire [31:0] _io_result_T_6 = io_op1; // @[src/main/scala/riscv/core/fivestage/ALU.scala 47:27]
  wire [31:0] _io_result_T_7 = io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 47:43]
  wire [31:0] _io_result_T_9 = io_op1 ^ io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 50:27]
  wire [31:0] _io_result_T_10 = io_op1 | io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 53:27]
  wire [31:0] _io_result_T_11 = io_op1 & io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 56:27]
  wire [31:0] _io_result_T_13 = io_op1 >> io_op2[4:0]; // @[src/main/scala/riscv/core/fivestage/ALU.scala 59:27]
  wire [31:0] _io_result_T_17 = $signed(io_op1) >>> io_op2[4:0]; // @[src/main/scala/riscv/core/fivestage/ALU.scala 62:52]
  wire  _GEN_0 = 4'ha == io_func & io_op1 < io_op2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 35:13 36:19 65:17]
  wire [31:0] _GEN_1 = 4'h9 == io_func ? _io_result_T_17 : {{31'd0}, _GEN_0}; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 62:17]
  wire [31:0] _GEN_2 = 4'h8 == io_func ? _io_result_T_13 : _GEN_1; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 59:17]
  wire [31:0] _GEN_3 = 4'h7 == io_func ? _io_result_T_11 : _GEN_2; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 56:17]
  wire [31:0] _GEN_4 = 4'h6 == io_func ? _io_result_T_10 : _GEN_3; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 53:17]
  wire [31:0] _GEN_5 = 4'h5 == io_func ? _io_result_T_9 : _GEN_4; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 50:17]
  wire [31:0] _GEN_6 = 4'h4 == io_func ? {{31'd0}, $signed(_io_result_T_6) < $signed(_io_result_T_7)} : _GEN_5; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 47:17]
  wire [62:0] _GEN_7 = 4'h3 == io_func ? _io_result_T_5 : {{31'd0}, _GEN_6}; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 44:17]
  wire [62:0] _GEN_8 = 4'h2 == io_func ? {{31'd0}, _io_result_T_3} : _GEN_7; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 41:17]
  wire [62:0] _GEN_9 = 4'h1 == io_func ? {{31'd0}, _io_result_T_1} : _GEN_8; // @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19 38:17]
  assign io_result = _GEN_9[31:0];
endmodule
module ALUControl(
  input  [6:0] io_opcode, // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
  input  [2:0] io_funct3, // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
  input  [6:0] io_funct7, // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
  output [3:0] io_alu_funct // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]
);
  wire [3:0] _io_alu_funct_T_1 = io_funct7[5] ? 4'h9 : 4'h8; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 42:39]
  wire  _io_alu_funct_T_2 = 3'h1 == io_funct3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [1:0] _io_alu_funct_T_3 = 3'h1 == io_funct3 ? 2'h3 : 2'h1; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire  _io_alu_funct_T_4 = 3'h2 == io_funct3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [2:0] _io_alu_funct_T_5 = 3'h2 == io_funct3 ? 3'h4 : {{1'd0}, _io_alu_funct_T_3}; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire  _io_alu_funct_T_6 = 3'h3 == io_funct3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [3:0] _io_alu_funct_T_7 = 3'h3 == io_funct3 ? 4'ha : {{1'd0}, _io_alu_funct_T_5}; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire  _io_alu_funct_T_8 = 3'h4 == io_funct3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [3:0] _io_alu_funct_T_9 = 3'h4 == io_funct3 ? 4'h5 : _io_alu_funct_T_7; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire  _io_alu_funct_T_10 = 3'h6 == io_funct3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [3:0] _io_alu_funct_T_11 = 3'h6 == io_funct3 ? 4'h6 : _io_alu_funct_T_9; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire  _io_alu_funct_T_12 = 3'h7 == io_funct3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [3:0] _io_alu_funct_T_13 = 3'h7 == io_funct3 ? 4'h7 : _io_alu_funct_T_11; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire  _io_alu_funct_T_14 = 3'h5 == io_funct3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [3:0] _io_alu_funct_T_15 = 3'h5 == io_funct3 ? _io_alu_funct_T_1 : _io_alu_funct_T_13; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
  wire [1:0] _io_alu_funct_T_17 = io_funct7[5] ? 2'h2 : 2'h1; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 49:43]
  wire [1:0] _io_alu_funct_T_21 = _io_alu_funct_T_2 ? 2'h3 : _io_alu_funct_T_17; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
  wire [2:0] _io_alu_funct_T_23 = _io_alu_funct_T_4 ? 3'h4 : {{1'd0}, _io_alu_funct_T_21}; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
  wire [3:0] _io_alu_funct_T_25 = _io_alu_funct_T_6 ? 4'ha : {{1'd0}, _io_alu_funct_T_23}; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
  wire [3:0] _io_alu_funct_T_27 = _io_alu_funct_T_8 ? 4'h5 : _io_alu_funct_T_25; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
  wire [3:0] _io_alu_funct_T_29 = _io_alu_funct_T_10 ? 4'h6 : _io_alu_funct_T_27; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
  wire [3:0] _io_alu_funct_T_31 = _io_alu_funct_T_12 ? 4'h7 : _io_alu_funct_T_29; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
  wire [3:0] _io_alu_funct_T_33 = _io_alu_funct_T_14 ? _io_alu_funct_T_1 : _io_alu_funct_T_31; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
  wire  _GEN_1 = 7'h37 == io_opcode | 7'h17 == io_opcode; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 76:20]
  wire  _GEN_2 = 7'h67 == io_opcode | _GEN_1; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 73:20]
  wire  _GEN_3 = 7'h6f == io_opcode | _GEN_2; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 70:20]
  wire  _GEN_4 = 7'h23 == io_opcode | _GEN_3; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 67:20]
  wire  _GEN_5 = 7'h3 == io_opcode | _GEN_4; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 64:20]
  wire  _GEN_6 = 7'h63 == io_opcode | _GEN_5; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 61:20]
  wire [3:0] _GEN_7 = 7'h33 == io_opcode ? _io_alu_funct_T_33 : {{3'd0}, _GEN_6}; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 47:20]
  assign io_alu_funct = 7'h13 == io_opcode ? _io_alu_funct_T_15 : _GEN_7; // @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21 33:20]
endmodule
module Execute(
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [31:0] io_immediate, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input         io_aluop1_source, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input         io_aluop2_source, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [31:0] io_forward_from_mem, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [31:0] io_forward_from_wb, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [1:0]  io_reg1_forward, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  input  [1:0]  io_reg2_forward, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  output [31:0] io_mem_alu_result, // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
  output [31:0] io_csr_write_data // @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]
);
  wire [3:0] alu_io_func; // @[src/main/scala/riscv/core/fivestage/Execute.scala 50:19]
  wire [31:0] alu_io_op1; // @[src/main/scala/riscv/core/fivestage/Execute.scala 50:19]
  wire [31:0] alu_io_op2; // @[src/main/scala/riscv/core/fivestage/Execute.scala 50:19]
  wire [31:0] alu_io_result; // @[src/main/scala/riscv/core/fivestage/Execute.scala 50:19]
  wire [6:0] alu_ctrl_io_opcode; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:24]
  wire [2:0] alu_ctrl_io_funct3; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:24]
  wire [6:0] alu_ctrl_io_funct7; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:24]
  wire [3:0] alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:24]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 45:30]
  wire [4:0] uimm = io_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 48:28]
  wire [31:0] _alu_io_op1_T_2 = 2'h1 == io_reg1_forward ? io_forward_from_mem : io_reg1_data; // @[src/main/scala/riscv/core/fivestage/Execute.scala 60:45]
  wire [31:0] _alu_io_op1_T_4 = 2'h2 == io_reg1_forward ? io_forward_from_wb : _alu_io_op1_T_2; // @[src/main/scala/riscv/core/fivestage/Execute.scala 60:45]
  wire [31:0] _alu_io_op2_T_2 = 2'h1 == io_reg2_forward ? io_forward_from_mem : io_reg2_data; // @[src/main/scala/riscv/core/fivestage/Execute.scala 70:45]
  wire [31:0] _alu_io_op2_T_4 = 2'h2 == io_reg2_forward ? io_forward_from_wb : _alu_io_op2_T_2; // @[src/main/scala/riscv/core/fivestage/Execute.scala 70:45]
  wire [31:0] _io_csr_write_data_T = ~io_reg1_data; // @[src/main/scala/riscv/core/fivestage/Execute.scala 80:54]
  wire [31:0] _io_csr_write_data_T_1 = io_csr_read_data & _io_csr_write_data_T; // @[src/main/scala/riscv/core/fivestage/Execute.scala 80:52]
  wire [31:0] _io_csr_write_data_T_2 = io_csr_read_data | io_reg1_data; // @[src/main/scala/riscv/core/fivestage/Execute.scala 81:52]
  wire [31:0] _io_csr_write_data_T_3 = {27'h0,uimm}; // @[src/main/scala/riscv/core/fivestage/Execute.scala 82:38]
  wire [31:0] _io_csr_write_data_T_5 = ~_io_csr_write_data_T_3; // @[src/main/scala/riscv/core/fivestage/Execute.scala 83:55]
  wire [31:0] _io_csr_write_data_T_6 = io_csr_read_data & _io_csr_write_data_T_5; // @[src/main/scala/riscv/core/fivestage/Execute.scala 83:53]
  wire [31:0] _io_csr_write_data_T_8 = io_csr_read_data | _io_csr_write_data_T_3; // @[src/main/scala/riscv/core/fivestage/Execute.scala 84:53]
  wire [31:0] _io_csr_write_data_T_10 = 3'h1 == funct3 ? io_reg1_data : 32'h0; // @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
  wire [31:0] _io_csr_write_data_T_12 = 3'h3 == funct3 ? _io_csr_write_data_T_1 : _io_csr_write_data_T_10; // @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
  wire [31:0] _io_csr_write_data_T_14 = 3'h2 == funct3 ? _io_csr_write_data_T_2 : _io_csr_write_data_T_12; // @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
  wire [31:0] _io_csr_write_data_T_16 = 3'h5 == funct3 ? _io_csr_write_data_T_3 : _io_csr_write_data_T_14; // @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
  wire [31:0] _io_csr_write_data_T_18 = 3'h7 == funct3 ? _io_csr_write_data_T_6 : _io_csr_write_data_T_16; // @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
  ALU alu ( // @[src/main/scala/riscv/core/fivestage/Execute.scala 50:19]
    .io_func(alu_io_func),
    .io_op1(alu_io_op1),
    .io_op2(alu_io_op2),
    .io_result(alu_io_result)
  );
  ALUControl alu_ctrl ( // @[src/main/scala/riscv/core/fivestage/Execute.scala 51:24]
    .io_opcode(alu_ctrl_io_opcode),
    .io_funct3(alu_ctrl_io_funct3),
    .io_funct7(alu_ctrl_io_funct7),
    .io_alu_funct(alu_ctrl_io_alu_funct)
  );
  assign io_mem_alu_result = alu_io_result; // @[src/main/scala/riscv/core/fivestage/Execute.scala 77:21]
  assign io_csr_write_data = 3'h6 == funct3 ? _io_csr_write_data_T_8 : _io_csr_write_data_T_18; // @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
  assign alu_io_func = alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/fivestage/Execute.scala 56:15]
  assign alu_io_op1 = io_aluop1_source ? io_instruction_address : _alu_io_op1_T_4; // @[src/main/scala/riscv/core/fivestage/Execute.scala 57:20]
  assign alu_io_op2 = io_aluop2_source ? io_immediate : _alu_io_op2_T_4; // @[src/main/scala/riscv/core/fivestage/Execute.scala 67:20]
  assign alu_ctrl_io_opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 44:30]
  assign alu_ctrl_io_funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 45:30]
  assign alu_ctrl_io_funct7 = io_instruction[31:25]; // @[src/main/scala/riscv/core/fivestage/Execute.scala 46:30]
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
  input         io_clint_exception_token, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output [31:0] io_wb_memory_read_data, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output        io_ctrl_stall_flag, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  output [31:0] io_forward_data, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
  input  [31:0] io_physical_address, // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]
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
  wire [1:0] mem_address_index = io_physical_address[1:0]; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 41:46]
  reg [1:0] mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 42:33]
  wire  _T = mem_access_state == 2'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 62:27]
  wire [1:0] _GEN_2 = io_bus_granted ? 2'h1 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 67:28 70:26 42:33]
  wire  _T_1 = mem_access_state == 2'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 72:33]
  wire [23:0] _io_wb_memory_read_data_T_2 = io_bus_read_data[31] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:74]
  wire [31:0] _io_wb_memory_read_data_T_4 = {_io_wb_memory_read_data_T_2,io_bus_read_data[31:24]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:69]
  wire [23:0] _io_wb_memory_read_data_T_7 = io_bus_read_data[7] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 82:32]
  wire [31:0] _io_wb_memory_read_data_T_9 = {_io_wb_memory_read_data_T_7,io_bus_read_data[7:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 82:27]
  wire [23:0] _io_wb_memory_read_data_T_12 = io_bus_read_data[15] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 83:32]
  wire [31:0] _io_wb_memory_read_data_T_14 = {_io_wb_memory_read_data_T_12,io_bus_read_data[15:8]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 83:27]
  wire [23:0] _io_wb_memory_read_data_T_17 = io_bus_read_data[23] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 84:32]
  wire [31:0] _io_wb_memory_read_data_T_19 = {_io_wb_memory_read_data_T_17,io_bus_read_data[23:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 84:27]
  wire  _io_wb_memory_read_data_T_20 = 2'h0 == mem_address_index; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
  wire [31:0] _io_wb_memory_read_data_T_21 = 2'h0 == mem_address_index ? _io_wb_memory_read_data_T_9 :
    _io_wb_memory_read_data_T_4; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
  wire  _io_wb_memory_read_data_T_22 = 2'h1 == mem_address_index; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
  wire [31:0] _io_wb_memory_read_data_T_23 = 2'h1 == mem_address_index ? _io_wb_memory_read_data_T_14 :
    _io_wb_memory_read_data_T_21; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
  wire  _io_wb_memory_read_data_T_24 = 2'h2 == mem_address_index; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
  wire [31:0] _io_wb_memory_read_data_T_25 = 2'h2 == mem_address_index ? _io_wb_memory_read_data_T_19 :
    _io_wb_memory_read_data_T_23; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
  wire [31:0] _io_wb_memory_read_data_T_28 = {24'h0,io_bus_read_data[31:24]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:70]
  wire [31:0] _io_wb_memory_read_data_T_31 = {24'h0,io_bus_read_data[7:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 89:27]
  wire [31:0] _io_wb_memory_read_data_T_34 = {24'h0,io_bus_read_data[15:8]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 90:27]
  wire [31:0] _io_wb_memory_read_data_T_37 = {24'h0,io_bus_read_data[23:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 91:27]
  wire [31:0] _io_wb_memory_read_data_T_39 = _io_wb_memory_read_data_T_20 ? _io_wb_memory_read_data_T_31 :
    _io_wb_memory_read_data_T_28; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
  wire [31:0] _io_wb_memory_read_data_T_41 = _io_wb_memory_read_data_T_22 ? _io_wb_memory_read_data_T_34 :
    _io_wb_memory_read_data_T_39; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
  wire [31:0] _io_wb_memory_read_data_T_43 = _io_wb_memory_read_data_T_24 ? _io_wb_memory_read_data_T_37 :
    _io_wb_memory_read_data_T_41; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
  wire  _io_wb_memory_read_data_T_44 = mem_address_index == 2'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 95:33]
  wire [15:0] _io_wb_memory_read_data_T_47 = io_bus_read_data[15] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 96:23]
  wire [31:0] _io_wb_memory_read_data_T_49 = {_io_wb_memory_read_data_T_47,io_bus_read_data[15:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 96:18]
  wire [15:0] _io_wb_memory_read_data_T_52 = io_bus_read_data[31] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:23]
  wire [31:0] _io_wb_memory_read_data_T_54 = {_io_wb_memory_read_data_T_52,io_bus_read_data[31:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:18]
  wire [31:0] _io_wb_memory_read_data_T_55 = _io_wb_memory_read_data_T_44 ? _io_wb_memory_read_data_T_49 :
    _io_wb_memory_read_data_T_54; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 94:40]
  wire [31:0] _io_wb_memory_read_data_T_59 = {16'h0,io_bus_read_data[15:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 101:18]
  wire [31:0] _io_wb_memory_read_data_T_62 = {16'h0,io_bus_read_data[31:16]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 102:18]
  wire [31:0] _io_wb_memory_read_data_T_63 = _io_wb_memory_read_data_T_44 ? _io_wb_memory_read_data_T_59 :
    _io_wb_memory_read_data_T_62; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 99:41]
  wire [31:0] _io_wb_memory_read_data_T_65 = 3'h0 == io_funct3 ? _io_wb_memory_read_data_T_25 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
  wire [31:0] _io_wb_memory_read_data_T_67 = 3'h4 == io_funct3 ? _io_wb_memory_read_data_T_43 :
    _io_wb_memory_read_data_T_65; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
  wire [31:0] _io_wb_memory_read_data_T_69 = 3'h1 == io_funct3 ? _io_wb_memory_read_data_T_55 :
    _io_wb_memory_read_data_T_67; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
  wire [31:0] _io_wb_memory_read_data_T_71 = 3'h5 == io_funct3 ? _io_wb_memory_read_data_T_63 :
    _io_wb_memory_read_data_T_69; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
  wire [31:0] _io_wb_memory_read_data_T_73 = 3'h2 == io_funct3 ? io_bus_read_data : _io_wb_memory_read_data_T_71; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
  wire [31:0] _GEN_3 = io_bus_read_valid ? _io_wb_memory_read_data_T_73 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:26 76:31 78:32]
  wire [1:0] _GEN_4 = io_bus_read_valid ? 2'h0 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 45:22 76:31 42:33]
  wire  _GEN_5 = io_bus_read_valid ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 46:24 75:26 76:31]
  wire  _GEN_8 = mem_access_state == 2'h1 & _GEN_5; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 56:22 72:62]
  wire [31:0] _GEN_9 = mem_access_state == 2'h1 ? _GEN_3 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:26 72:62]
  wire [1:0] _GEN_10 = mem_access_state == 2'h1 ? _GEN_4 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 42:33 72:62]
  wire  _GEN_11 = mem_access_state == 2'h0 | _GEN_8; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 62:56 64:26]
  wire  _GEN_13 = mem_access_state == 2'h0 | _T_1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 62:56 66:22]
  wire [31:0] _GEN_16 = mem_access_state == 2'h0 ? 32'h0 : _GEN_9; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:26 62:56]
  wire  _GEN_20 = 2'h3 == mem_address_index; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:27 117:{48,48}]
  wire [4:0] _io_bus_write_data_T_1 = {mem_address_index, 3'h0}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:89]
  wire [39:0] _GEN_0 = {{31'd0}, io_reg2_data[8:0]}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:67]
  wire [39:0] _io_bus_write_data_T_2 = _GEN_0 << _io_bus_write_data_T_1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:67]
  wire [32:0] _io_bus_write_data_T_5 = {io_reg2_data[16:0], 16'h0}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 130:95]
  wire [32:0] _GEN_23 = _io_wb_memory_read_data_T_44 ? {{16'd0}, io_reg2_data[16:0]} : _io_bus_write_data_T_5; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 121:41 125:29 130:29]
  wire  _GEN_24 = _io_wb_memory_read_data_T_44 ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:27 121:41 128:36]
  wire  _T_6 = io_funct3 == 3'h2; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 133:28]
  wire  _GEN_30 = io_funct3 == 3'h1 ? _io_wb_memory_read_data_T_44 : _T_6; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 120:54]
  wire [32:0] _GEN_32 = io_funct3 == 3'h1 ? _GEN_23 : {{1'd0}, io_reg2_data}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 114:25 120:54]
  wire  _GEN_33 = io_funct3 == 3'h1 ? _GEN_24 : _T_6; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 120:54]
  wire  _GEN_35 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_20 : _GEN_30; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 116:48]
  wire  _GEN_36 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_22 : _GEN_30; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 116:48]
  wire  _GEN_37 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_24 : _GEN_33; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 116:48]
  wire  _GEN_38 = io_funct3 == 3'h0 ? _GEN_20 : _GEN_33; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 116:48]
  wire [39:0] _GEN_39 = io_funct3 == 3'h0 ? _io_bus_write_data_T_2 : {{7'd0}, _GEN_32}; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 116:48 118:27]
  wire [1:0] _GEN_41 = io_bus_granted ? 2'h2 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 139:28 141:26 42:33]
  wire  _T_7 = mem_access_state == 2'h2; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 143:33]
  wire [1:0] _GEN_42 = io_bus_write_valid ? 2'h0 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 147:32 45:22 42:33]
  wire  _GEN_43 = io_bus_write_valid ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 147:32 46:24 145:26]
  wire  _GEN_45 = mem_access_state == 2'h2 & _GEN_43; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 143:63 56:22]
  wire [1:0] _GEN_47 = mem_access_state == 2'h2 ? _GEN_42 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 143:63 42:33]
  wire  _GEN_48 = _T | _GEN_45; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56 113:26]
  wire [39:0] _GEN_49 = _T ? _GEN_39 : 40'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56 52:21]
  wire  _GEN_50 = _T & _GEN_35; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56 53:23]
  wire  _GEN_51 = _T & _GEN_36; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56 53:23]
  wire  _GEN_52 = _T & _GEN_37; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56 53:23]
  wire  _GEN_53 = _T & _GEN_38; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56 53:23]
  wire  _GEN_54 = _T | _T_7; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56 138:22]
  wire  _GEN_55 = _T & io_bus_granted; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56]
  wire [1:0] _GEN_56 = _T ? _GEN_41 : _GEN_47; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56]
  wire  _GEN_57 = io_memory_write_enable & _GEN_48; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 56:22]
  wire [39:0] _GEN_58 = io_memory_write_enable ? _GEN_49 : 40'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 52:21]
  wire  _GEN_59 = io_memory_write_enable & _GEN_50; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 53:23]
  wire  _GEN_60 = io_memory_write_enable & _GEN_51; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 53:23]
  wire  _GEN_61 = io_memory_write_enable & _GEN_52; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 53:23]
  wire  _GEN_62 = io_memory_write_enable & _GEN_53; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 53:23]
  wire  _GEN_63 = io_memory_write_enable & _GEN_54; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 49:18]
  wire  _GEN_64 = io_memory_write_enable & _GEN_55; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38 54:16]
  wire  _GEN_66 = io_memory_read_enable ? _GEN_11 : _GEN_57; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 61:37]
  wire  _GEN_67 = io_memory_read_enable & _T; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 50:15 61:37]
  wire  _GEN_68 = io_memory_read_enable ? _GEN_13 : _GEN_63; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 61:37]
  wire [31:0] _GEN_71 = io_memory_read_enable ? _GEN_16 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:26 61:37]
  wire [39:0] _GEN_72 = io_memory_read_enable ? 40'h0 : _GEN_58; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 52:21 61:37]
  wire  _GEN_73 = io_memory_read_enable ? 1'h0 : _GEN_59; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 61:37]
  wire  _GEN_74 = io_memory_read_enable ? 1'h0 : _GEN_60; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 61:37]
  wire  _GEN_75 = io_memory_read_enable ? 1'h0 : _GEN_61; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 61:37]
  wire  _GEN_76 = io_memory_read_enable ? 1'h0 : _GEN_62; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 61:37]
  wire  _GEN_77 = io_memory_read_enable ? 1'h0 : _GEN_64; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 54:16 61:37]
  wire [39:0] _GEN_84 = io_clint_exception_token ? 40'h0 : _GEN_72; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 52:21 58:34]
  assign io_wb_memory_read_data = io_clint_exception_token ? 32'h0 : _GEN_71; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:26 58:34]
  assign io_ctrl_stall_flag = io_clint_exception_token ? 1'h0 : _GEN_66; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 58:34 60:24]
  assign io_forward_data = io_regs_write_source == 2'h2 ? io_csr_read_data : io_alu_result; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 153:25]
  assign io_bus_read = io_clint_exception_token ? 1'h0 : _GEN_67; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 50:15 58:34]
  assign io_bus_address = io_physical_address; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 51:18 58:34]
  assign io_bus_write = io_clint_exception_token ? 1'h0 : _GEN_77; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 54:16 58:34]
  assign io_bus_write_data = _GEN_84[31:0];
  assign io_bus_write_strobe_0 = io_clint_exception_token ? 1'h0 : _GEN_73; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 58:34]
  assign io_bus_write_strobe_1 = io_clint_exception_token ? 1'h0 : _GEN_74; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 58:34]
  assign io_bus_write_strobe_2 = io_clint_exception_token ? 1'h0 : _GEN_75; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 58:34]
  assign io_bus_write_strobe_3 = io_clint_exception_token ? 1'h0 : _GEN_76; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23 58:34]
  assign io_bus_request = io_clint_exception_token ? 1'h0 : _GEN_68; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 58:34 59:20]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 42:33]
      mem_access_state <= 2'h0; // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 42:33]
    end else if (!(io_clint_exception_token)) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 58:34]
      if (io_memory_read_enable) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 61:37]
        if (mem_access_state == 2'h0) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 62:56]
          mem_access_state <= _GEN_2;
        end else begin
          mem_access_state <= _GEN_10;
        end
      end else if (io_memory_write_enable) begin // @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38]
        mem_access_state <= _GEN_56;
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
  wire [31:0] _io_regs_write_data_T_1 = io_instruction_address + 32'h4; // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 35:72]
  wire [31:0] _io_regs_write_data_T_3 = 2'h1 == io_regs_write_source ? io_memory_read_data : io_alu_result; // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
  wire [31:0] _io_regs_write_data_T_5 = 2'h2 == io_regs_write_source ? io_csr_read_data : _io_regs_write_data_T_3; // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
  assign io_regs_write_data = 2'h3 == io_regs_write_source ? _io_regs_write_data_T_1 : _io_regs_write_data_T_5; // @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
endmodule
module Forwarding(
  input  [4:0] io_rs1_id, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rs2_id, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rs1_ex, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rs2_ex, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rd_mem, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input        io_reg_write_enable_mem, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input  [4:0] io_rd_wb, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  input        io_reg_write_enable_wb, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  output [1:0] io_reg1_forward_id, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  output [1:0] io_reg2_forward_id, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  output [1:0] io_reg1_forward_ex, // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
  output [1:0] io_reg2_forward_ex // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]
);
  wire  _T_1 = io_reg_write_enable_mem & io_rd_mem != 5'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 43:32]
  wire  _T_5 = io_reg_write_enable_wb & io_rd_wb != 5'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 45:37]
  wire [1:0] _GEN_0 = io_reg_write_enable_wb & io_rd_wb != 5'h0 & io_rd_wb == io_rs1_id ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 45:84 46:24 48:24]
  wire [1:0] _GEN_2 = _T_5 & io_rd_wb == io_rs2_id ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 53:84 54:24 56:24]
  wire [1:0] _GEN_4 = _T_5 & io_rd_wb == io_rs1_ex ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 61:84 62:24 64:24]
  wire [1:0] _GEN_6 = _T_5 & io_rd_wb == io_rs2_ex ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 69:84 70:24 72:24]
  assign io_reg1_forward_id = io_reg_write_enable_mem & io_rd_mem != 5'h0 & io_rd_mem == io_rs1_id ? 2'h1 : _GEN_0; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 43:81 44:24]
  assign io_reg2_forward_id = _T_1 & io_rd_mem == io_rs2_id ? 2'h1 : _GEN_2; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 51:81 52:24]
  assign io_reg1_forward_ex = _T_1 & io_rd_mem == io_rs1_ex ? 2'h1 : _GEN_4; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 59:81 60:24]
  assign io_reg2_forward_ex = _T_1 & io_rd_mem == io_rs2_ex ? 2'h1 : _GEN_6; // @[src/main/scala/riscv/core/fivestage/Forwarding.scala 67:81 68:24]
endmodule
module CLINT(
  input         clock,
  input         reset,
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_instruction_address_if, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input         io_exception_signal, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_instruction_address_cause_exception, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_exception_cause, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_exception_val, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  output        io_exception_token, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input         io_jump_flag, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_jump_address, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_csr_mtvec, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_csr_mepc, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input  [31:0] io_csr_mstatus, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  input         io_interrupt_enable, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  output        io_ctrl_stall_flag, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  output        io_csr_reg_write_enable, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  output [11:0] io_csr_reg_write_address, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  output [31:0] io_csr_reg_write_data, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  output [31:0] io_id_interrupt_handler_address, // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
  output        io_id_interrupt_assert // @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 87:26]
  reg [31:0] instruction_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 88:36]
  reg [31:0] cause; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 89:22]
  reg [31:0] trap_val; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 90:25]
  reg  interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 91:33]
  reg [31:0] interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 92:42]
  reg  csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 93:37]
  reg [11:0] csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 94:38]
  reg [31:0] csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 95:35]
  reg  exception_token; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 96:32]
  reg  exception_signal; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 97:33]
  wire [1:0] _GEN_3 = io_instruction == 32'h30200073 ? 2'h3 : 2'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 119:55 120:21 122:21]
  wire [1:0] _GEN_4 = io_interrupt_flag != 32'h0 & io_interrupt_enable ? 2'h2 : _GEN_3; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 117:81 118:21]
  wire [1:0] interrupt_state = exception_signal | io_instruction == 32'h73 | io_instruction == 32'h100073 ? 2'h1 :
    _GEN_4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 115:115 116:21]
  wire  _io_ctrl_stall_flag_T_1 = csr_state != 3'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:79]
  wire  _T = csr_state == 3'h4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:38]
  wire  _T_1 = exception_signal & csr_state == 3'h4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:25]
  wire  _GEN_1 = ~exception_signal & io_exception_signal | exception_signal; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 109:67 110:22 97:33]
  wire [31:0] _instruction_address_T_1 = io_jump_address - 32'h4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 136:27]
  wire [31:0] _instruction_address_T_2 = io_jump_flag ? _instruction_address_T_1 : io_instruction_address_if; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 134:12]
  wire [3:0] _cause_T_1 = 32'h73 == io_instruction ? 4'hb : 4'ha; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 144:40]
  wire [3:0] _cause_T_3 = 32'h100073 == io_instruction ? 4'h3 : _cause_T_1; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 144:40]
  wire [31:0] _GEN_6 = io_interrupt_flag[0] ? 32'h80000007 : 32'h8000000b; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 161:13 162:34 163:15]
  wire [31:0] _instruction_address_T_4 = io_jump_flag ? io_jump_address : io_instruction_address_if; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 167:33]
  wire [2:0] _GEN_7 = interrupt_state == 2'h3 ? 3'h3 : csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 172:57 174:17 87:26]
  wire  _T_20 = csr_state == 3'h3; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 184:24]
  wire [2:0] _GEN_18 = csr_state == 3'h5 ? 3'h4 : 3'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 180:44 181:15]
  wire  _csr_reg_write_address_T_1 = 3'h2 == csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire [11:0] _csr_reg_write_address_T_2 = 3'h2 == csr_state ? 12'h341 : 12'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire  _csr_reg_write_address_T_3 = 3'h4 == csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire [11:0] _csr_reg_write_address_T_4 = 3'h4 == csr_state ? 12'h342 : _csr_reg_write_address_T_2; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire  _csr_reg_write_address_T_5 = 3'h1 == csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire [11:0] _csr_reg_write_address_T_6 = 3'h1 == csr_state ? 12'h300 : _csr_reg_write_address_T_4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire  _csr_reg_write_address_T_7 = 3'h3 == csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire [11:0] _csr_reg_write_address_T_8 = 3'h3 == csr_state ? 12'h300 : _csr_reg_write_address_T_6; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire  _csr_reg_write_address_T_9 = 3'h5 == csr_state; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire [11:0] _csr_reg_write_address_T_10 = 3'h5 == csr_state ? 12'h343 : _csr_reg_write_address_T_8; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
  wire [31:0] _csr_reg_write_address_T_11 = {20'h0,_csr_reg_write_address_T_10}; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:31]
  wire [31:0] _csr_reg_write_data_T_2 = {io_csr_mstatus[31:4],1'h0,io_csr_mstatus[2:0]}; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 205:30]
  wire [31:0] _csr_reg_write_data_T_6 = {io_csr_mstatus[31:4],io_csr_mstatus[7],io_csr_mstatus[2:0]}; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 206:27]
  wire [31:0] _csr_reg_write_data_T_8 = _csr_reg_write_address_T_1 ? instruction_address : 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
  wire [31:0] _csr_reg_write_data_T_10 = _csr_reg_write_address_T_3 ? cause : _csr_reg_write_data_T_8; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
  wire [31:0] _GEN_25 = reset ? 32'h0 : _csr_reg_write_address_T_11; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:25 94:{38,38}]
  assign io_exception_token = exception_token; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 99:22]
  assign io_ctrl_stall_flag = (interrupt_state != 2'h0 | csr_state != 3'h0) & ~exception_token; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:98]
  assign io_csr_reg_write_enable = csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 211:27]
  assign io_csr_reg_write_address = csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 212:28]
  assign io_csr_reg_write_data = csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 213:25]
  assign io_id_interrupt_handler_address = interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 224:35]
  assign io_id_interrupt_assert = interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 223:26]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 87:26]
      csr_state <= 3'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 87:26]
    end else if (csr_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 126:37]
      if (interrupt_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 127:57]
        csr_state <= 3'h2; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 129:17]
      end else if (interrupt_state == 2'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 159:64]
        csr_state <= 3'h2; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 166:17]
      end else begin
        csr_state <= _GEN_7;
      end
    end else if (csr_state == 3'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 176:43]
      csr_state <= 3'h1; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 177:15]
    end else if (csr_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 178:46]
      csr_state <= 3'h5; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 179:15]
    end else begin
      csr_state <= _GEN_18;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 88:36]
      instruction_address <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 88:36]
    end else if (csr_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 126:37]
      if (interrupt_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 127:57]
        if (exception_signal) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 131:33]
          instruction_address <= io_instruction_address_cause_exception;
        end else begin
          instruction_address <= _instruction_address_T_2;
        end
      end else if (interrupt_state == 2'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 159:64]
        instruction_address <= _instruction_address_T_4; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 167:27]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 89:22]
      cause <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 89:22]
    end else if (csr_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 126:37]
      if (interrupt_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 127:57]
        if (exception_signal) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 141:19]
          cause <= io_exception_cause;
        end else begin
          cause <= {{28'd0}, _cause_T_3};
        end
      end else if (interrupt_state == 2'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 159:64]
        cause <= _GEN_6;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 90:25]
      trap_val <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 90:25]
    end else if (csr_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 126:37]
      if (interrupt_state == 2'h1) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 127:57]
        if (exception_signal) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 154:22]
          trap_val <= io_exception_val;
        end else begin
          trap_val <= 32'h0;
        end
      end else if (interrupt_state == 2'h2) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 159:64]
        trap_val <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 165:16]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 91:33]
      interrupt_assert <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 91:33]
    end else begin
      interrupt_assert <= _T | _T_20; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 215:20]
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 92:42]
      interrupt_handler_address <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 92:42]
    end else if (_csr_reg_write_address_T_7) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 216:79]
      interrupt_handler_address <= io_csr_mepc;
    end else if (_csr_reg_write_address_T_3) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 216:79]
      interrupt_handler_address <= io_csr_mtvec;
    end else begin
      interrupt_handler_address <= 32'h0;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 93:37]
      csr_reg_write_enable <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 93:37]
    end else begin
      csr_reg_write_enable <= _io_ctrl_stall_flag_T_1; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 190:24]
    end
    csr_reg_write_address <= _GEN_25[11:0]; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:25 94:{38,38}]
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 95:35]
      csr_reg_write_data <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 95:35]
    end else if (_csr_reg_write_address_T_9) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
      csr_reg_write_data <= trap_val;
    end else if (_csr_reg_write_address_T_7) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
      csr_reg_write_data <= _csr_reg_write_data_T_6;
    end else if (_csr_reg_write_address_T_5) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
      csr_reg_write_data <= _csr_reg_write_data_T_2;
    end else begin
      csr_reg_write_data <= _csr_reg_write_data_T_10;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 96:32]
      exception_token <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 96:32]
    end else begin
      exception_token <= _T_1;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 97:33]
      exception_signal <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 97:33]
    end else if (exception_token) begin // @[src/main/scala/riscv/core/fivestage/CLINT.scala 107:25]
      exception_signal <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CLINT.scala 108:22]
    end else begin
      exception_signal <= _GEN_1;
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
  trap_val = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  interrupt_assert = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  interrupt_handler_address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  csr_reg_write_enable = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  csr_reg_write_address = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  csr_reg_write_data = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  exception_token = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  exception_signal = _RAND_10[0:0];
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
  input         io_reg_write_enable_ex, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  input  [11:0] io_reg_read_address_id, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  input  [11:0] io_reg_write_address_ex, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  input  [31:0] io_reg_write_data_ex, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  input         io_reg_write_enable_clint, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  input  [11:0] io_reg_write_address_clint, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  input  [31:0] io_reg_write_data_clint, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output        io_interrupt_enable, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output        io_mmu_enable, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output [31:0] io_id_reg_data, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output        io_start_paging, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output [31:0] io_clint_csr_mtvec, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output [31:0] io_clint_csr_mepc, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output [31:0] io_clint_csr_mstatus, // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
  output [31:0] io_mmu_csr_satp // @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] cycles; // @[src/main/scala/riscv/core/fivestage/CSR.scala 62:23]
  reg [31:0] mtvec; // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:22]
  reg [31:0] mcause; // @[src/main/scala/riscv/core/fivestage/CSR.scala 64:23]
  reg [31:0] mepc; // @[src/main/scala/riscv/core/fivestage/CSR.scala 65:21]
  reg [31:0] mie; // @[src/main/scala/riscv/core/fivestage/CSR.scala 66:20]
  reg [31:0] mstatus; // @[src/main/scala/riscv/core/fivestage/CSR.scala 67:24]
  reg [31:0] mscratch; // @[src/main/scala/riscv/core/fivestage/CSR.scala 68:25]
  reg [31:0] mtval; // @[src/main/scala/riscv/core/fivestage/CSR.scala 69:22]
  reg [31:0] satp; // @[src/main/scala/riscv/core/fivestage/CSR.scala 70:21]
  wire [63:0] _cycles_T_1 = cycles + 64'h1; // @[src/main/scala/riscv/core/fivestage/CSR.scala 72:20]
  wire [11:0] _GEN_0 = io_reg_write_enable_clint ? io_reg_write_address_clint : 12'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 83:21 94:41 95:23]
  wire [31:0] _GEN_1 = io_reg_write_enable_clint ? io_reg_write_data_clint : 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 84:18 94:41 96:20]
  wire [11:0] reg_write_address = io_reg_write_enable_ex ? io_reg_write_address_ex : _GEN_0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:32 92:23]
  wire [31:0] reg_write_data = io_reg_write_enable_ex ? io_reg_write_data_ex : _GEN_1; // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:32 93:20]
  wire  _T_12 = reg_write_data[31] & ~satp[31]; // @[src/main/scala/riscv/core/fivestage/CSR.scala 115:37]
  wire [31:0] _GEN_5 = reg_write_address == 12'h180 ? reg_write_data : satp; // @[src/main/scala/riscv/core/fivestage/CSR.scala 113:54 114:10 70:21]
  wire  _GEN_6 = reg_write_address == 12'h180 & _T_12; // @[src/main/scala/riscv/core/fivestage/CSR.scala 113:54 79:19]
  wire [31:0] _GEN_7 = reg_write_address == 12'h343 ? reg_write_data : mtval; // @[src/main/scala/riscv/core/fivestage/CSR.scala 111:55 112:11 69:22]
  wire [31:0] _GEN_8 = reg_write_address == 12'h343 ? satp : _GEN_5; // @[src/main/scala/riscv/core/fivestage/CSR.scala 111:55 70:21]
  wire  _GEN_9 = reg_write_address == 12'h343 ? 1'h0 : _GEN_6; // @[src/main/scala/riscv/core/fivestage/CSR.scala 111:55 79:19]
  wire [31:0] _GEN_10 = reg_write_address == 12'h340 ? reg_write_data : mscratch; // @[src/main/scala/riscv/core/fivestage/CSR.scala 109:58 110:14 68:25]
  wire [31:0] _GEN_11 = reg_write_address == 12'h340 ? mtval : _GEN_7; // @[src/main/scala/riscv/core/fivestage/CSR.scala 109:58 69:22]
  wire [31:0] _GEN_12 = reg_write_address == 12'h340 ? satp : _GEN_8; // @[src/main/scala/riscv/core/fivestage/CSR.scala 109:58 70:21]
  wire  _GEN_13 = reg_write_address == 12'h340 ? 1'h0 : _GEN_9; // @[src/main/scala/riscv/core/fivestage/CSR.scala 109:58 79:19]
  wire [31:0] _GEN_14 = reg_write_address == 12'h300 ? reg_write_data : mstatus; // @[src/main/scala/riscv/core/fivestage/CSR.scala 107:57 108:13 67:24]
  wire [31:0] _GEN_15 = reg_write_address == 12'h300 ? mscratch : _GEN_10; // @[src/main/scala/riscv/core/fivestage/CSR.scala 107:57 68:25]
  wire [31:0] _GEN_16 = reg_write_address == 12'h300 ? mtval : _GEN_11; // @[src/main/scala/riscv/core/fivestage/CSR.scala 107:57 69:22]
  wire [31:0] _GEN_17 = reg_write_address == 12'h300 ? satp : _GEN_12; // @[src/main/scala/riscv/core/fivestage/CSR.scala 107:57 70:21]
  wire  _GEN_18 = reg_write_address == 12'h300 ? 1'h0 : _GEN_13; // @[src/main/scala/riscv/core/fivestage/CSR.scala 107:57 79:19]
  wire [31:0] _GEN_19 = reg_write_address == 12'h304 ? reg_write_data : mie; // @[src/main/scala/riscv/core/fivestage/CSR.scala 105:53 106:9 66:20]
  wire [31:0] _GEN_20 = reg_write_address == 12'h304 ? mstatus : _GEN_14; // @[src/main/scala/riscv/core/fivestage/CSR.scala 105:53 67:24]
  wire [31:0] _GEN_21 = reg_write_address == 12'h304 ? mscratch : _GEN_15; // @[src/main/scala/riscv/core/fivestage/CSR.scala 105:53 68:25]
  wire [31:0] _GEN_22 = reg_write_address == 12'h304 ? mtval : _GEN_16; // @[src/main/scala/riscv/core/fivestage/CSR.scala 105:53 69:22]
  wire [31:0] _GEN_23 = reg_write_address == 12'h304 ? satp : _GEN_17; // @[src/main/scala/riscv/core/fivestage/CSR.scala 105:53 70:21]
  wire  _GEN_24 = reg_write_address == 12'h304 ? 1'h0 : _GEN_18; // @[src/main/scala/riscv/core/fivestage/CSR.scala 105:53 79:19]
  wire  _GEN_31 = reg_write_address == 12'h341 ? 1'h0 : _GEN_24; // @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54 79:19]
  wire  _GEN_39 = reg_write_address == 12'h342 ? 1'h0 : _GEN_31; // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56 79:19]
  wire [31:0] _io_id_reg_data_T_1 = 12'hc00 == io_reg_read_address_id ? cycles[31:0] : 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_3 = 12'hc80 == io_reg_read_address_id ? cycles[63:32] : _io_id_reg_data_T_1; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_5 = 12'h305 == io_reg_read_address_id ? mtvec : _io_id_reg_data_T_3; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_7 = 12'h342 == io_reg_read_address_id ? mcause : _io_id_reg_data_T_5; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_9 = 12'h341 == io_reg_read_address_id ? mepc : _io_id_reg_data_T_7; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_11 = 12'h304 == io_reg_read_address_id ? mie : _io_id_reg_data_T_9; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_13 = 12'h300 == io_reg_read_address_id ? mstatus : _io_id_reg_data_T_11; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_15 = 12'h340 == io_reg_read_address_id ? mscratch : _io_id_reg_data_T_13; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  wire [31:0] _io_id_reg_data_T_17 = 12'h343 == io_reg_read_address_id ? mtval : _io_id_reg_data_T_15; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  assign io_interrupt_enable = mstatus[3]; // @[src/main/scala/riscv/core/fivestage/CSR.scala 76:33]
  assign io_mmu_enable = satp[31]; // @[src/main/scala/riscv/core/fivestage/CSR.scala 78:24]
  assign io_id_reg_data = 12'h180 == io_reg_read_address_id ? satp : _io_id_reg_data_T_17; // @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
  assign io_start_paging = reg_write_address == 12'h305 ? 1'h0 : _GEN_39; // @[src/main/scala/riscv/core/fivestage/CSR.scala 79:19 99:49]
  assign io_clint_csr_mtvec = mtvec; // @[src/main/scala/riscv/core/fivestage/CSR.scala 73:22]
  assign io_clint_csr_mepc = mepc; // @[src/main/scala/riscv/core/fivestage/CSR.scala 74:21]
  assign io_clint_csr_mstatus = mstatus; // @[src/main/scala/riscv/core/fivestage/CSR.scala 75:24]
  assign io_mmu_csr_satp = satp; // @[src/main/scala/riscv/core/fivestage/CSR.scala 77:19]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 62:23]
      cycles <= 64'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 62:23]
    end else begin
      cycles <= _cycles_T_1; // @[src/main/scala/riscv/core/fivestage/CSR.scala 72:10]
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:22]
      mtvec <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 63:22]
    end else if (reg_write_address == 12'h305) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:32]
        mtvec <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/fivestage/CSR.scala 93:20]
      end else if (io_reg_write_enable_clint) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 94:41]
        mtvec <= io_reg_write_data_clint; // @[src/main/scala/riscv/core/fivestage/CSR.scala 96:20]
      end else begin
        mtvec <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 84:18]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 64:23]
      mcause <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 64:23]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (reg_write_address == 12'h342) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 91:32]
          mcause <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/fivestage/CSR.scala 93:20]
        end else begin
          mcause <= _GEN_1;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 65:21]
      mepc <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 65:21]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        if (reg_write_address == 12'h341) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54]
          mepc <= reg_write_data; // @[src/main/scala/riscv/core/fivestage/CSR.scala 104:10]
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 66:20]
      mie <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 66:20]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54]
          mie <= _GEN_19;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 67:24]
      mstatus <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 67:24]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54]
          mstatus <= _GEN_20;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 68:25]
      mscratch <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 68:25]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54]
          mscratch <= _GEN_21;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 69:22]
      mtval <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 69:22]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54]
          mtval <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 70:21]
      satp <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CSR.scala 70:21]
    end else if (!(reg_write_address == 12'h305)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      if (!(reg_write_address == 12'h342)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        if (!(reg_write_address == 12'h341)) begin // @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54]
          satp <= _GEN_23;
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
  _RAND_7 = {1{`RANDOM}};
  mtval = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  satp = _RAND_8[31:0];
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
module MMU(
  input         clock,
  input         reset,
  input  [31:0] io_instructions, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input  [31:0] io_instructions_address, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input  [19:0] io_ppn_from_satp, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input  [31:0] io_virtual_address, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input         io_mmu_occupied_by_mem, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input         io_restart, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_restart_done, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_pa_valid, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output [31:0] io_pa, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_page_fault_signals, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output [31:0] io_va_cause_page_fault, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output [31:0] io_ecause, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output [31:0] io_epc, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input         io_page_fault_responed, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_bus_read, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input  [31:0] io_bus_read_data, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input         io_bus_read_valid, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_bus_write, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output [31:0] io_bus_write_data, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_bus_write_strobe_0, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_bus_write_strobe_1, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_bus_write_strobe_2, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  output        io_bus_write_strobe_3, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input         io_bus_write_valid, // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
  input         io_bus_granted // @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [6:0] opcode = io_instructions[6:0]; // @[src/main/scala/riscv/core/fivestage/MMU.scala 37:31]
  reg [2:0] state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 39:22]
  wire [9:0] vpn1 = io_virtual_address[31:22]; // @[src/main/scala/riscv/core/fivestage/MMU.scala 43:16]
  wire [9:0] vpn0 = io_virtual_address[21:12]; // @[src/main/scala/riscv/core/fivestage/MMU.scala 45:16]
  wire [11:0] pageoffset = io_virtual_address[11:0]; // @[src/main/scala/riscv/core/fivestage/MMU.scala 46:22]
  reg [31:0] pte1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 48:17]
  reg [31:0] pte0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 49:17]
  reg  page_fault_signals; // @[src/main/scala/riscv/core/fivestage/MMU.scala 51:35]
  wire [31:0] _GEN_199 = {io_ppn_from_satp, 12'h0}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 101:44]
  wire [34:0] _io_bus_address_T = {{3'd0}, _GEN_199}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 101:44]
  wire [11:0] _io_bus_address_T_1 = {vpn1, 2'h0}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 101:91]
  wire [34:0] _GEN_200 = {{23'd0}, _io_bus_address_T_1}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 101:83]
  wire [34:0] _io_bus_address_T_2 = _io_bus_address_T & _GEN_200; // @[src/main/scala/riscv/core/fivestage/MMU.scala 101:83]
  wire [1:0] _GEN_1 = io_restart ? 2'h0 : 2'h2; // @[src/main/scala/riscv/core/fivestage/MMU.scala 109:26 111:17 113:17]
  wire  _GEN_3 = io_bus_read_valid & io_restart; // @[src/main/scala/riscv/core/fivestage/MMU.scala 107:31 88:19]
  wire [2:0] _GEN_4 = io_bus_read_valid ? {{1'd0}, _GEN_1} : state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 107:31 39:22]
  wire [3:0] _io_ecause_T_1 = 32'h23 == io_instructions ? 4'hf : 4'ha; // @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
  wire [3:0] _io_ecause_T_3 = 32'h3 == io_instructions ? 4'hd : _io_ecause_T_1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
  wire [3:0] _io_ecause_T_4 = io_mmu_occupied_by_mem ? _io_ecause_T_3 : 4'hc; // @[src/main/scala/riscv/core/fivestage/MMU.scala 54:21]
  wire [31:0] _io_epc_T = io_mmu_occupied_by_mem ? io_instructions_address : io_virtual_address; // @[src/main/scala/riscv/core/fivestage/MMU.scala 66:18]
  wire  _GEN_5 = io_page_fault_responed ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 65:24 71:34 72:26]
  wire [2:0] _GEN_6 = io_page_fault_responed ? 3'h0 : state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 71:34 73:13 39:22]
  wire [31:0] _GEN_201 = {pte1[29:10], 12'h0}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 126:42]
  wire [34:0] _io_bus_address_T_4 = {{3'd0}, _GEN_201}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 126:42]
  wire [11:0] _io_bus_address_T_5 = {vpn0, 2'h0}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 126:89]
  wire [34:0] _GEN_202 = {{23'd0}, _io_bus_address_T_5}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 126:81]
  wire [34:0] _io_bus_address_T_6 = _io_bus_address_T_4 & _GEN_202; // @[src/main/scala/riscv/core/fivestage/MMU.scala 126:81]
  wire [2:0] _GEN_7 = io_bus_granted ? 3'h3 : state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 128:30 129:17 39:22]
  wire [3:0] _GEN_8 = ~pte1[0] | pte1[2:1] == 2'h2 | pte1[9:8] != 2'h0 ? _io_ecause_T_4 : 4'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91 54:15 86:13]
  wire [31:0] _GEN_9 = ~pte1[0] | pte1[2:1] == 2'h2 | pte1[9:8] != 2'h0 ? io_virtual_address : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91 64:28 89:26]
  wire  _GEN_10 = ~pte1[0] | pte1[2:1] == 2'h2 | pte1[9:8] != 2'h0 ? _GEN_5 : page_fault_signals; // @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91 51:35]
  wire [31:0] _GEN_11 = ~pte1[0] | pte1[2:1] == 2'h2 | pte1[9:8] != 2'h0 ? _io_epc_T : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91 66:12 90:10]
  wire [2:0] _GEN_12 = ~pte1[0] | pte1[2:1] == 2'h2 | pte1[9:8] != 2'h0 ? _GEN_6 : _GEN_7; // @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91]
  wire  _GEN_13 = ~pte1[0] | pte1[2:1] == 2'h2 | pte1[9:8] != 2'h0 ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91 79:15 125:21]
  wire [34:0] _GEN_14 = ~pte1[0] | pte1[2:1] == 2'h2 | pte1[9:8] != 2'h0 ? 35'h0 : _io_bus_address_T_6; // @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91 80:18 126:24]
  wire [2:0] _GEN_15 = io_restart ? 3'h0 : _GEN_12; // @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24 120:15]
  wire [3:0] _GEN_16 = io_restart ? 4'h0 : _GEN_8; // @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24 86:13]
  wire [31:0] _GEN_17 = io_restart ? 32'h0 : _GEN_9; // @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24 89:26]
  wire  _GEN_18 = io_restart ? page_fault_signals : _GEN_10; // @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24 51:35]
  wire [31:0] _GEN_19 = io_restart ? 32'h0 : _GEN_11; // @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24 90:10]
  wire  _GEN_20 = io_restart ? 1'h0 : _GEN_13; // @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24 79:15]
  wire [34:0] _GEN_21 = io_restart ? 35'h0 : _GEN_14; // @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24 80:18]
  wire [2:0] _GEN_22 = io_restart ? 3'h0 : 3'h4; // @[src/main/scala/riscv/core/fivestage/MMU.scala 136:26 138:17 140:17]
  wire [31:0] _GEN_23 = io_bus_read_valid ? io_bus_read_data : pte0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 134:31 135:14 49:17]
  wire [2:0] _GEN_24 = io_bus_read_valid ? _GEN_22 : state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 134:31 39:22]
  wire  instructionInvalid = ~io_mmu_occupied_by_mem & ~pte0[3]; // @[src/main/scala/riscv/core/fivestage/MMU.scala 152:69]
  wire  _storeInvalid_T_1 = opcode == 7'h23; // @[src/main/scala/riscv/core/fivestage/MMU.scala 153:50]
  wire  storeInvalid = opcode == 7'h23 & ~pte0[2]; // @[src/main/scala/riscv/core/fivestage/MMU.scala 153:73]
  wire  loadInvalid = opcode == 7'h3 & ~pte0[1]; // @[src/main/scala/riscv/core/fivestage/MMU.scala 154:72]
  wire  _T_38 = ~pte0[6] | ~pte0[7] & _storeInvalid_T_1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 158:36]
  wire [31:0] _io_bus_write_data_T_2 = {pte0[31:8],_storeInvalid_T_1,1'h1,pte0[5:0]}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 164:35]
  wire [34:0] _io_bus_address_T_11 = _io_bus_address_T_4 + _GEN_202; // @[src/main/scala/riscv/core/fivestage/MMU.scala 166:83]
  wire [31:0] _GEN_25 = ~pte0[6] | ~pte0[7] & _storeInvalid_T_1 ? _io_bus_write_data_T_2 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 158:106 164:29 81:21]
  wire [34:0] _GEN_27 = ~pte0[6] | ~pte0[7] & _storeInvalid_T_1 ? _io_bus_address_T_11 : 35'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 158:106 166:26 80:18]
  wire [2:0] _GEN_32 = ~pte0[6] | ~pte0[7] & _storeInvalid_T_1 ? 3'h5 : 3'h6; // @[src/main/scala/riscv/core/fivestage/MMU.scala 158:106 170:17 172:17]
  wire [3:0] _GEN_33 = instructionInvalid | storeInvalid | loadInvalid ? _io_ecause_T_4 : 4'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65 54:15 86:13]
  wire [31:0] _GEN_34 = instructionInvalid | storeInvalid | loadInvalid ? io_virtual_address : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65 64:28 89:26]
  wire  _GEN_35 = instructionInvalid | storeInvalid | loadInvalid ? _GEN_5 : page_fault_signals; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65 51:35]
  wire [31:0] _GEN_36 = instructionInvalid | storeInvalid | loadInvalid ? _io_epc_T : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65 66:12 90:10]
  wire [2:0] _GEN_37 = instructionInvalid | storeInvalid | loadInvalid ? _GEN_6 : _GEN_32; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65]
  wire [31:0] _GEN_38 = instructionInvalid | storeInvalid | loadInvalid ? 32'h0 : _GEN_25; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65 81:21]
  wire  _GEN_39 = instructionInvalid | storeInvalid | loadInvalid ? 1'h0 : _T_38; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65 83:16]
  wire [34:0] _GEN_40 = instructionInvalid | storeInvalid | loadInvalid ? 35'h0 : _GEN_27; // @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65 80:18]
  wire [3:0] _GEN_45 = pte0[1] | pte0[3] ? _GEN_33 : 4'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 86:13]
  wire [31:0] _GEN_46 = pte0[1] | pte0[3] ? _GEN_34 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 89:26]
  wire  _GEN_47 = pte0[1] | pte0[3] ? _GEN_35 : page_fault_signals; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 51:35]
  wire [31:0] _GEN_48 = pte0[1] | pte0[3] ? _GEN_36 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 90:10]
  wire [2:0] _GEN_49 = pte0[1] | pte0[3] ? _GEN_37 : state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 39:22]
  wire [31:0] _GEN_50 = pte0[1] | pte0[3] ? _GEN_38 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 81:21]
  wire  _GEN_51 = (pte0[1] | pte0[3]) & _GEN_39; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 83:16]
  wire [34:0] _GEN_52 = pte0[1] | pte0[3] ? _GEN_40 : 35'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54 80:18]
  wire [3:0] _GEN_57 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? _io_ecause_T_4 : _GEN_45; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120 54:15]
  wire [31:0] _GEN_58 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? io_virtual_address :
    _GEN_46; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120 64:28]
  wire  _GEN_59 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? _GEN_5 : _GEN_47; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120]
  wire [31:0] _GEN_60 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? _io_epc_T : _GEN_48; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120 66:12]
  wire [2:0] _GEN_61 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? _GEN_6 : _GEN_49; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120]
  wire [31:0] _GEN_62 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? 32'h0 : _GEN_50; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120 81:21]
  wire  _GEN_63 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? 1'h0 : _GEN_51; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120 83:16]
  wire [34:0] _GEN_64 = ~pte0[0] | pte0[2:1] == 2'h2 | pte0[9:8] != 2'h0 | pte0[3:1] == 3'h0 ? 35'h0 : _GEN_52; // @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120 80:18]
  wire [2:0] _GEN_69 = io_restart ? 3'h0 : _GEN_61; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 146:15]
  wire [3:0] _GEN_70 = io_restart ? 4'h0 : _GEN_57; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 86:13]
  wire [31:0] _GEN_71 = io_restart ? 32'h0 : _GEN_58; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 89:26]
  wire  _GEN_72 = io_restart ? page_fault_signals : _GEN_59; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 51:35]
  wire [31:0] _GEN_73 = io_restart ? 32'h0 : _GEN_60; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 90:10]
  wire [31:0] _GEN_74 = io_restart ? 32'h0 : _GEN_62; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 81:21]
  wire  _GEN_75 = io_restart ? 1'h0 : _GEN_63; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 83:16]
  wire [34:0] _GEN_76 = io_restart ? 35'h0 : _GEN_64; // @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24 80:18]
  wire [2:0] _GEN_81 = io_restart ? 3'h0 : 3'h6; // @[src/main/scala/riscv/core/fivestage/MMU.scala 178:26 180:17 182:17]
  wire  _GEN_82 = io_bus_write_valid & io_restart; // @[src/main/scala/riscv/core/fivestage/MMU.scala 177:32 88:19]
  wire [2:0] _GEN_83 = io_bus_write_valid ? _GEN_81 : state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 177:32 39:22]
  wire [31:0] _io_pa_T_1 = {pte0[29:10],pageoffset}; // @[src/main/scala/riscv/core/fivestage/MMU.scala 190:21]
  wire [31:0] _GEN_85 = io_restart ? 32'h0 : _io_pa_T_1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 186:24 190:15 87:9]
  wire  _GEN_86 = io_restart ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 186:24 77:15 191:21]
  wire  _GEN_87 = state == 3'h6 & io_restart; // @[src/main/scala/riscv/core/fivestage/MMU.scala 185:55 88:19]
  wire [2:0] _GEN_88 = state == 3'h6 ? 3'h0 : state; // @[src/main/scala/riscv/core/fivestage/MMU.scala 185:55 39:22]
  wire [31:0] _GEN_89 = state == 3'h6 ? _GEN_85 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 185:55 87:9]
  wire  _GEN_90 = state == 3'h6 & _GEN_86; // @[src/main/scala/riscv/core/fivestage/MMU.scala 185:55 77:15]
  wire  _GEN_92 = state == 3'h5 ? _GEN_82 : _GEN_87; // @[src/main/scala/riscv/core/fivestage/MMU.scala 175:46]
  wire [2:0] _GEN_93 = state == 3'h5 ? _GEN_83 : _GEN_88; // @[src/main/scala/riscv/core/fivestage/MMU.scala 175:46]
  wire [31:0] _GEN_94 = state == 3'h5 ? 32'h0 : _GEN_89; // @[src/main/scala/riscv/core/fivestage/MMU.scala 175:46 87:9]
  wire  _GEN_95 = state == 3'h5 ? 1'h0 : _GEN_90; // @[src/main/scala/riscv/core/fivestage/MMU.scala 175:46 77:15]
  wire  _GEN_96 = state == 3'h4 ? io_restart : _GEN_92; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47]
  wire [2:0] _GEN_97 = state == 3'h4 ? _GEN_69 : _GEN_93; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47]
  wire [3:0] _GEN_98 = state == 3'h4 ? _GEN_70 : 4'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 86:13]
  wire [31:0] _GEN_99 = state == 3'h4 ? _GEN_71 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 89:26]
  wire  _GEN_100 = state == 3'h4 ? _GEN_72 : page_fault_signals; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 51:35]
  wire [31:0] _GEN_101 = state == 3'h4 ? _GEN_73 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 90:10]
  wire [31:0] _GEN_102 = state == 3'h4 ? _GEN_74 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 81:21]
  wire  _GEN_103 = state == 3'h4 & _GEN_75; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47]
  wire [34:0] _GEN_104 = state == 3'h4 ? _GEN_76 : 35'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 80:18]
  wire [31:0] _GEN_109 = state == 3'h4 ? 32'h0 : _GEN_94; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 87:9]
  wire  _GEN_110 = state == 3'h4 ? 1'h0 : _GEN_95; // @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47 77:15]
  wire [31:0] _GEN_112 = state == 3'h3 ? _GEN_23 : pte0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 49:17]
  wire  _GEN_113 = state == 3'h3 ? _GEN_3 : _GEN_96; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44]
  wire [2:0] _GEN_114 = state == 3'h3 ? _GEN_24 : _GEN_97; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44]
  wire [3:0] _GEN_115 = state == 3'h3 ? 4'h0 : _GEN_98; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 86:13]
  wire [31:0] _GEN_116 = state == 3'h3 ? 32'h0 : _GEN_99; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 89:26]
  wire  _GEN_117 = state == 3'h3 ? page_fault_signals : _GEN_100; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 51:35]
  wire [31:0] _GEN_118 = state == 3'h3 ? 32'h0 : _GEN_101; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 90:10]
  wire [31:0] _GEN_119 = state == 3'h3 ? 32'h0 : _GEN_102; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 81:21]
  wire  _GEN_120 = state == 3'h3 ? 1'h0 : _GEN_103; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 83:16]
  wire [34:0] _GEN_121 = state == 3'h3 ? 35'h0 : _GEN_104; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 80:18]
  wire [31:0] _GEN_126 = state == 3'h3 ? 32'h0 : _GEN_109; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 87:9]
  wire  _GEN_127 = state == 3'h3 ? 1'h0 : _GEN_110; // @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44 77:15]
  wire  _GEN_128 = state == 3'h2 ? io_restart : _GEN_113; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire [2:0] _GEN_129 = state == 3'h2 ? _GEN_15 : _GEN_114; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire [3:0] _GEN_130 = state == 3'h2 ? _GEN_16 : _GEN_115; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire [31:0] _GEN_131 = state == 3'h2 ? _GEN_17 : _GEN_116; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire  _GEN_132 = state == 3'h2 ? _GEN_18 : _GEN_117; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire [31:0] _GEN_133 = state == 3'h2 ? _GEN_19 : _GEN_118; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire  _GEN_134 = state == 3'h2 & _GEN_20; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire [34:0] _GEN_135 = state == 3'h2 ? _GEN_21 : _GEN_121; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
  wire [31:0] _GEN_137 = state == 3'h2 ? 32'h0 : _GEN_119; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47 81:21]
  wire  _GEN_138 = state == 3'h2 ? 1'h0 : _GEN_120; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47 83:16]
  wire [31:0] _GEN_143 = state == 3'h2 ? 32'h0 : _GEN_126; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47 87:9]
  wire  _GEN_144 = state == 3'h2 ? 1'h0 : _GEN_127; // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47 77:15]
  wire  _GEN_145 = state == 3'h1 ? 1'h0 : _GEN_134; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 106:19]
  wire  _GEN_147 = state == 3'h1 ? _GEN_3 : _GEN_128; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44]
  wire [3:0] _GEN_149 = state == 3'h1 ? 4'h0 : _GEN_130; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 86:13]
  wire [31:0] _GEN_150 = state == 3'h1 ? 32'h0 : _GEN_131; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 89:26]
  wire [31:0] _GEN_152 = state == 3'h1 ? 32'h0 : _GEN_133; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 90:10]
  wire [34:0] _GEN_153 = state == 3'h1 ? 35'h0 : _GEN_135; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 80:18]
  wire [31:0] _GEN_155 = state == 3'h1 ? 32'h0 : _GEN_137; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 81:21]
  wire  _GEN_156 = state == 3'h1 ? 1'h0 : _GEN_138; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 83:16]
  wire [31:0] _GEN_161 = state == 3'h1 ? 32'h0 : _GEN_143; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 87:9]
  wire  _GEN_162 = state == 3'h1 ? 1'h0 : _GEN_144; // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44 77:15]
  wire  _GEN_163 = state == 3'h0 ? 1'h0 : _GEN_162; // @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36 98:19]
  wire  _GEN_164 = state == 3'h0 | _GEN_145; // @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36 99:19]
  wire  _GEN_165 = state == 3'h0 ? 1'h0 : _GEN_147; // @[src/main/scala/riscv/core/fivestage/MMU.scala 100:23 95:36]
  wire [34:0] _GEN_166 = state == 3'h0 ? _io_bus_address_T_2 : _GEN_153; // @[src/main/scala/riscv/core/fivestage/MMU.scala 101:22 95:36]
  wire [3:0] _GEN_169 = state == 3'h0 ? 4'h0 : _GEN_149; // @[src/main/scala/riscv/core/fivestage/MMU.scala 86:13 95:36]
  wire [31:0] _GEN_170 = state == 3'h0 ? 32'h0 : _GEN_150; // @[src/main/scala/riscv/core/fivestage/MMU.scala 89:26 95:36]
  wire [31:0] _GEN_172 = state == 3'h0 ? 32'h0 : _GEN_152; // @[src/main/scala/riscv/core/fivestage/MMU.scala 90:10 95:36]
  wire [31:0] _GEN_174 = state == 3'h0 ? 32'h0 : _GEN_155; // @[src/main/scala/riscv/core/fivestage/MMU.scala 81:21 95:36]
  wire  _GEN_175 = state == 3'h0 ? 1'h0 : _GEN_156; // @[src/main/scala/riscv/core/fivestage/MMU.scala 83:16 95:36]
  wire [31:0] _GEN_180 = state == 3'h0 ? 32'h0 : _GEN_161; // @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36 87:9]
  wire [34:0] _GEN_184 = io_bus_granted ? _GEN_166 : 35'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 80:18 94:24]
  wire [3:0] _GEN_187 = io_bus_granted ? _GEN_169 : 4'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 86:13 94:24]
  assign io_restart_done = io_bus_granted & _GEN_165; // @[src/main/scala/riscv/core/fivestage/MMU.scala 88:19 94:24]
  assign io_pa_valid = io_bus_granted & _GEN_163; // @[src/main/scala/riscv/core/fivestage/MMU.scala 77:15 94:24]
  assign io_pa = io_bus_granted ? _GEN_180 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 94:24 87:9]
  assign io_page_fault_signals = page_fault_signals; // @[src/main/scala/riscv/core/fivestage/MMU.scala 84:25]
  assign io_va_cause_page_fault = io_bus_granted ? _GEN_170 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 94:24 89:26]
  assign io_ecause = {{28'd0}, _GEN_187};
  assign io_epc = io_bus_granted ? _GEN_172 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 90:10 94:24]
  assign io_bus_read = io_bus_granted & _GEN_164; // @[src/main/scala/riscv/core/fivestage/MMU.scala 79:15 94:24]
  assign io_bus_address = _GEN_184[31:0];
  assign io_bus_write = io_bus_granted & _GEN_175; // @[src/main/scala/riscv/core/fivestage/MMU.scala 83:16 94:24]
  assign io_bus_write_data = io_bus_granted ? _GEN_174 : 32'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 81:21 94:24]
  assign io_bus_write_strobe_0 = io_bus_granted & _GEN_175; // @[src/main/scala/riscv/core/fivestage/MMU.scala 82:23 94:24]
  assign io_bus_write_strobe_1 = io_bus_granted & _GEN_175; // @[src/main/scala/riscv/core/fivestage/MMU.scala 82:23 94:24]
  assign io_bus_write_strobe_2 = io_bus_granted & _GEN_175; // @[src/main/scala/riscv/core/fivestage/MMU.scala 82:23 94:24]
  assign io_bus_write_strobe_3 = io_bus_granted & _GEN_175; // @[src/main/scala/riscv/core/fivestage/MMU.scala 82:23 94:24]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 39:22]
      state <= 3'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 39:22]
    end else if (io_bus_granted) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 94:24]
      if (state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36]
        state <= 3'h1; // @[src/main/scala/riscv/core/fivestage/MMU.scala 103:13]
      end else if (state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44]
        state <= _GEN_4;
      end else begin
        state <= _GEN_129;
      end
    end
    if (io_bus_granted) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 94:24]
      if (!(state == 3'h0)) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36]
        if (state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44]
          if (io_bus_read_valid) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 107:31]
            pte1 <= io_bus_read_data; // @[src/main/scala/riscv/core/fivestage/MMU.scala 108:14]
          end
        end
      end
    end
    if (io_bus_granted) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 94:24]
      if (!(state == 3'h0)) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36]
        if (!(state == 3'h1)) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44]
          if (!(state == 3'h2)) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
            pte0 <= _GEN_112;
          end
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 51:35]
      page_fault_signals <= 1'h0; // @[src/main/scala/riscv/core/fivestage/MMU.scala 51:35]
    end else if (io_bus_granted) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 94:24]
      if (!(state == 3'h0)) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36]
        if (!(state == 3'h1)) begin // @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44]
          page_fault_signals <= _GEN_132;
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
  pte1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  pte0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  page_fault_signals = _RAND_3[0:0];
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
  output        io_axi4_channels_write_address_channel_AWVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input         io_axi4_channels_write_address_channel_AWREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output [31:0] io_axi4_channels_write_address_channel_AWADDR, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output        io_axi4_channels_write_data_channel_WVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input         io_axi4_channels_write_data_channel_WREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output [31:0] io_axi4_channels_write_data_channel_WDATA, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output [3:0]  io_axi4_channels_write_data_channel_WSTRB, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input         io_axi4_channels_write_response_channel_BVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output        io_axi4_channels_write_response_channel_BREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output        io_axi4_channels_read_address_channel_ARVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input         io_axi4_channels_read_address_channel_ARREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output [31:0] io_axi4_channels_read_address_channel_ARADDR, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input         io_axi4_channels_read_data_channel_RVALID, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output        io_axi4_channels_read_data_channel_RREADY, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input  [31:0] io_axi4_channels_read_data_channel_RDATA, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  output [31:0] io_bus_address, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input         io_stall_flag_bus, // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
  input         io_instruction_valid // @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  ctrl_io_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_jump_instruction_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_stall_flag_if; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_stall_flag_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_stall_flag_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_stall_flag_bus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire [4:0] ctrl_io_rs1_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire [4:0] ctrl_io_rs2_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_memory_read_enable_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire [4:0] ctrl_io_rd_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_memory_read_enable_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire [4:0] ctrl_io_rd_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_csr_start_paging; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_if_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_id_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_pc_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_if_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_id_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  ctrl_io_ex_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
  wire  regs_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire  regs_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire  regs_io_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire [4:0] regs_io_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire [31:0] regs_io_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire [4:0] regs_io_read_address1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire [4:0] regs_io_read_address2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire [31:0] regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire [31:0] regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
  wire  inst_fetch_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_io_stall_flag_ctrl; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_io_jump_flag_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire [31:0] inst_fetch_io_jump_address_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire [31:0] inst_fetch_io_physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire [31:0] inst_fetch_io_id_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire [31:0] inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_io_pc_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_io_bus_read; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire [31:0] inst_fetch_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire [31:0] inst_fetch_io_bus_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_io_bus_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  inst_fetch_io_bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
  wire  if2id_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire  if2id_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire  if2id_io_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire  if2id_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire [31:0] if2id_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire [31:0] if2id_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire [31:0] if2id_io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire [31:0] if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire [31:0] if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire [31:0] if2id_io_output_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
  wire [31:0] id_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_forward_from_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_forward_from_wb; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [1:0] id_io_reg1_forward; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [1:0] id_io_reg2_forward; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [4:0] id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [4:0] id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_ex_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [1:0] id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [4:0] id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [11:0] id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_clint_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire [31:0] id_io_if_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
  wire  id2ex_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_flush_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [4:0] id2ex_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [1:0] id2ex_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [11:0] id2ex_io_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [4:0] id2ex_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [1:0] id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_output_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [11:0] id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire  id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
  wire [31:0] ex_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire  ex_io_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire  ex_io_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_forward_from_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_forward_from_wb; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [1:0] ex_io_reg1_forward; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [1:0] ex_io_reg2_forward; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_mem_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire [31:0] ex_io_csr_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
  wire  ex2mem_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_io_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [1:0] ex2mem_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [1:0] ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire [31:0] ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
  wire  mem_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [2:0] mem_io_funct3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [1:0] mem_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_clint_exception_token; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_forward_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_read; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_bus_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_write; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire [31:0] mem_io_bus_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_write_strobe_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_write_strobe_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_write_strobe_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_write_strobe_3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_request; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem_io_bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
  wire  mem2wb_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire  mem2wb_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire  mem2wb_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [1:0] mem2wb_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire  mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [1:0] mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
  wire [31:0] wb_io_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
  wire [31:0] wb_io_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
  wire [31:0] wb_io_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
  wire [1:0] wb_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
  wire [31:0] wb_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
  wire [31:0] wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
  wire [4:0] forwarding_io_rs1_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [4:0] forwarding_io_rs2_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [4:0] forwarding_io_rs1_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [4:0] forwarding_io_rs2_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [4:0] forwarding_io_rd_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire  forwarding_io_reg_write_enable_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [4:0] forwarding_io_rd_wb; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire  forwarding_io_reg_write_enable_wb; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [1:0] forwarding_io_reg1_forward_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [1:0] forwarding_io_reg2_forward_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [1:0] forwarding_io_reg1_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire [1:0] forwarding_io_reg2_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
  wire  clint_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_instruction_address_if; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_io_exception_signal; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_instruction_address_cause_exception; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_exception_cause; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_exception_val; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_io_exception_token; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_io_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_csr_mtvec; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_csr_mepc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_csr_mstatus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_io_interrupt_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_io_csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [11:0] clint_io_csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire [31:0] clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
  wire  csr_regs_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire  csr_regs_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire  csr_regs_io_reg_write_enable_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [11:0] csr_regs_io_reg_read_address_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [11:0] csr_regs_io_reg_write_address_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [31:0] csr_regs_io_reg_write_data_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire  csr_regs_io_reg_write_enable_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [11:0] csr_regs_io_reg_write_address_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [31:0] csr_regs_io_reg_write_data_clint; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire  csr_regs_io_interrupt_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire  csr_regs_io_mmu_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [31:0] csr_regs_io_id_reg_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire  csr_regs_io_start_paging; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [31:0] csr_regs_io_clint_csr_mtvec; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [31:0] csr_regs_io_clint_csr_mepc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [31:0] csr_regs_io_clint_csr_mstatus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire [31:0] csr_regs_io_mmu_csr_satp; // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
  wire  axi4_master_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [31:0] axi4_master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [31:0] axi4_master_io_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [3:0] axi4_master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [31:0] axi4_master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [31:0] axi4_master_io_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [1:0] axi4_master_io_channels_read_data_channel_RRESP; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_read; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_write; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [31:0] axi4_master_io_bundle_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [31:0] axi4_master_io_bundle_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_write_strobe_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_write_strobe_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_write_strobe_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_write_strobe_3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire [31:0] axi4_master_io_bundle_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_busy; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  axi4_master_io_bundle_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
  wire  mmu_clock; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_reset; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_instructions; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_instructions_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [19:0] mmu_io_ppn_from_satp; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_virtual_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_mmu_occupied_by_mem; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_restart; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_restart_done; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_pa_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_pa; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_page_fault_signals; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_va_cause_page_fault; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_ecause; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_epc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_page_fault_responed; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_read; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_bus_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_write; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire [31:0] mmu_io_bus_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_write_strobe_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_write_strobe_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_write_strobe_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_write_strobe_3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  wire  mmu_io_bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
  reg [2:0] bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 58:28]
  reg [2:0] mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 59:33]
  reg [31:0] virtual_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 60:32]
  reg [31:0] physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 61:33]
  reg  mmu_restart; // @[src/main/scala/riscv/core/fivestage/CPU.scala 62:28]
  reg  pending; // @[src/main/scala/riscv/core/fivestage/CPU.scala 63:24]
  wire  _T_5 = io_instruction_valid & inst_fetch_io_pc_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 74:70]
  wire [2:0] _GEN_0 = io_instruction_valid & inst_fetch_io_pc_valid ? 3'h1 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 74:97 75:28 59:33]
  wire [2:0] _GEN_1 = io_instruction_valid & inst_fetch_io_pc_valid ? 3'h4 : 3'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 67:17 74:97 76:23]
  wire [31:0] _GEN_2 = io_instruction_valid & inst_fetch_io_pc_valid ? inst_fetch_io_id_instruction_address :
    virtual_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 74:97 77:27 60:32]
  wire [2:0] _GEN_3 = mem_io_bus_request ? 3'h2 : _GEN_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 70:34 71:28]
  wire [2:0] _GEN_4 = mem_io_bus_request ? 3'h3 : _GEN_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 70:34 72:23]
  wire [31:0] _GEN_5 = mem_io_bus_request ? ex2mem_io_output_alu_result : _GEN_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 70:34 73:27]
  wire [2:0] _GEN_6 = _T_5 ? 3'h4 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 84:97 85:28 59:33]
  wire [31:0] _GEN_8 = _T_5 ? inst_fetch_io_id_instruction_address : physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 84:97 87:28 61:33]
  wire [2:0] _GEN_9 = mem_io_bus_request ? 3'h3 : _GEN_6; // @[src/main/scala/riscv/core/fivestage/CPU.scala 80:34 81:28]
  wire [31:0] _GEN_10 = mem_io_bus_request ? ex2mem_io_output_alu_result : _GEN_8; // @[src/main/scala/riscv/core/fivestage/CPU.scala 80:34 82:28]
  wire [1:0] _GEN_11 = mem_io_bus_request ? 2'h2 : {{1'd0}, _T_5}; // @[src/main/scala/riscv/core/fivestage/CPU.scala 80:34 83:23]
  wire [2:0] _GEN_20 = mmu_io_pa_valid ? 3'h3 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 96:33 97:24 59:33]
  wire [2:0] _GEN_21 = mmu_io_pa_valid ? 3'h2 : bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 96:33 98:19 58:28]
  wire [31:0] _GEN_22 = mmu_io_pa_valid ? mmu_io_pa : physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 96:33 99:24 61:33]
  wire  _GEN_27 = mmu_io_restart_done ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 104:19 105:33 106:21]
  wire [2:0] _GEN_28 = mmu_io_restart_done ? 3'h2 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 105:33 107:26 59:33]
  wire [2:0] _GEN_29 = mmu_io_restart_done ? 3'h3 : bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 105:33 108:21 58:28]
  wire [31:0] _GEN_30 = mmu_io_restart_done ? ex2mem_io_output_alu_result : virtual_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 105:33 109:25 60:32]
  wire  _GEN_31 = mmu_io_restart_done ? 1'h0 : mmu_restart; // @[src/main/scala/riscv/core/fivestage/CPU.scala 113:35 114:23 62:28]
  wire  _GEN_32 = mmu_io_restart_done ? 1'h0 : pending; // @[src/main/scala/riscv/core/fivestage/CPU.scala 113:35 115:19 63:24]
  wire [2:0] _GEN_33 = mmu_io_restart_done ? 3'h1 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 113:35 116:28 59:33]
  wire [2:0] _GEN_34 = mmu_io_restart_done ? 3'h4 : bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 113:35 117:23 58:28]
  wire [31:0] _GEN_35 = mmu_io_restart_done ? inst_fetch_io_id_instruction_address : virtual_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 113:35 118:27 60:32]
  wire [2:0] _GEN_36 = ~id_io_if_jump_flag & mmu_io_pa_valid ? 3'h4 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 121:54 122:28 59:33]
  wire [2:0] _GEN_37 = ~id_io_if_jump_flag & mmu_io_pa_valid ? 3'h1 : bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 121:54 123:23 58:28]
  wire [31:0] _GEN_38 = ~id_io_if_jump_flag & mmu_io_pa_valid ? mmu_io_pa : physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 121:54 124:28 61:33]
  wire  _GEN_39 = pending ? _GEN_31 : mmu_restart; // @[src/main/scala/riscv/core/fivestage/CPU.scala 112:21 62:28]
  wire  _GEN_40 = pending ? _GEN_32 : pending; // @[src/main/scala/riscv/core/fivestage/CPU.scala 112:21 63:24]
  wire [2:0] _GEN_41 = pending ? _GEN_33 : _GEN_36; // @[src/main/scala/riscv/core/fivestage/CPU.scala 112:21]
  wire [2:0] _GEN_42 = pending ? _GEN_34 : _GEN_37; // @[src/main/scala/riscv/core/fivestage/CPU.scala 112:21]
  wire [31:0] _GEN_43 = pending ? _GEN_35 : virtual_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 112:21 60:32]
  wire [31:0] _GEN_44 = pending ? physical_address : _GEN_38; // @[src/main/scala/riscv/core/fivestage/CPU.scala 112:21 61:33]
  wire  _GEN_45 = id_io_if_jump_flag | _GEN_39; // @[src/main/scala/riscv/core/fivestage/CPU.scala 128:32 129:21]
  wire  _GEN_46 = id_io_if_jump_flag | _GEN_40; // @[src/main/scala/riscv/core/fivestage/CPU.scala 128:32 130:17]
  wire  _GEN_47 = mem_io_bus_request ? _GEN_27 : _GEN_45; // @[src/main/scala/riscv/core/fivestage/CPU.scala 103:30]
  wire [2:0] _GEN_48 = mem_io_bus_request ? _GEN_28 : _GEN_41; // @[src/main/scala/riscv/core/fivestage/CPU.scala 103:30]
  wire [2:0] _GEN_49 = mem_io_bus_request ? _GEN_29 : _GEN_42; // @[src/main/scala/riscv/core/fivestage/CPU.scala 103:30]
  wire [31:0] _GEN_50 = mem_io_bus_request ? _GEN_30 : _GEN_43; // @[src/main/scala/riscv/core/fivestage/CPU.scala 103:30]
  wire  _GEN_51 = mem_io_bus_request ? pending : _GEN_46; // @[src/main/scala/riscv/core/fivestage/CPU.scala 103:30 63:24]
  wire [31:0] _GEN_52 = mem_io_bus_request ? physical_address : _GEN_44; // @[src/main/scala/riscv/core/fivestage/CPU.scala 103:30 61:33]
  wire [2:0] _GEN_53 = mem_io_bus_read_valid | mem_io_bus_write_valid ? 3'h0 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 134:59 135:24 59:33]
  wire [2:0] _GEN_54 = mem_io_bus_read_valid | mem_io_bus_write_valid ? 3'h0 : bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 134:59 136:19 58:28]
  wire [2:0] _GEN_55 = inst_fetch_io_bus_read_valid ? 3'h0 : bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 139:40 140:19 58:28]
  wire [2:0] _GEN_56 = inst_fetch_io_bus_read_valid ? 3'h0 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 139:40 141:24 59:33]
  wire [2:0] _GEN_57 = mem_access_state == 3'h4 ? _GEN_55 : bus_granted; // @[src/main/scala/riscv/core/fivestage/CPU.scala 138:61 58:28]
  wire [2:0] _GEN_58 = mem_access_state == 3'h4 ? _GEN_56 : mem_access_state; // @[src/main/scala/riscv/core/fivestage/CPU.scala 138:61 59:33]
  wire [2:0] _GEN_59 = mem_access_state == 3'h3 ? _GEN_53 : _GEN_58; // @[src/main/scala/riscv/core/fivestage/CPU.scala 133:62]
  wire [2:0] _GEN_60 = mem_access_state == 3'h3 ? _GEN_54 : _GEN_57; // @[src/main/scala/riscv/core/fivestage/CPU.scala 133:62]
  wire  _T_15 = bus_granted == 3'h4; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:20]
  wire  _T_16 = bus_granted == 3'h3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:65]
  wire  _T_17 = bus_granted == 3'h4 | bus_granted == 3'h3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:50]
  wire  _T_18 = bus_granted == 3'h2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:26]
  wire [31:0] _GEN_79 = bus_granted == 3'h2 ? mem_io_bus_address : inst_fetch_io_bus_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 153:20 160:20]
  wire  _GEN_80 = bus_granted == 3'h2 ? mem_io_bus_read : inst_fetch_io_bus_read; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 154:32 161:32]
  wire  _GEN_81 = bus_granted == 3'h2 & mem_io_bus_write; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 156:33 163:33]
  wire [31:0] _GEN_82 = bus_granted == 3'h2 ? mem_io_bus_write_data : 32'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 157:38 164:38]
  wire  _GEN_83 = bus_granted == 3'h2 & mem_io_bus_write_strobe_0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 158:40 165:40]
  wire  _GEN_84 = bus_granted == 3'h2 & mem_io_bus_write_strobe_1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 158:40 165:40]
  wire  _GEN_85 = bus_granted == 3'h2 & mem_io_bus_write_strobe_2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 158:40 165:40]
  wire  _GEN_86 = bus_granted == 3'h2 & mem_io_bus_write_strobe_3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54 158:40 165:40]
  wire  _inst_fetch_io_bus_read_valid_T_1 = bus_granted == 3'h1 & io_instruction_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 169:43]
  Control ctrl ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
    .io_jump_flag(ctrl_io_jump_flag),
    .io_jump_instruction_id(ctrl_io_jump_instruction_id),
    .io_stall_flag_if(ctrl_io_stall_flag_if),
    .io_stall_flag_mem(ctrl_io_stall_flag_mem),
    .io_stall_flag_clint(ctrl_io_stall_flag_clint),
    .io_stall_flag_bus(ctrl_io_stall_flag_bus),
    .io_rs1_id(ctrl_io_rs1_id),
    .io_rs2_id(ctrl_io_rs2_id),
    .io_memory_read_enable_ex(ctrl_io_memory_read_enable_ex),
    .io_rd_ex(ctrl_io_rd_ex),
    .io_memory_read_enable_mem(ctrl_io_memory_read_enable_mem),
    .io_rd_mem(ctrl_io_rd_mem),
    .io_csr_start_paging(ctrl_io_csr_start_paging),
    .io_if_flush(ctrl_io_if_flush),
    .io_id_flush(ctrl_io_id_flush),
    .io_pc_stall(ctrl_io_pc_stall),
    .io_if_stall(ctrl_io_if_stall),
    .io_id_stall(ctrl_io_id_stall),
    .io_ex_stall(ctrl_io_ex_stall)
  );
  RegisterFile regs ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
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
  InstructionFetch inst_fetch ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
    .clock(inst_fetch_clock),
    .reset(inst_fetch_reset),
    .io_stall_flag_ctrl(inst_fetch_io_stall_flag_ctrl),
    .io_jump_flag_id(inst_fetch_io_jump_flag_id),
    .io_jump_address_id(inst_fetch_io_jump_address_id),
    .io_physical_address(inst_fetch_io_physical_address),
    .io_ctrl_stall_flag(inst_fetch_io_ctrl_stall_flag),
    .io_id_instruction_address(inst_fetch_io_id_instruction_address),
    .io_id_instruction(inst_fetch_io_id_instruction),
    .io_pc_valid(inst_fetch_io_pc_valid),
    .io_bus_read(inst_fetch_io_bus_read),
    .io_bus_address(inst_fetch_io_bus_address),
    .io_bus_read_data(inst_fetch_io_bus_read_data),
    .io_bus_read_valid(inst_fetch_io_bus_read_valid),
    .io_bus_granted(inst_fetch_io_bus_granted)
  );
  IF2ID if2id ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
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
  InstructionDecode id ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
    .io_instruction(id_io_instruction),
    .io_instruction_address(id_io_instruction_address),
    .io_reg1_data(id_io_reg1_data),
    .io_reg2_data(id_io_reg2_data),
    .io_forward_from_mem(id_io_forward_from_mem),
    .io_forward_from_wb(id_io_forward_from_wb),
    .io_reg1_forward(id_io_reg1_forward),
    .io_reg2_forward(id_io_reg2_forward),
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
    .io_ctrl_jump_instruction(id_io_ctrl_jump_instruction),
    .io_clint_jump_address(id_io_clint_jump_address),
    .io_if_jump_flag(id_io_if_jump_flag),
    .io_if_jump_address(id_io_if_jump_address)
  );
  ID2EX id2ex ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
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
  Execute ex ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
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
    .io_reg1_forward(ex_io_reg1_forward),
    .io_reg2_forward(ex_io_reg2_forward),
    .io_mem_alu_result(ex_io_mem_alu_result),
    .io_csr_write_data(ex_io_csr_write_data)
  );
  EX2MEM ex2mem ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
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
  MemoryAccess mem ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_alu_result(mem_io_alu_result),
    .io_reg2_data(mem_io_reg2_data),
    .io_memory_read_enable(mem_io_memory_read_enable),
    .io_memory_write_enable(mem_io_memory_write_enable),
    .io_funct3(mem_io_funct3),
    .io_regs_write_source(mem_io_regs_write_source),
    .io_csr_read_data(mem_io_csr_read_data),
    .io_clint_exception_token(mem_io_clint_exception_token),
    .io_wb_memory_read_data(mem_io_wb_memory_read_data),
    .io_ctrl_stall_flag(mem_io_ctrl_stall_flag),
    .io_forward_data(mem_io_forward_data),
    .io_physical_address(mem_io_physical_address),
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
  MEM2WB mem2wb ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
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
  WriteBack wb ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
    .io_instruction_address(wb_io_instruction_address),
    .io_alu_result(wb_io_alu_result),
    .io_memory_read_data(wb_io_memory_read_data),
    .io_regs_write_source(wb_io_regs_write_source),
    .io_csr_read_data(wb_io_csr_read_data),
    .io_regs_write_data(wb_io_regs_write_data)
  );
  Forwarding forwarding ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
    .io_rs1_id(forwarding_io_rs1_id),
    .io_rs2_id(forwarding_io_rs2_id),
    .io_rs1_ex(forwarding_io_rs1_ex),
    .io_rs2_ex(forwarding_io_rs2_ex),
    .io_rd_mem(forwarding_io_rd_mem),
    .io_reg_write_enable_mem(forwarding_io_reg_write_enable_mem),
    .io_rd_wb(forwarding_io_rd_wb),
    .io_reg_write_enable_wb(forwarding_io_reg_write_enable_wb),
    .io_reg1_forward_id(forwarding_io_reg1_forward_id),
    .io_reg2_forward_id(forwarding_io_reg2_forward_id),
    .io_reg1_forward_ex(forwarding_io_reg1_forward_ex),
    .io_reg2_forward_ex(forwarding_io_reg2_forward_ex)
  );
  CLINT clint ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_interrupt_flag(clint_io_interrupt_flag),
    .io_instruction(clint_io_instruction),
    .io_instruction_address_if(clint_io_instruction_address_if),
    .io_exception_signal(clint_io_exception_signal),
    .io_instruction_address_cause_exception(clint_io_instruction_address_cause_exception),
    .io_exception_cause(clint_io_exception_cause),
    .io_exception_val(clint_io_exception_val),
    .io_exception_token(clint_io_exception_token),
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
  CSR csr_regs ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
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
    .io_mmu_enable(csr_regs_io_mmu_enable),
    .io_id_reg_data(csr_regs_io_id_reg_data),
    .io_start_paging(csr_regs_io_start_paging),
    .io_clint_csr_mtvec(csr_regs_io_clint_csr_mtvec),
    .io_clint_csr_mepc(csr_regs_io_clint_csr_mepc),
    .io_clint_csr_mstatus(csr_regs_io_clint_csr_mstatus),
    .io_mmu_csr_satp(csr_regs_io_mmu_csr_satp)
  );
  AXI4LiteMaster axi4_master ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
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
  MMU mmu ( // @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
    .clock(mmu_clock),
    .reset(mmu_reset),
    .io_instructions(mmu_io_instructions),
    .io_instructions_address(mmu_io_instructions_address),
    .io_ppn_from_satp(mmu_io_ppn_from_satp),
    .io_virtual_address(mmu_io_virtual_address),
    .io_mmu_occupied_by_mem(mmu_io_mmu_occupied_by_mem),
    .io_restart(mmu_io_restart),
    .io_restart_done(mmu_io_restart_done),
    .io_pa_valid(mmu_io_pa_valid),
    .io_pa(mmu_io_pa),
    .io_page_fault_signals(mmu_io_page_fault_signals),
    .io_va_cause_page_fault(mmu_io_va_cause_page_fault),
    .io_ecause(mmu_io_ecause),
    .io_epc(mmu_io_epc),
    .io_page_fault_responed(mmu_io_page_fault_responed),
    .io_bus_read(mmu_io_bus_read),
    .io_bus_address(mmu_io_bus_address),
    .io_bus_read_data(mmu_io_bus_read_data),
    .io_bus_read_valid(mmu_io_bus_read_valid),
    .io_bus_write(mmu_io_bus_write),
    .io_bus_write_data(mmu_io_bus_write_data),
    .io_bus_write_strobe_0(mmu_io_bus_write_strobe_0),
    .io_bus_write_strobe_1(mmu_io_bus_write_strobe_1),
    .io_bus_write_strobe_2(mmu_io_bus_write_strobe_2),
    .io_bus_write_strobe_3(mmu_io_bus_write_strobe_3),
    .io_bus_write_valid(mmu_io_bus_write_valid),
    .io_bus_granted(mmu_io_bus_granted)
  );
  assign io_axi4_channels_write_address_channel_AWVALID = axi4_master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_write_address_channel_AWADDR = axi4_master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_write_data_channel_WVALID = axi4_master_io_channels_write_data_channel_WVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_write_data_channel_WDATA = axi4_master_io_channels_write_data_channel_WDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_write_data_channel_WSTRB = axi4_master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_write_response_channel_BREADY = axi4_master_io_channels_write_response_channel_BREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_read_address_channel_ARVALID = axi4_master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_read_address_channel_ARADDR = axi4_master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_axi4_channels_read_data_channel_RREADY = axi4_master_io_channels_read_data_channel_RREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign io_bus_address = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_address : _GEN_79; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 146:20]
  assign ctrl_io_jump_flag = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 241:21]
  assign ctrl_io_jump_instruction_id = id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 242:31]
  assign ctrl_io_stall_flag_if = inst_fetch_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 243:25]
  assign ctrl_io_stall_flag_mem = mem_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 244:26]
  assign ctrl_io_stall_flag_clint = clint_io_ctrl_stall_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 245:28]
  assign ctrl_io_stall_flag_bus = io_stall_flag_bus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 246:26]
  assign ctrl_io_rs1_id = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 247:18]
  assign ctrl_io_rs2_id = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 248:18]
  assign ctrl_io_memory_read_enable_ex = id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 249:33]
  assign ctrl_io_rd_ex = id2ex_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 250:17]
  assign ctrl_io_memory_read_enable_mem = ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 251:34]
  assign ctrl_io_rd_mem = ex2mem_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 252:18]
  assign ctrl_io_csr_start_paging = csr_regs_io_start_paging; // @[src/main/scala/riscv/core/fivestage/CPU.scala 253:28]
  assign regs_clock = clock;
  assign regs_reset = reset;
  assign regs_io_write_enable = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 255:24]
  assign regs_io_write_address = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 256:25]
  assign regs_io_write_data = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 257:22]
  assign regs_io_read_address1 = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 258:25]
  assign regs_io_read_address2 = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 259:25]
  assign inst_fetch_clock = clock;
  assign inst_fetch_reset = reset;
  assign inst_fetch_io_stall_flag_ctrl = ctrl_io_pc_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 264:33]
  assign inst_fetch_io_jump_flag_id = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 265:30]
  assign inst_fetch_io_jump_address_id = id_io_if_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 266:33]
  assign inst_fetch_io_physical_address = physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 236:34]
  assign inst_fetch_io_bus_read_data = _inst_fetch_io_bus_read_valid_T_1 ? axi4_master_io_bundle_read_data : 32'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 173:37]
  assign inst_fetch_io_bus_read_valid = _inst_fetch_io_bus_read_valid_T_1 & axi4_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 168:38]
  assign inst_fetch_io_bus_granted = bus_granted == 3'h1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 235:44]
  assign if2id_clock = clock;
  assign if2id_reset = reset;
  assign if2id_io_stall_flag = ctrl_io_if_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 268:23]
  assign if2id_io_flush_enable = ctrl_io_if_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 269:25]
  assign if2id_io_instruction = inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 270:24]
  assign if2id_io_instruction_address = inst_fetch_io_id_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 271:32]
  assign if2id_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 272:27]
  assign id_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 274:21]
  assign id_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 275:29]
  assign id_io_reg1_data = regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 276:19]
  assign id_io_reg2_data = regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 277:19]
  assign id_io_forward_from_mem = mem_io_forward_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 278:26]
  assign id_io_forward_from_wb = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 279:25]
  assign id_io_reg1_forward = forwarding_io_reg1_forward_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 280:22]
  assign id_io_reg2_forward = forwarding_io_reg2_forward_id; // @[src/main/scala/riscv/core/fivestage/CPU.scala 281:22]
  assign id_io_interrupt_assert = clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/fivestage/CPU.scala 282:26]
  assign id_io_interrupt_handler_address = clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 283:35]
  assign id2ex_clock = clock;
  assign id2ex_reset = reset;
  assign id2ex_io_stall_flag = ctrl_io_id_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 285:23]
  assign id2ex_io_flush_enable = ctrl_io_id_flush; // @[src/main/scala/riscv/core/fivestage/CPU.scala 286:25]
  assign id2ex_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 287:24]
  assign id2ex_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 288:32]
  assign id2ex_io_regs_write_enable = id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 289:30]
  assign id2ex_io_regs_write_address = id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 290:31]
  assign id2ex_io_regs_write_source = id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 291:30]
  assign id2ex_io_reg1_data = regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 292:22]
  assign id2ex_io_reg2_data = regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 293:22]
  assign id2ex_io_immediate = id_io_ex_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 294:22]
  assign id2ex_io_aluop1_source = id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 295:26]
  assign id2ex_io_aluop2_source = id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 296:26]
  assign id2ex_io_csr_write_enable = id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 297:29]
  assign id2ex_io_csr_address = id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 298:24]
  assign id2ex_io_memory_read_enable = id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 299:31]
  assign id2ex_io_memory_write_enable = id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 300:32]
  assign id2ex_io_csr_read_data = csr_regs_io_id_reg_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 301:26]
  assign ex_io_instruction = id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 303:21]
  assign ex_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 304:29]
  assign ex_io_reg1_data = id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 305:19]
  assign ex_io_reg2_data = id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 306:19]
  assign ex_io_immediate = id2ex_io_output_immediate; // @[src/main/scala/riscv/core/fivestage/CPU.scala 307:19]
  assign ex_io_aluop1_source = id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 308:23]
  assign ex_io_aluop2_source = id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 309:23]
  assign ex_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 310:23]
  assign ex_io_forward_from_mem = mem_io_forward_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 311:26]
  assign ex_io_forward_from_wb = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 312:25]
  assign ex_io_reg1_forward = forwarding_io_reg1_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 313:22]
  assign ex_io_reg2_forward = forwarding_io_reg2_forward_ex; // @[src/main/scala/riscv/core/fivestage/CPU.scala 314:22]
  assign ex2mem_clock = clock;
  assign ex2mem_reset = reset;
  assign ex2mem_io_stall_flag = ctrl_io_ex_stall; // @[src/main/scala/riscv/core/fivestage/CPU.scala 316:24]
  assign ex2mem_io_regs_write_enable = id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 318:31]
  assign ex2mem_io_regs_write_source = id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 319:31]
  assign ex2mem_io_regs_write_address = {{27'd0}, id2ex_io_output_regs_write_address}; // @[src/main/scala/riscv/core/fivestage/CPU.scala 320:32]
  assign ex2mem_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 321:33]
  assign ex2mem_io_instruction = id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 322:25]
  assign ex2mem_io_reg1_data = id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 323:23]
  assign ex2mem_io_reg2_data = id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 324:23]
  assign ex2mem_io_memory_read_enable = id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 325:32]
  assign ex2mem_io_memory_write_enable = id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 326:33]
  assign ex2mem_io_alu_result = ex_io_mem_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 327:24]
  assign ex2mem_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 328:27]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 330:21]
  assign mem_io_reg2_data = ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 331:20]
  assign mem_io_memory_read_enable = ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 332:29]
  assign mem_io_memory_write_enable = ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 333:30]
  assign mem_io_funct3 = ex2mem_io_output_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 334:48]
  assign mem_io_regs_write_source = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 335:28]
  assign mem_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 336:24]
  assign mem_io_clint_exception_token = clint_io_exception_token; // @[src/main/scala/riscv/core/fivestage/CPU.scala 337:32]
  assign mem_io_physical_address = physical_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 239:27]
  assign mem_io_bus_read_data = _T_18 ? axi4_master_io_bundle_read_data : 32'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 189:30]
  assign mem_io_bus_read_valid = _T_18 & axi4_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 184:31]
  assign mem_io_bus_write_valid = _T_18 & axi4_master_io_bundle_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 194:32]
  assign mem_io_bus_granted = bus_granted == 3'h2; // @[src/main/scala/riscv/core/fivestage/CPU.scala 238:37]
  assign mem2wb_clock = clock;
  assign mem2wb_reset = reset;
  assign mem2wb_io_instruction_address = ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 339:33]
  assign mem2wb_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 340:24]
  assign mem2wb_io_regs_write_enable = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 341:31]
  assign mem2wb_io_regs_write_source = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 342:31]
  assign mem2wb_io_regs_write_address = ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 343:32]
  assign mem2wb_io_memory_read_data = mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 344:30]
  assign mem2wb_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 345:27]
  assign wb_io_instruction_address = mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 347:29]
  assign wb_io_alu_result = mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage/CPU.scala 348:20]
  assign wb_io_memory_read_data = mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 349:26]
  assign wb_io_regs_write_source = mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage/CPU.scala 350:27]
  assign wb_io_csr_read_data = mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 351:23]
  assign forwarding_io_rs1_id = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 353:24]
  assign forwarding_io_rs2_id = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 354:24]
  assign forwarding_io_rs1_ex = id2ex_io_output_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 355:54]
  assign forwarding_io_rs2_ex = id2ex_io_output_instruction[24:20]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 356:54]
  assign forwarding_io_rd_mem = ex2mem_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 357:24]
  assign forwarding_io_reg_write_enable_mem = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 358:38]
  assign forwarding_io_rd_wb = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 359:23]
  assign forwarding_io_reg_write_enable_wb = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 360:37]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_interrupt_flag = if2id_io_output_interrupt_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 370:27]
  assign clint_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 362:24]
  assign clint_io_instruction_address_if = inst_fetch_io_id_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 363:35]
  assign clint_io_exception_signal = mmu_io_page_fault_signals; // @[src/main/scala/riscv/core/fivestage/CPU.scala 372:29]
  assign clint_io_instruction_address_cause_exception = mmu_io_epc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 373:48]
  assign clint_io_exception_cause = mmu_io_ecause; // @[src/main/scala/riscv/core/fivestage/CPU.scala 375:28]
  assign clint_io_exception_val = mmu_io_va_cause_page_fault; // @[src/main/scala/riscv/core/fivestage/CPU.scala 374:26]
  assign clint_io_jump_flag = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage/CPU.scala 364:22]
  assign clint_io_jump_address = id_io_clint_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 365:25]
  assign clint_io_csr_mtvec = csr_regs_io_clint_csr_mtvec; // @[src/main/scala/riscv/core/fivestage/CPU.scala 367:22]
  assign clint_io_csr_mepc = csr_regs_io_clint_csr_mepc; // @[src/main/scala/riscv/core/fivestage/CPU.scala 366:21]
  assign clint_io_csr_mstatus = csr_regs_io_clint_csr_mstatus; // @[src/main/scala/riscv/core/fivestage/CPU.scala 368:24]
  assign clint_io_interrupt_enable = csr_regs_io_interrupt_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 369:29]
  assign csr_regs_clock = clock;
  assign csr_regs_reset = reset;
  assign csr_regs_io_reg_write_enable_ex = id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 377:35]
  assign csr_regs_io_reg_read_address_id = id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 380:35]
  assign csr_regs_io_reg_write_address_ex = id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 378:36]
  assign csr_regs_io_reg_write_data_ex = ex_io_csr_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 379:33]
  assign csr_regs_io_reg_write_enable_clint = clint_io_csr_reg_write_enable; // @[src/main/scala/riscv/core/fivestage/CPU.scala 381:38]
  assign csr_regs_io_reg_write_address_clint = clint_io_csr_reg_write_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 382:39]
  assign csr_regs_io_reg_write_data_clint = clint_io_csr_reg_write_data; // @[src/main/scala/riscv/core/fivestage/CPU.scala 383:36]
  assign axi4_master_clock = clock;
  assign axi4_master_reset = reset;
  assign axi4_master_io_channels_write_address_channel_AWREADY = io_axi4_channels_write_address_channel_AWREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign axi4_master_io_channels_write_data_channel_WREADY = io_axi4_channels_write_data_channel_WREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign axi4_master_io_channels_write_response_channel_BVALID = io_axi4_channels_write_response_channel_BVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign axi4_master_io_channels_read_address_channel_ARREADY = io_axi4_channels_read_address_channel_ARREADY; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign axi4_master_io_channels_read_data_channel_RVALID = io_axi4_channels_read_data_channel_RVALID; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign axi4_master_io_channels_read_data_channel_RDATA = io_axi4_channels_read_data_channel_RDATA; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign axi4_master_io_channels_read_data_channel_RRESP = 2'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
  assign axi4_master_io_bundle_read = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_read : _GEN_80; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 147:32]
  assign axi4_master_io_bundle_write = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_write : _GEN_81; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 149:33]
  assign axi4_master_io_bundle_write_data = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_write_data : _GEN_82; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 150:38]
  assign axi4_master_io_bundle_write_strobe_0 = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_write_strobe_0 :
    _GEN_83; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 151:40]
  assign axi4_master_io_bundle_write_strobe_1 = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_write_strobe_1 :
    _GEN_84; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 151:40]
  assign axi4_master_io_bundle_write_strobe_2 = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_write_strobe_2 :
    _GEN_85; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 151:40]
  assign axi4_master_io_bundle_write_strobe_3 = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_write_strobe_3 :
    _GEN_86; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 151:40]
  assign axi4_master_io_bundle_address = bus_granted == 3'h4 | bus_granted == 3'h3 ? mmu_io_bus_address : _GEN_79; // @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97 146:20]
  assign mmu_clock = clock;
  assign mmu_reset = reset;
  assign mmu_io_instructions = ex2mem_io_output_instruction; // @[src/main/scala/riscv/core/fivestage/CPU.scala 225:23]
  assign mmu_io_instructions_address = ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 226:31]
  assign mmu_io_ppn_from_satp = csr_regs_io_mmu_csr_satp[19:0]; // @[src/main/scala/riscv/core/fivestage/CPU.scala 230:24]
  assign mmu_io_virtual_address = virtual_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 227:26]
  assign mmu_io_mmu_occupied_by_mem = bus_granted == 3'h3; // @[src/main/scala/riscv/core/fivestage/CPU.scala 232:45]
  assign mmu_io_restart = mmu_restart; // @[src/main/scala/riscv/core/fivestage/CPU.scala 233:18]
  assign mmu_io_page_fault_responed = clint_io_exception_token; // @[src/main/scala/riscv/core/fivestage/CPU.scala 231:30]
  assign mmu_io_bus_read_data = _T_17 ? axi4_master_io_bundle_read_data : 32'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 209:30]
  assign mmu_io_bus_read_valid = _T_17 & axi4_master_io_bundle_read_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 204:31]
  assign mmu_io_bus_write_valid = _T_17 & axi4_master_io_bundle_write_valid; // @[src/main/scala/riscv/core/fivestage/CPU.scala 214:32]
  assign mmu_io_bus_granted = _T_16 | _T_15; // @[src/main/scala/riscv/core/fivestage/CPU.scala 228:68]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 58:28]
      bus_granted <= 3'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 58:28]
    end else if (mem_access_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 66:50]
      if (~axi4_master_io_bundle_busy & ~axi4_master_io_bundle_read_valid) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 68:76]
        if (csr_regs_io_mmu_enable) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 69:36]
          bus_granted <= _GEN_4;
        end else begin
          bus_granted <= {{1'd0}, _GEN_11};
        end
      end else begin
        bus_granted <= 3'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 67:17]
      end
    end else if (mem_access_state == 3'h2) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 91:73]
      if (clint_io_exception_token) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 92:36]
        bus_granted <= 3'h4; // @[src/main/scala/riscv/core/fivestage/CPU.scala 94:19]
      end else begin
        bus_granted <= _GEN_21;
      end
    end else if (mem_access_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 101:72]
      bus_granted <= _GEN_49;
    end else begin
      bus_granted <= _GEN_60;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 59:33]
      mem_access_state <= 3'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 59:33]
    end else if (mem_access_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 66:50]
      if (~axi4_master_io_bundle_busy & ~axi4_master_io_bundle_read_valid) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 68:76]
        if (csr_regs_io_mmu_enable) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 69:36]
          mem_access_state <= _GEN_3;
        end else begin
          mem_access_state <= _GEN_9;
        end
      end
    end else if (mem_access_state == 3'h2) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 91:73]
      if (clint_io_exception_token) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 92:36]
        mem_access_state <= 3'h1; // @[src/main/scala/riscv/core/fivestage/CPU.scala 93:24]
      end else begin
        mem_access_state <= _GEN_20;
      end
    end else if (mem_access_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 101:72]
      mem_access_state <= _GEN_48;
    end else begin
      mem_access_state <= _GEN_59;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 60:32]
      virtual_address <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 60:32]
    end else if (mem_access_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 66:50]
      if (~axi4_master_io_bundle_busy & ~axi4_master_io_bundle_read_valid) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 68:76]
        if (csr_regs_io_mmu_enable) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 69:36]
          virtual_address <= _GEN_5;
        end
      end
    end else if (mem_access_state == 3'h2) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 91:73]
      if (clint_io_exception_token) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 92:36]
        virtual_address <= id_io_if_jump_address; // @[src/main/scala/riscv/core/fivestage/CPU.scala 95:23]
      end
    end else if (mem_access_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 101:72]
      virtual_address <= _GEN_50;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 61:33]
      physical_address <= 32'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 61:33]
    end else if (mem_access_state == 3'h0) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 66:50]
      if (~axi4_master_io_bundle_busy & ~axi4_master_io_bundle_read_valid) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 68:76]
        if (!(csr_regs_io_mmu_enable)) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 69:36]
          physical_address <= _GEN_10;
        end
      end
    end else if (mem_access_state == 3'h2) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 91:73]
      if (!(clint_io_exception_token)) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 92:36]
        physical_address <= _GEN_22;
      end
    end else if (mem_access_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 101:72]
      physical_address <= _GEN_52;
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 62:28]
      mmu_restart <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 62:28]
    end else if (!(mem_access_state == 3'h0)) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 66:50]
      if (!(mem_access_state == 3'h2)) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 91:73]
        if (mem_access_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 101:72]
          mmu_restart <= _GEN_47;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 63:24]
      pending <= 1'h0; // @[src/main/scala/riscv/core/fivestage/CPU.scala 63:24]
    end else if (!(mem_access_state == 3'h0)) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 66:50]
      if (!(mem_access_state == 3'h2)) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 91:73]
        if (mem_access_state == 3'h1) begin // @[src/main/scala/riscv/core/fivestage/CPU.scala 101:72]
          pending <= _GEN_51;
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
  bus_granted = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  mem_access_state = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  virtual_address = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  physical_address = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mmu_restart = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  pending = _RAND_5[0:0];
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
  wire [31:0] _slave_io_bundle_read_data_T_1 = 8'h4 == slave_io_bundle_address ? limit : 32'h0; // @[src/main/scala/peripheral/Timer.scala 42:73]
  wire [31:0] _slave_io_bundle_read_data_T_3 = 8'h8 == slave_io_bundle_address ? {{31'd0}, enabled} :
    _slave_io_bundle_read_data_T_1; // @[src/main/scala/peripheral/Timer.scala 42:73]
  wire  _GEN_1 = slave_io_bundle_address == 8'h8 ? slave_io_bundle_write_data != 32'h0 : enabled; // @[src/main/scala/peripheral/Timer.scala 53:51 54:15 36:24]
  wire  _GEN_4 = slave_io_bundle_address == 8'h4 ? enabled : _GEN_1; // @[src/main/scala/peripheral/Timer.scala 36:24 50:45]
  wire  _GEN_7 = slave_io_bundle_write ? _GEN_4 : enabled; // @[src/main/scala/peripheral/Timer.scala 36:24 49:31]
  wire [31:0] _io_signal_interrupt_T_1 = limit - 32'ha; // @[src/main/scala/peripheral/Timer.scala 58:54]
  wire [31:0] _count_T_1 = count + 32'h1; // @[src/main/scala/peripheral/Timer.scala 63:20]
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
  assign io_signal_interrupt = enabled & count >= _io_signal_interrupt_T_1; // @[src/main/scala/peripheral/Timer.scala 58:34]
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
    end else if (count >= limit) begin // @[src/main/scala/peripheral/Timer.scala 60:24]
      count <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 61:11]
    end else begin
      count <= _count_T_1; // @[src/main/scala/peripheral/Timer.scala 63:11]
    end
    if (reset) begin // @[src/main/scala/peripheral/Timer.scala 34:22]
      limit <= 32'h5f5e100; // @[src/main/scala/peripheral/Timer.scala 34:22]
    end else if (slave_io_bundle_write) begin // @[src/main/scala/peripheral/Timer.scala 49:31]
      if (slave_io_bundle_address == 8'h4) begin // @[src/main/scala/peripheral/Timer.scala 50:45]
        limit <= slave_io_bundle_write_data; // @[src/main/scala/peripheral/Timer.scala 51:13]
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
  $readmemh("/workspaces/2023-fall-yatcpu-repo/mini-yatcpu/verilog/say_goodbye.asmbin.txt", mem);
end
endmodule
module ROMLoader(
  input         clock,
  input         reset,
  output        io_channels_write_address_channel_AWVALID, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input         io_channels_write_address_channel_AWREADY, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output [31:0] io_channels_write_address_channel_AWADDR, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output        io_channels_write_data_channel_WVALID, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input         io_channels_write_data_channel_WREADY, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output [31:0] io_channels_write_data_channel_WDATA, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output [3:0]  io_channels_write_data_channel_WSTRB, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input         io_channels_write_response_channel_BVALID, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output        io_channels_write_response_channel_BREADY, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output        io_channels_read_address_channel_ARVALID, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input         io_channels_read_address_channel_ARREADY, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output [31:0] io_channels_read_address_channel_ARADDR, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input         io_channels_read_data_channel_RVALID, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output        io_channels_read_data_channel_RREADY, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input  [31:0] io_channels_read_data_channel_RDATA, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output [31:0] io_rom_address, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input  [31:0] io_rom_data, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  input         io_load_start, // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
  output        io_load_finished // @[src/main/scala/peripheral/ROMLoader.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  master_clock; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_reset; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [31:0] master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [31:0] master_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [3:0] master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [31:0] master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [31:0] master_io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [1:0] master_io_channels_read_data_channel_RRESP; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_read; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_write; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [31:0] master_io_bundle_read_data; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [31:0] master_io_bundle_write_data; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_write_strobe_0; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_write_strobe_1; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_write_strobe_2; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_write_strobe_3; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [31:0] master_io_bundle_address; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_busy; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_read_valid; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire  master_io_bundle_write_valid; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  reg [31:0] address; // @[src/main/scala/peripheral/ROMLoader.scala 35:24]
  reg  valid; // @[src/main/scala/peripheral/ROMLoader.scala 36:22]
  reg  loading; // @[src/main/scala/peripheral/ROMLoader.scala 37:24]
  wire  _GEN_1 = io_load_start | loading; // @[src/main/scala/peripheral/ROMLoader.scala 42:23 44:13 37:24]
  wire [31:0] _GEN_2 = io_load_start ? 32'h0 : address; // @[src/main/scala/peripheral/ROMLoader.scala 42:23 45:13 35:24]
  wire  _T_1 = ~master_io_bundle_busy; // @[src/main/scala/peripheral/ROMLoader.scala 53:20]
  wire  _T_3 = address >= 32'h41a; // @[src/main/scala/peripheral/ROMLoader.scala 53:54]
  wire [33:0] _GEN_34 = {address, 2'h0}; // @[src/main/scala/peripheral/ROMLoader.scala 63:46]
  wire [34:0] _master_io_bundle_address_T = {{1'd0}, _GEN_34}; // @[src/main/scala/peripheral/ROMLoader.scala 63:46]
  wire [34:0] _master_io_bundle_address_T_2 = _master_io_bundle_address_T + 35'h1000; // @[src/main/scala/peripheral/ROMLoader.scala 63:61]
  wire [31:0] _GEN_5 = valid ? io_rom_data : 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 59:19 49:31 61:37]
  wire [34:0] _GEN_10 = valid ? _master_io_bundle_address_T_2 : 35'h0; // @[src/main/scala/peripheral/ROMLoader.scala 59:19 51:28 63:34]
  wire  _GEN_11 = _T_1 & ~master_io_bundle_write_valid & valid; // @[src/main/scala/peripheral/ROMLoader.scala 48:26 58:67]
  wire [31:0] _GEN_12 = _T_1 & ~master_io_bundle_write_valid ? _GEN_5 : 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 49:31 58:67]
  wire [34:0] _GEN_17 = _T_1 & ~master_io_bundle_write_valid ? _GEN_10 : 35'h0; // @[src/main/scala/peripheral/ROMLoader.scala 51:28 58:67]
  wire [31:0] _address_T_1 = address + 32'h1; // @[src/main/scala/peripheral/ROMLoader.scala 71:28]
  wire [34:0] _GEN_31 = loading ? _GEN_17 : 35'h0; // @[src/main/scala/peripheral/ROMLoader.scala 56:17 51:28]
  AXI4LiteMaster master ( // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
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
  assign io_channels_write_address_channel_AWVALID = master_io_channels_write_address_channel_AWVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_write_address_channel_AWADDR = master_io_channels_write_address_channel_AWADDR; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_write_data_channel_WVALID = master_io_channels_write_data_channel_WVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_write_data_channel_WDATA = master_io_channels_write_data_channel_WDATA; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_write_data_channel_WSTRB = master_io_channels_write_data_channel_WSTRB; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_write_response_channel_BREADY = master_io_channels_write_response_channel_BREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_read_address_channel_ARVALID = master_io_channels_read_address_channel_ARVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_read_address_channel_ARADDR = master_io_channels_read_address_channel_ARADDR; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_channels_read_data_channel_RREADY = master_io_channels_read_data_channel_RREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign io_rom_address = address; // @[src/main/scala/peripheral/ROMLoader.scala 78:18]
  assign io_load_finished = ~loading & ~master_io_bundle_busy & address >= 32'h41a; // @[src/main/scala/peripheral/ROMLoader.scala 53:43]
  assign master_clock = clock;
  assign master_reset = reset;
  assign master_io_channels_write_address_channel_AWREADY = io_channels_write_address_channel_AWREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign master_io_channels_write_data_channel_WREADY = io_channels_write_data_channel_WREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign master_io_channels_write_response_channel_BVALID = io_channels_write_response_channel_BVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign master_io_channels_read_address_channel_ARREADY = io_channels_read_address_channel_ARREADY; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign master_io_channels_read_data_channel_RVALID = io_channels_read_data_channel_RVALID; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign master_io_channels_read_data_channel_RDATA = io_channels_read_data_channel_RDATA; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign master_io_channels_read_data_channel_RRESP = 2'h0; // @[src/main/scala/peripheral/ROMLoader.scala 33:22]
  assign master_io_bundle_read = 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 39:25]
  assign master_io_bundle_write = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 56:17 48:26]
  assign master_io_bundle_write_data = loading ? _GEN_12 : 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 56:17 49:31]
  assign master_io_bundle_write_strobe_0 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 56:17 50:33]
  assign master_io_bundle_write_strobe_1 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 56:17 50:33]
  assign master_io_bundle_write_strobe_2 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 56:17 50:33]
  assign master_io_bundle_write_strobe_3 = loading & _GEN_11; // @[src/main/scala/peripheral/ROMLoader.scala 56:17 50:33]
  assign master_io_bundle_address = _GEN_31[31:0];
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 35:24]
      address <= 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 35:24]
    end else if (loading) begin // @[src/main/scala/peripheral/ROMLoader.scala 56:17]
      if (master_io_bundle_write_valid) begin // @[src/main/scala/peripheral/ROMLoader.scala 66:40]
        if (_T_3) begin // @[src/main/scala/peripheral/ROMLoader.scala 67:41]
          address <= _GEN_2;
        end else begin
          address <= _address_T_1; // @[src/main/scala/peripheral/ROMLoader.scala 71:17]
        end
      end
    end else begin
      address <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 36:22]
      valid <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 36:22]
    end else if (loading) begin // @[src/main/scala/peripheral/ROMLoader.scala 56:17]
      if (master_io_bundle_write_valid) begin // @[src/main/scala/peripheral/ROMLoader.scala 66:40]
        valid <= _T_3;
      end else begin
        valid <= 1'h1; // @[src/main/scala/peripheral/ROMLoader.scala 57:11]
      end
    end else if (io_load_start) begin // @[src/main/scala/peripheral/ROMLoader.scala 42:23]
      valid <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 43:11]
    end
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 37:24]
      loading <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 37:24]
    end else if (loading) begin // @[src/main/scala/peripheral/ROMLoader.scala 56:17]
      if (master_io_bundle_write_valid) begin // @[src/main/scala/peripheral/ROMLoader.scala 66:40]
        if (_T_3) begin // @[src/main/scala/peripheral/ROMLoader.scala 67:41]
          loading <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 68:17]
        end else begin
          loading <= 1'h1; // @[src/main/scala/peripheral/ROMLoader.scala 70:17]
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
