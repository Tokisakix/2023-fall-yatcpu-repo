FIRRTL version 1.2.0
circuit Top :
  module AXI4LiteSlave :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { read : UInt<1>, write : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], address : UInt<8>}} @[src/main/scala/bus/AXI4Lite.scala 121:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 125:22]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 126:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 127:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 128:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 129:18]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 130:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 131:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 132:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 133:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 134:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 135:26]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 138:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 139:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 140:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 141:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 142:39]
    io.channels.read_data_channel.RDATA <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 144:39]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 147:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 149:41]
    write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 150:14]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 152:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 153:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 154:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 158:12]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 159:13]
      RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 160:14]
      BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 161:14]
      when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 162:55]
        state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 163:15]
      else :
        when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 164:60]
          state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 165:15]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 169:15]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 170:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 170:65]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 171:15]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 172:14]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 173:14]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 174:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
          RVALID <= io.bundle.read_valid @[src/main/scala/bus/AXI4Lite.scala 178:14]
          node _T_10 = and(io.channels.read_data_channel.RREADY, RVALID) @[src/main/scala/bus/AXI4Lite.scala 179:49]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 179:60]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 180:15]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 181:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
            AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 185:15]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 186:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 186:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 187:14]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 188:15]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 193:14]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 194:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 194:61]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 195:15]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 196:20]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                write_strobe[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:15]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 199:16]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 203:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 204:14]
                node _T_26 = and(io.channels.write_response_channel.BREADY, BVALID) @[src/main/scala/bus/AXI4Lite.scala 205:54]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 205:65]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 206:15]
                  write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 207:15]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:16]


  module Tx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 32:14]

    reg shiftReg : UInt, clock with :
      reset => (reset, UInt<11>("h7ff")) @[src/main/scala/peripheral/UART.scala 40:25]
    reg cntReg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[src/main/scala/peripheral/UART.scala 41:23]
    reg bitsReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/peripheral/UART.scala 42:24]
    node _io_channel_ready_T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 44:31]
    node _io_channel_ready_T_1 = eq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 44:52]
    node _io_channel_ready_T_2 = and(_io_channel_ready_T, _io_channel_ready_T_1) @[src/main/scala/peripheral/UART.scala 44:40]
    io.channel.ready <= _io_channel_ready_T_2 @[src/main/scala/peripheral/UART.scala 44:20]
    node _io_txd_T = bits(shiftReg, 0, 0) @[src/main/scala/peripheral/UART.scala 45:21]
    io.txd <= _io_txd_T @[src/main/scala/peripheral/UART.scala 45:10]
    node _T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 47:15]
    when _T : @[src/main/scala/peripheral/UART.scala 47:24]
      cntReg <= UInt<11>("h43c") @[src/main/scala/peripheral/UART.scala 49:12]
      node _T_1 = neq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 50:18]
      when _T_1 : @[src/main/scala/peripheral/UART.scala 50:27]
        node shift = shr(shiftReg, 1) @[src/main/scala/peripheral/UART.scala 51:28]
        node _shiftReg_T = bits(shift, 9, 0) @[src/main/scala/peripheral/UART.scala 52:33]
        node _shiftReg_T_1 = cat(UInt<1>("h1"), _shiftReg_T) @[src/main/scala/peripheral/UART.scala 52:22]
        shiftReg <= _shiftReg_T_1 @[src/main/scala/peripheral/UART.scala 52:16]
        node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 53:26]
        node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[src/main/scala/peripheral/UART.scala 53:26]
        bitsReg <= _bitsReg_T_1 @[src/main/scala/peripheral/UART.scala 53:15]
      else :
        when io.channel.valid : @[src/main/scala/peripheral/UART.scala 55:30]
          node _shiftReg_T_2 = cat(UInt<2>("h3"), io.channel.bits) @[src/main/scala/peripheral/UART.scala 56:28]
          node _shiftReg_T_3 = cat(_shiftReg_T_2, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 56:24]
          shiftReg <= _shiftReg_T_3 @[src/main/scala/peripheral/UART.scala 56:18]
          bitsReg <= UInt<4>("hb") @[src/main/scala/peripheral/UART.scala 57:17]
        else :
          shiftReg <= UInt<11>("h7ff") @[src/main/scala/peripheral/UART.scala 59:18]
    else :
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 64:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/peripheral/UART.scala 64:22]
      cntReg <= _cntReg_T_1 @[src/main/scala/peripheral/UART.scala 64:12]


  module Buffer :
    input clock : Clock
    input reset : Reset
    output io : { flip in : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, out : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 121:14]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 127:25]
    reg dataReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/peripheral/UART.scala 128:24]
    node _io_in_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 130:27]
    io.in.ready <= _io_in_ready_T @[src/main/scala/peripheral/UART.scala 130:15]
    node _io_out_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 131:28]
    io.out.valid <= _io_out_valid_T @[src/main/scala/peripheral/UART.scala 131:16]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 133:17]
    when _T : @[src/main/scala/peripheral/UART.scala 133:28]
      when io.in.valid : @[src/main/scala/peripheral/UART.scala 134:23]
        dataReg <= io.in.bits @[src/main/scala/peripheral/UART.scala 135:15]
        stateReg <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 136:16]
    else :
      when io.out.ready : @[src/main/scala/peripheral/UART.scala 139:24]
        stateReg <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 140:16]
    io.out.bits <= dataReg @[src/main/scala/peripheral/UART.scala 143:15]

  module BufferedTx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 150:14]

    inst tx of Tx @[src/main/scala/peripheral/UART.scala 155:18]
    tx.clock <= clock
    tx.reset <= reset
    inst buf of Buffer @[src/main/scala/peripheral/UART.scala 156:19]
    buf.clock <= clock
    buf.reset <= reset
    buf.io.in <= io.channel @[src/main/scala/peripheral/UART.scala 158:13]
    tx.io.channel <= buf.io.out @[src/main/scala/peripheral/UART.scala 159:17]
    io.txd <= tx.io.txd @[src/main/scala/peripheral/UART.scala 160:10]

  module Rx :
    input clock : Clock
    input reset : Reset
    output io : { flip rxd : UInt<1>, channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 77:14]

    reg rxReg_REG : UInt, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 87:30]
    rxReg_REG <= io.rxd @[src/main/scala/peripheral/UART.scala 87:30]
    reg rxReg : UInt, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 87:22]
    rxReg <= rxReg_REG @[src/main/scala/peripheral/UART.scala 87:22]
    reg shiftReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/peripheral/UART.scala 89:25]
    reg cntReg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[src/main/scala/peripheral/UART.scala 90:23]
    reg bitsReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/peripheral/UART.scala 91:24]
    reg valReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 92:23]
    node _T = neq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 94:15]
    when _T : @[src/main/scala/peripheral/UART.scala 94:24]
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 95:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/peripheral/UART.scala 95:22]
      cntReg <= _cntReg_T_1 @[src/main/scala/peripheral/UART.scala 95:12]
    else :
      node _T_1 = neq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 96:22]
      when _T_1 : @[src/main/scala/peripheral/UART.scala 96:31]
        cntReg <= UInt<11>("h43c") @[src/main/scala/peripheral/UART.scala 97:12]
        node _shiftReg_T = shr(shiftReg, 1) @[src/main/scala/peripheral/UART.scala 98:37]
        node _shiftReg_T_1 = cat(rxReg, _shiftReg_T) @[src/main/scala/peripheral/UART.scala 98:20]
        shiftReg <= _shiftReg_T_1 @[src/main/scala/peripheral/UART.scala 98:14]
        node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 99:24]
        node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[src/main/scala/peripheral/UART.scala 99:24]
        bitsReg <= _bitsReg_T_1 @[src/main/scala/peripheral/UART.scala 99:13]
        node _T_2 = eq(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 101:18]
        when _T_2 : @[src/main/scala/peripheral/UART.scala 101:27]
          valReg <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 102:14]
      else :
        node _T_3 = eq(rxReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 104:20]
        when _T_3 : @[src/main/scala/peripheral/UART.scala 104:29]
          cntReg <= UInt<11>("h65b") @[src/main/scala/peripheral/UART.scala 105:12]
          bitsReg <= UInt<4>("h8") @[src/main/scala/peripheral/UART.scala 106:13]
    node _T_4 = and(valReg, io.channel.ready) @[src/main/scala/peripheral/UART.scala 109:15]
    when _T_4 : @[src/main/scala/peripheral/UART.scala 109:36]
      valReg <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 110:12]
    io.channel.bits <= shiftReg @[src/main/scala/peripheral/UART.scala 113:19]
    io.channel.valid <= valReg @[src/main/scala/peripheral/UART.scala 114:20]

  module Uart :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, flip rxd : UInt<1>, txd : UInt<1>, signal_interrupt : UInt<1>} @[src/main/scala/peripheral/UART.scala 164:14]

    reg interrupt : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 171:26]
    reg rxData : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 172:23]
    inst slave of AXI4LiteSlave @[src/main/scala/peripheral/UART.scala 173:21]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/UART.scala 174:21]
    inst tx of BufferedTx @[src/main/scala/peripheral/UART.scala 176:18]
    tx.clock <= clock
    tx.reset <= reset
    inst rx of Rx @[src/main/scala/peripheral/UART.scala 177:18]
    rx.clock <= clock
    rx.reset <= reset
    slave.io.bundle.read_data <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 179:29]
    slave.io.bundle.read_valid <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 180:30]
    when slave.io.bundle.read : @[src/main/scala/peripheral/UART.scala 181:30]
      node _T = eq(slave.io.bundle.address, UInt<3>("h4")) @[src/main/scala/peripheral/UART.scala 182:34]
      when _T : @[src/main/scala/peripheral/UART.scala 182:45]
        slave.io.bundle.read_data <= UInt<17>("h1c200") @[src/main/scala/peripheral/UART.scala 183:33]
      else :
        node _T_1 = eq(slave.io.bundle.address, UInt<4>("hc")) @[src/main/scala/peripheral/UART.scala 184:40]
        when _T_1 : @[src/main/scala/peripheral/UART.scala 184:51]
          slave.io.bundle.read_data <= rxData @[src/main/scala/peripheral/UART.scala 185:33]
          interrupt <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 186:17]
    tx.io.channel.valid <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 190:23]
    tx.io.channel.bits <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 191:22]
    when slave.io.bundle.write : @[src/main/scala/peripheral/UART.scala 192:31]
      node _T_2 = eq(slave.io.bundle.address, UInt<4>("h8")) @[src/main/scala/peripheral/UART.scala 193:34]
      when _T_2 : @[src/main/scala/peripheral/UART.scala 193:45]
        node _interrupt_T = neq(slave.io.bundle.write_data, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 194:47]
        interrupt <= _interrupt_T @[src/main/scala/peripheral/UART.scala 194:17]
      else :
        node _T_3 = eq(slave.io.bundle.address, UInt<5>("h10")) @[src/main/scala/peripheral/UART.scala 195:40]
        when _T_3 : @[src/main/scala/peripheral/UART.scala 195:52]
          tx.io.channel.valid <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 196:27]
          tx.io.channel.bits <= slave.io.bundle.write_data @[src/main/scala/peripheral/UART.scala 197:26]
    io.txd <= tx.io.txd @[src/main/scala/peripheral/UART.scala 201:10]
    rx.io.rxd <= io.rxd @[src/main/scala/peripheral/UART.scala 202:13]
    io.signal_interrupt <= interrupt @[src/main/scala/peripheral/UART.scala 204:23]
    rx.io.channel.ready <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 205:23]
    when rx.io.channel.valid : @[src/main/scala/peripheral/UART.scala 206:29]
      rx.io.channel.ready <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 207:25]
      rxData <= rx.io.channel.bits @[src/main/scala/peripheral/UART.scala 208:12]
      interrupt <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 209:15]


  module Control :
    input clock : Clock
    input reset : Reset
    output io : { flip jump_flag : UInt<1>, flip jump_instruction_id : UInt<1>, flip stall_flag_if : UInt<1>, flip stall_flag_mem : UInt<1>, flip stall_flag_clint : UInt<1>, flip stall_flag_bus : UInt<1>, flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip memory_read_enable_ex : UInt<1>, flip rd_ex : UInt<5>, flip memory_read_enable_mem : UInt<1>, flip rd_mem : UInt<5>, flip csr_start_paging : UInt<1>, if_flush : UInt<1>, id_flush : UInt<1>, pc_stall : UInt<1>, if_stall : UInt<1>, id_stall : UInt<1>, ex_stall : UInt<1>} @[src/main/scala/riscv/core/fivestage/Control.scala 21:14]

    node _id_hazard_T = or(io.memory_read_enable_ex, io.jump_instruction_id) @[src/main/scala/riscv/core/fivestage/Control.scala 44:45]
    node _id_hazard_T_1 = neq(io.rd_ex, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Control.scala 44:84]
    node _id_hazard_T_2 = and(_id_hazard_T, _id_hazard_T_1) @[src/main/scala/riscv/core/fivestage/Control.scala 44:72]
    node _id_hazard_T_3 = eq(io.rd_ex, io.rs1_id) @[src/main/scala/riscv/core/fivestage/Control.scala 44:105]
    node _id_hazard_T_4 = eq(io.rd_ex, io.rs2_id) @[src/main/scala/riscv/core/fivestage/Control.scala 45:17]
    node _id_hazard_T_5 = or(_id_hazard_T_3, _id_hazard_T_4) @[src/main/scala/riscv/core/fivestage/Control.scala 45:5]
    node _id_hazard_T_6 = and(_id_hazard_T_2, _id_hazard_T_5) @[src/main/scala/riscv/core/fivestage/Control.scala 44:92]
    node _id_hazard_T_7 = and(io.jump_instruction_id, io.memory_read_enable_mem) @[src/main/scala/riscv/core/fivestage/Control.scala 46:28]
    node _id_hazard_T_8 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Control.scala 46:70]
    node _id_hazard_T_9 = and(_id_hazard_T_7, _id_hazard_T_8) @[src/main/scala/riscv/core/fivestage/Control.scala 46:57]
    node _id_hazard_T_10 = eq(io.rd_mem, io.rs1_id) @[src/main/scala/riscv/core/fivestage/Control.scala 46:92]
    node _id_hazard_T_11 = eq(io.rd_mem, io.rs2_id) @[src/main/scala/riscv/core/fivestage/Control.scala 47:7]
    node _id_hazard_T_12 = or(_id_hazard_T_10, _id_hazard_T_11) @[src/main/scala/riscv/core/fivestage/Control.scala 46:106]
    node _id_hazard_T_13 = and(_id_hazard_T_9, _id_hazard_T_12) @[src/main/scala/riscv/core/fivestage/Control.scala 46:78]
    node id_hazard = or(_id_hazard_T_6, _id_hazard_T_13) @[src/main/scala/riscv/core/fivestage/Control.scala 45:32]
    node _io_if_flush_T = eq(id_hazard, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Control.scala 48:34]
    node _io_if_flush_T_1 = and(io.jump_flag, _io_if_flush_T) @[src/main/scala/riscv/core/fivestage/Control.scala 48:31]
    node _io_if_flush_T_2 = or(_io_if_flush_T_1, io.csr_start_paging) @[src/main/scala/riscv/core/fivestage/Control.scala 48:45]
    io.if_flush <= _io_if_flush_T_2 @[src/main/scala/riscv/core/fivestage/Control.scala 48:15]
    node _io_id_flush_T = or(id_hazard, io.csr_start_paging) @[src/main/scala/riscv/core/fivestage/Control.scala 49:28]
    io.id_flush <= _io_id_flush_T @[src/main/scala/riscv/core/fivestage/Control.scala 49:15]
    node _io_pc_stall_T = or(io.stall_flag_mem, io.stall_flag_clint) @[src/main/scala/riscv/core/fivestage/Control.scala 51:36]
    node _io_pc_stall_T_1 = or(_io_pc_stall_T, id_hazard) @[src/main/scala/riscv/core/fivestage/Control.scala 51:59]
    node _io_pc_stall_T_2 = or(_io_pc_stall_T_1, io.stall_flag_bus) @[src/main/scala/riscv/core/fivestage/Control.scala 51:72]
    node _io_pc_stall_T_3 = or(_io_pc_stall_T_2, io.stall_flag_if) @[src/main/scala/riscv/core/fivestage/Control.scala 51:93]
    io.pc_stall <= _io_pc_stall_T_3 @[src/main/scala/riscv/core/fivestage/Control.scala 51:15]
    node _io_if_stall_T = or(io.stall_flag_mem, io.stall_flag_clint) @[src/main/scala/riscv/core/fivestage/Control.scala 52:36]
    node _io_if_stall_T_1 = or(_io_if_stall_T, id_hazard) @[src/main/scala/riscv/core/fivestage/Control.scala 52:59]
    io.if_stall <= _io_if_stall_T_1 @[src/main/scala/riscv/core/fivestage/Control.scala 52:15]
    node _io_id_stall_T = or(io.stall_flag_mem, io.stall_flag_clint) @[src/main/scala/riscv/core/fivestage/Control.scala 53:36]
    io.id_stall <= _io_id_stall_T @[src/main/scala/riscv/core/fivestage/Control.scala 53:15]
    node _io_ex_stall_T = or(io.stall_flag_mem, io.stall_flag_clint) @[src/main/scala/riscv/core/fivestage/Control.scala 54:36]
    io.ex_stall <= _io_ex_stall_T @[src/main/scala/riscv/core/fivestage/Control.scala 54:15]

  module RegisterFile :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip write_address : UInt<5>, flip write_data : UInt<32>, flip read_address1 : UInt<5>, flip read_address2 : UInt<5>, read_data1 : UInt<32>, read_data2 : UInt<32>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 33:14]

    reg registers : UInt<32>[32], clock with :
      reset => (UInt<1>("h0"), registers) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 46:22]
    node _T = asUInt(reset) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:15]
    node _T_1 = eq(_T, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:8]
    when _T_1 : @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 48:23]
      node _T_2 = neq(io.write_address, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:46]
      node _T_3 = and(io.write_enable, _T_2) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:26]
      when _T_3 : @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 49:55]
        registers[io.write_address] <= io.write_data @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 50:35]
    node _io_read_data1_T = eq(io.read_address1, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 57:25]
    node _io_read_data1_T_1 = eq(io.read_address1, io.write_address) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 58:25]
    node _io_read_data1_T_2 = and(_io_read_data1_T_1, io.write_enable) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 58:46]
    node _io_read_data1_T_3 = mux(_io_read_data1_T_2, io.write_data, registers[io.read_address1]) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _io_read_data1_T_4 = mux(_io_read_data1_T, UInt<1>("h0"), _io_read_data1_T_3) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    io.read_data1 <= _io_read_data1_T_4 @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 54:17]
    node _io_read_data2_T = eq(io.read_address2, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 65:25]
    node _io_read_data2_T_1 = eq(io.read_address2, io.write_address) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 66:25]
    node _io_read_data2_T_2 = and(_io_read_data2_T_1, io.write_enable) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 66:46]
    node _io_read_data2_T_3 = mux(_io_read_data2_T_2, io.write_data, registers[io.read_address2]) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _io_read_data2_T_4 = mux(_io_read_data2_T, UInt<1>("h0"), _io_read_data2_T_3) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    io.read_data2 <= _io_read_data2_T_4 @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 62:17]
    node _io_debug_read_data_T = eq(io.debug_read_address, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 73:30]
    node _io_debug_read_data_T_1 = eq(io.debug_read_address, io.write_address) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 74:30]
    node _io_debug_read_data_T_2 = and(_io_debug_read_data_T_1, io.write_enable) @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 74:51]
    node _io_debug_read_data_T_3 = mux(_io_debug_read_data_T_2, io.write_data, registers[io.debug_read_address]) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _io_debug_read_data_T_4 = mux(_io_debug_read_data_T, UInt<1>("h0"), _io_debug_read_data_T_3) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    io.debug_read_data <= _io_debug_read_data_T_4 @[src/main/scala/riscv/core/fivestage/RegisterFile.scala 70:22]

  module InstructionFetch :
    input clock : Clock
    input reset : Reset
    output io : { flip stall_flag_ctrl : UInt<1>, flip jump_flag_id : UInt<1>, flip jump_address_id : UInt<32>, flip physical_address : UInt<32>, ctrl_stall_flag : UInt<1>, id_instruction_address : UInt<32>, id_instruction : UInt<32>, pc_valid : UInt<1>, bus : { read : UInt<1>, address : UInt<32>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], flip write_valid : UInt<1>, flip busy : UInt<1>, request : UInt<1>, flip granted : UInt<1>}} @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 31:14]

    reg pending_jump : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 45:29]
    reg pc : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 46:19]
    reg state : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 47:22]
    reg pc_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 48:25]
    io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 51:15]
    io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 52:18]
    io.bus.write <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 53:16]
    io.bus.write_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 54:21]
    wire _WIRE : UInt<1>[4] @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 55:33]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 55:33]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 55:33]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 55:33]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 55:33]
    io.bus.write_strobe <= _WIRE @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 55:23]
    io.pc_valid <= pc_valid @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 56:15]
    node _T = eq(pc_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 58:8]
    node _T_1 = eq(pc, UInt<32>("h1000")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 58:24]
    node _T_2 = and(_T, _T_1) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 58:18]
    when _T_2 : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 58:57]
      pc_valid <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 59:14]
    node _pc_T = add(pc, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 63:8]
    node _pc_T_1 = tail(_pc_T, 1) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 63:8]
    node _pc_T_2 = mux(io.stall_flag_ctrl, pc, _pc_T_1) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _pc_T_3 = mux(io.jump_flag_id, io.jump_address_id, _pc_T_2) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    pc <= _pc_T_3 @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 62:6]
    node _T_3 = eq(io.bus.read_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 70:8]
    when _T_3 : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 70:28]
      when io.jump_flag_id : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 71:27]
        pending_jump <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 72:20]
    when io.bus.read_valid : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 76:27]
      when pending_jump : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 77:24]
        pending_jump <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 78:20]
    when io.bus.granted : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 82:24]
      node _T_4 = eq(state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 83:16]
      when _T_4 : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 83:41]
        io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 84:22]
        io.bus.read <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 85:19]
        state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 86:13]
      else :
        node _T_5 = eq(state, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 87:22]
        when _T_5 : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 87:47]
          io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 88:19]
          io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 89:22]
          when io.bus.read_valid : @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 90:31]
            state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 91:15]
    node _io_id_instruction_T = eq(pending_jump, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 97:26]
    node _io_id_instruction_T_1 = and(io.bus.read_valid, _io_id_instruction_T) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 97:23]
    node _io_id_instruction_T_2 = eq(io.jump_flag_id, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 97:43]
    node _io_id_instruction_T_3 = and(_io_id_instruction_T_1, _io_id_instruction_T_2) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 97:40]
    node _io_id_instruction_T_4 = mux(_io_id_instruction_T_3, io.bus.read_data, UInt<32>("h13")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 96:27]
    io.id_instruction <= _io_id_instruction_T_4 @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 96:21]
    node _io_ctrl_stall_flag_T = eq(io.bus.read_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 101:25]
    node _io_ctrl_stall_flag_T_1 = or(_io_ctrl_stall_flag_T, pending_jump) @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 101:44]
    io.ctrl_stall_flag <= _io_ctrl_stall_flag_T_1 @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 101:22]
    io.id_instruction_address <= pc @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 102:29]
    io.bus.address <= io.physical_address @[src/main/scala/riscv/core/fivestage/InstructionFetch.scala 103:18]

  module PipelineRegister :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<32>("h13") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<32>("h1000") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module IF2ID :
    input clock : Clock
    input reset : Reset
    output io : { flip stall_flag : UInt<1>, flip flush_enable : UInt<1>, flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip interrupt_flag : UInt<32>, output_instruction : UInt<32>, output_instruction_address : UInt<32>, output_interrupt_flag : UInt<32>} @[src/main/scala/riscv/core/fivestage/IF2ID.scala 21:14]

    node write_enable = eq(io.stall_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/IF2ID.scala 33:22]
    inst instruction of PipelineRegister @[src/main/scala/riscv/core/fivestage/IF2ID.scala 35:27]
    instruction.clock <= clock
    instruction.reset <= reset
    instruction.io.in <= io.instruction @[src/main/scala/riscv/core/fivestage/IF2ID.scala 36:21]
    instruction.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/IF2ID.scala 37:31]
    instruction.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/IF2ID.scala 38:31]
    io.output_instruction <= instruction.io.out @[src/main/scala/riscv/core/fivestage/IF2ID.scala 39:25]
    inst instruction_address of PipelineRegister_1 @[src/main/scala/riscv/core/fivestage/IF2ID.scala 41:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage/IF2ID.scala 42:29]
    instruction_address.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/IF2ID.scala 43:39]
    instruction_address.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/IF2ID.scala 44:39]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage/IF2ID.scala 45:33]
    inst interrupt_flag of PipelineRegister_2 @[src/main/scala/riscv/core/fivestage/IF2ID.scala 47:30]
    interrupt_flag.clock <= clock
    interrupt_flag.reset <= reset
    interrupt_flag.io.in <= io.interrupt_flag @[src/main/scala/riscv/core/fivestage/IF2ID.scala 48:24]
    interrupt_flag.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/IF2ID.scala 49:34]
    interrupt_flag.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/IF2ID.scala 50:34]
    io.output_interrupt_flag <= interrupt_flag.io.out @[src/main/scala/riscv/core/fivestage/IF2ID.scala 51:28]

  module InstructionDecode :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip forward_from_mem : UInt<32>, flip forward_from_wb : UInt<32>, flip reg1_forward : UInt<2>, flip reg2_forward : UInt<2>, flip interrupt_assert : UInt<1>, flip interrupt_handler_address : UInt<32>, regs_reg1_read_address : UInt<5>, regs_reg2_read_address : UInt<5>, ex_reg1_data : UInt<32>, ex_reg2_data : UInt<32>, ex_immediate : UInt<32>, ex_aluop1_source : UInt<1>, ex_aluop2_source : UInt<1>, ex_memory_read_enable : UInt<1>, ex_memory_write_enable : UInt<1>, ex_reg_write_source : UInt<2>, ex_reg_write_enable : UInt<1>, ex_reg_write_address : UInt<5>, ex_csr_address : UInt<12>, ex_csr_write_enable : UInt<1>, ctrl_jump_instruction : UInt<1>, clint_jump_flag : UInt<1>, clint_jump_address : UInt<32>, if_jump_flag : UInt<1>, if_jump_address : UInt<32>} @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 136:14]

    node opcode = bits(io.instruction, 6, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 168:30]
    node funct3 = bits(io.instruction, 14, 12) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 169:30]
    node funct7 = bits(io.instruction, 31, 25) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 170:30]
    node rd = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 171:26]
    node rs1 = bits(io.instruction, 19, 15) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 172:27]
    node rs2 = bits(io.instruction, 24, 20) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 173:27]
    node _io_regs_reg1_read_address_T = eq(opcode, UInt<6>("h37")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 175:43]
    node _io_regs_reg1_read_address_T_1 = mux(_io_regs_reg1_read_address_T, UInt<5>("h0"), rs1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 175:35]
    io.regs_reg1_read_address <= _io_regs_reg1_read_address_T_1 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 175:29]
    io.regs_reg2_read_address <= rs2 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 176:29]
    io.ex_reg1_data <= io.reg1_data @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 177:19]
    io.ex_reg2_data <= io.reg2_data @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 178:19]
    node _io_ex_immediate_T = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:67]
    node _io_ex_immediate_T_1 = bits(_io_ex_immediate_T, 0, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:48]
    node _io_ex_immediate_T_2 = mux(_io_ex_immediate_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:48]
    node _io_ex_immediate_T_3 = bits(io.instruction, 31, 20) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:88]
    node _io_ex_immediate_T_4 = cat(_io_ex_immediate_T_2, _io_ex_immediate_T_3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:43]
    node _io_ex_immediate_T_5 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:56]
    node _io_ex_immediate_T_6 = bits(_io_ex_immediate_T_5, 0, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:37]
    node _io_ex_immediate_T_7 = mux(_io_ex_immediate_T_6, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:37]
    node _io_ex_immediate_T_8 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:77]
    node _io_ex_immediate_T_9 = cat(_io_ex_immediate_T_7, _io_ex_immediate_T_8) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 181:32]
    node _io_ex_immediate_T_10 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 182:56]
    node _io_ex_immediate_T_11 = bits(_io_ex_immediate_T_10, 0, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 182:37]
    node _io_ex_immediate_T_12 = mux(_io_ex_immediate_T_11, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 182:37]
    node _io_ex_immediate_T_13 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 182:77]
    node _io_ex_immediate_T_14 = cat(_io_ex_immediate_T_12, _io_ex_immediate_T_13) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 182:32]
    node _io_ex_immediate_T_15 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 183:55]
    node _io_ex_immediate_T_16 = bits(_io_ex_immediate_T_15, 0, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 183:36]
    node _io_ex_immediate_T_17 = mux(_io_ex_immediate_T_16, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 183:36]
    node _io_ex_immediate_T_18 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 183:76]
    node _io_ex_immediate_T_19 = cat(_io_ex_immediate_T_17, _io_ex_immediate_T_18) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 183:31]
    node _io_ex_immediate_T_20 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:56]
    node _io_ex_immediate_T_21 = bits(_io_ex_immediate_T_20, 0, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:37]
    node _io_ex_immediate_T_22 = mux(_io_ex_immediate_T_21, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:37]
    node _io_ex_immediate_T_23 = bits(io.instruction, 30, 25) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:77]
    node _io_ex_immediate_T_24 = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:101]
    node io_ex_immediate_hi = cat(_io_ex_immediate_T_22, _io_ex_immediate_T_23) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:32]
    node _io_ex_immediate_T_25 = cat(io_ex_immediate_hi, _io_ex_immediate_T_24) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 184:32]
    node _io_ex_immediate_T_26 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:56]
    node _io_ex_immediate_T_27 = bits(_io_ex_immediate_T_26, 0, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:37]
    node _io_ex_immediate_T_28 = mux(_io_ex_immediate_T_27, UInt<20>("hfffff"), UInt<20>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:37]
    node _io_ex_immediate_T_29 = bits(io.instruction, 7, 7) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:77]
    node _io_ex_immediate_T_30 = bits(io.instruction, 30, 25) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:96]
    node _io_ex_immediate_T_31 = bits(io.instruction, 11, 8) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 186:21]
    node io_ex_immediate_lo = cat(_io_ex_immediate_T_31, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:32]
    node io_ex_immediate_hi_hi = cat(_io_ex_immediate_T_28, _io_ex_immediate_T_29) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:32]
    node io_ex_immediate_hi_1 = cat(io_ex_immediate_hi_hi, _io_ex_immediate_T_30) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:32]
    node _io_ex_immediate_T_32 = cat(io_ex_immediate_hi_1, io_ex_immediate_lo) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 185:32]
    node _io_ex_immediate_T_33 = bits(io.instruction, 31, 12) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 187:45]
    node _io_ex_immediate_T_34 = cat(_io_ex_immediate_T_33, UInt<12>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 187:30]
    node _io_ex_immediate_T_35 = bits(io.instruction, 31, 12) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 188:47]
    node _io_ex_immediate_T_36 = cat(_io_ex_immediate_T_35, UInt<12>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 188:32]
    node _io_ex_immediate_T_37 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:54]
    node _io_ex_immediate_T_38 = bits(_io_ex_immediate_T_37, 0, 0) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:35]
    node _io_ex_immediate_T_39 = mux(_io_ex_immediate_T_38, UInt<12>("hfff"), UInt<12>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:35]
    node _io_ex_immediate_T_40 = bits(io.instruction, 19, 12) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:75]
    node _io_ex_immediate_T_41 = bits(io.instruction, 20, 20) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:99]
    node _io_ex_immediate_T_42 = bits(io.instruction, 30, 21) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 190:21]
    node io_ex_immediate_lo_1 = cat(_io_ex_immediate_T_42, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:30]
    node io_ex_immediate_hi_hi_1 = cat(_io_ex_immediate_T_39, _io_ex_immediate_T_40) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:30]
    node io_ex_immediate_hi_2 = cat(io_ex_immediate_hi_hi_1, _io_ex_immediate_T_41) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:30]
    node _io_ex_immediate_T_43 = cat(io_ex_immediate_hi_2, io_ex_immediate_lo_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 189:30]
    node _io_ex_immediate_T_44 = eq(UInt<5>("h13"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_45 = mux(_io_ex_immediate_T_44, _io_ex_immediate_T_9, _io_ex_immediate_T_4) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_46 = eq(UInt<2>("h3"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_47 = mux(_io_ex_immediate_T_46, _io_ex_immediate_T_14, _io_ex_immediate_T_45) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_48 = eq(UInt<7>("h67"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_49 = mux(_io_ex_immediate_T_48, _io_ex_immediate_T_19, _io_ex_immediate_T_47) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_50 = eq(UInt<6>("h23"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_51 = mux(_io_ex_immediate_T_50, _io_ex_immediate_T_25, _io_ex_immediate_T_49) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_52 = eq(UInt<7>("h63"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_53 = mux(_io_ex_immediate_T_52, _io_ex_immediate_T_32, _io_ex_immediate_T_51) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_54 = eq(UInt<6>("h37"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_55 = mux(_io_ex_immediate_T_54, _io_ex_immediate_T_34, _io_ex_immediate_T_53) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_56 = eq(UInt<5>("h17"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_57 = mux(_io_ex_immediate_T_56, _io_ex_immediate_T_36, _io_ex_immediate_T_55) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_58 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    node _io_ex_immediate_T_59 = mux(_io_ex_immediate_T_58, _io_ex_immediate_T_43, _io_ex_immediate_T_57) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:98]
    io.ex_immediate <= _io_ex_immediate_T_59 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 179:19]
    node _io_ex_aluop1_source_T = eq(opcode, UInt<5>("h17")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:12]
    node _io_ex_aluop1_source_T_1 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:45]
    node _io_ex_aluop1_source_T_2 = or(_io_ex_aluop1_source_T, _io_ex_aluop1_source_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:35]
    node _io_ex_aluop1_source_T_3 = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:78]
    node _io_ex_aluop1_source_T_4 = or(_io_ex_aluop1_source_T_2, _io_ex_aluop1_source_T_3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 194:68]
    node _io_ex_aluop1_source_T_5 = mux(_io_ex_aluop1_source_T_4, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 193:29]
    io.ex_aluop1_source <= _io_ex_aluop1_source_T_5 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 193:23]
    node _io_ex_aluop2_source_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 199:12]
    node _io_ex_aluop2_source_T_1 = mux(_io_ex_aluop2_source_T, UInt<1>("h0"), UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 198:29]
    io.ex_aluop2_source <= _io_ex_aluop2_source_T_1 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 198:23]
    node _io_ex_memory_read_enable_T = eq(opcode, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 203:38]
    io.ex_memory_read_enable <= _io_ex_memory_read_enable_T @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 203:28]
    node _io_ex_memory_write_enable_T = eq(opcode, UInt<6>("h23")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 204:39]
    io.ex_memory_write_enable <= _io_ex_memory_write_enable_T @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 204:29]
    node _io_ex_reg_write_source_T = eq(UInt<2>("h3"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    node _io_ex_reg_write_source_T_1 = mux(_io_ex_reg_write_source_T, UInt<2>("h1"), UInt<2>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    node _io_ex_reg_write_source_T_2 = eq(UInt<7>("h73"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    node _io_ex_reg_write_source_T_3 = mux(_io_ex_reg_write_source_T_2, UInt<2>("h2"), _io_ex_reg_write_source_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    node _io_ex_reg_write_source_T_4 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    node _io_ex_reg_write_source_T_5 = mux(_io_ex_reg_write_source_T_4, UInt<2>("h3"), _io_ex_reg_write_source_T_3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    node _io_ex_reg_write_source_T_6 = eq(UInt<7>("h67"), opcode) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    node _io_ex_reg_write_source_T_7 = mux(_io_ex_reg_write_source_T_6, UInt<2>("h3"), _io_ex_reg_write_source_T_5) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:72]
    io.ex_reg_write_source <= _io_ex_reg_write_source_T_7 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 205:26]
    node _io_ex_reg_write_enable_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 213:37]
    node _io_ex_reg_write_enable_T_1 = eq(opcode, UInt<5>("h13")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 213:73]
    node _io_ex_reg_write_enable_T_2 = or(_io_ex_reg_write_enable_T, _io_ex_reg_write_enable_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 213:62]
    node _io_ex_reg_write_enable_T_3 = eq(opcode, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:13]
    node _io_ex_reg_write_enable_T_4 = or(_io_ex_reg_write_enable_T_2, _io_ex_reg_write_enable_T_3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 213:97]
    node _io_ex_reg_write_enable_T_5 = eq(opcode, UInt<5>("h17")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:48]
    node _io_ex_reg_write_enable_T_6 = or(_io_ex_reg_write_enable_T_4, _io_ex_reg_write_enable_T_5) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:37]
    node _io_ex_reg_write_enable_T_7 = eq(opcode, UInt<6>("h37")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:83]
    node _io_ex_reg_write_enable_T_8 = or(_io_ex_reg_write_enable_T_6, _io_ex_reg_write_enable_T_7) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:72]
    node _io_ex_reg_write_enable_T_9 = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:13]
    node _io_ex_reg_write_enable_T_10 = or(_io_ex_reg_write_enable_T_8, _io_ex_reg_write_enable_T_9) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 214:105]
    node _io_ex_reg_write_enable_T_11 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:46]
    node _io_ex_reg_write_enable_T_12 = or(_io_ex_reg_write_enable_T_10, _io_ex_reg_write_enable_T_11) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:35]
    node _io_ex_reg_write_enable_T_13 = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:80]
    node _io_ex_reg_write_enable_T_14 = or(_io_ex_reg_write_enable_T_12, _io_ex_reg_write_enable_T_13) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 215:69]
    io.ex_reg_write_enable <= _io_ex_reg_write_enable_T_14 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 213:26]
    node _io_ex_reg_write_address_T = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 216:44]
    io.ex_reg_write_address <= _io_ex_reg_write_address_T @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 216:27]
    node _io_ex_csr_address_T = bits(io.instruction, 31, 20) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 217:38]
    io.ex_csr_address <= _io_ex_csr_address_T @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 217:21]
    node _io_ex_csr_write_enable_T = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 218:37]
    node _io_ex_csr_write_enable_T_1 = eq(funct3, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 219:12]
    node _io_ex_csr_write_enable_T_2 = eq(funct3, UInt<3>("h5")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 219:52]
    node _io_ex_csr_write_enable_T_3 = or(_io_ex_csr_write_enable_T_1, _io_ex_csr_write_enable_T_2) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 219:42]
    node _io_ex_csr_write_enable_T_4 = eq(funct3, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 220:14]
    node _io_ex_csr_write_enable_T_5 = or(_io_ex_csr_write_enable_T_3, _io_ex_csr_write_enable_T_4) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 219:83]
    node _io_ex_csr_write_enable_T_6 = eq(funct3, UInt<3>("h6")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 220:54]
    node _io_ex_csr_write_enable_T_7 = or(_io_ex_csr_write_enable_T_5, _io_ex_csr_write_enable_T_6) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 220:44]
    node _io_ex_csr_write_enable_T_8 = eq(funct3, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 221:14]
    node _io_ex_csr_write_enable_T_9 = or(_io_ex_csr_write_enable_T_7, _io_ex_csr_write_enable_T_8) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 220:85]
    node _io_ex_csr_write_enable_T_10 = eq(funct3, UInt<3>("h7")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 221:54]
    node _io_ex_csr_write_enable_T_11 = or(_io_ex_csr_write_enable_T_9, _io_ex_csr_write_enable_T_10) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 221:44]
    node _io_ex_csr_write_enable_T_12 = and(_io_ex_csr_write_enable_T, _io_ex_csr_write_enable_T_11) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 218:59]
    io.ex_csr_write_enable <= _io_ex_csr_write_enable_T_12 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 218:26]
    node _reg1_data_T = eq(UInt<2>("h1"), io.reg1_forward) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 224:59]
    node _reg1_data_T_1 = mux(_reg1_data_T, io.forward_from_mem, io.reg1_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 224:59]
    node _reg1_data_T_2 = eq(UInt<2>("h2"), io.reg1_forward) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 224:59]
    node reg1_data = mux(_reg1_data_T_2, io.forward_from_wb, _reg1_data_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 224:59]
    node _reg2_data_T = eq(UInt<2>("h1"), io.reg2_forward) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 230:59]
    node _reg2_data_T_1 = mux(_reg2_data_T, io.forward_from_mem, io.reg2_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 230:59]
    node _reg2_data_T_2 = eq(UInt<2>("h2"), io.reg2_forward) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 230:59]
    node reg2_data = mux(_reg2_data_T_2, io.forward_from_wb, _reg2_data_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 230:59]
    node _io_ctrl_jump_instruction_T = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 236:39]
    node _io_ctrl_jump_instruction_T_1 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 237:13]
    node _io_ctrl_jump_instruction_T_2 = or(_io_ctrl_jump_instruction_T, _io_ctrl_jump_instruction_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 236:61]
    node _io_ctrl_jump_instruction_T_3 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 237:47]
    node _io_ctrl_jump_instruction_T_4 = or(_io_ctrl_jump_instruction_T_2, _io_ctrl_jump_instruction_T_3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 237:36]
    io.ctrl_jump_instruction <= _io_ctrl_jump_instruction_T_4 @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 236:28]
    node _instruction_jump_flag_T = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 238:39]
    node _instruction_jump_flag_T_1 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 239:13]
    node _instruction_jump_flag_T_2 = or(_instruction_jump_flag_T, _instruction_jump_flag_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 238:61]
    node _instruction_jump_flag_T_3 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:13]
    node _instruction_jump_flag_T_4 = eq(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 242:45]
    node _instruction_jump_flag_T_5 = neq(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 243:45]
    node _instruction_jump_flag_T_6 = asSInt(reg1_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 244:45]
    node _instruction_jump_flag_T_7 = asSInt(reg2_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 244:64]
    node _instruction_jump_flag_T_8 = lt(_instruction_jump_flag_T_6, _instruction_jump_flag_T_7) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 244:52]
    node _instruction_jump_flag_T_9 = asSInt(reg1_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 245:45]
    node _instruction_jump_flag_T_10 = asSInt(reg2_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 245:65]
    node _instruction_jump_flag_T_11 = geq(_instruction_jump_flag_T_9, _instruction_jump_flag_T_10) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 245:52]
    node _instruction_jump_flag_T_12 = lt(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 246:53]
    node _instruction_jump_flag_T_13 = geq(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 247:53]
    node _instruction_jump_flag_T_14 = eq(UInt<1>("h0"), funct3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_15 = mux(_instruction_jump_flag_T_14, _instruction_jump_flag_T_4, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_16 = eq(UInt<1>("h1"), funct3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_17 = mux(_instruction_jump_flag_T_16, _instruction_jump_flag_T_5, _instruction_jump_flag_T_15) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_18 = eq(UInt<3>("h4"), funct3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_19 = mux(_instruction_jump_flag_T_18, _instruction_jump_flag_T_8, _instruction_jump_flag_T_17) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_20 = eq(UInt<3>("h5"), funct3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_21 = mux(_instruction_jump_flag_T_20, _instruction_jump_flag_T_11, _instruction_jump_flag_T_19) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_22 = eq(UInt<3>("h6"), funct3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_23 = mux(_instruction_jump_flag_T_22, _instruction_jump_flag_T_12, _instruction_jump_flag_T_21) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_24 = eq(UInt<3>("h7"), funct3) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_25 = mux(_instruction_jump_flag_T_24, _instruction_jump_flag_T_13, _instruction_jump_flag_T_23) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:66]
    node _instruction_jump_flag_T_26 = and(_instruction_jump_flag_T_3, _instruction_jump_flag_T_25) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 240:37]
    node instruction_jump_flag = or(_instruction_jump_flag_T_2, _instruction_jump_flag_T_26) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 239:36]
    node _instruction_jump_address_T = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 250:63]
    node _instruction_jump_address_T_1 = mux(_instruction_jump_address_T, reg1_data, io.instruction_address) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 250:55]
    node _instruction_jump_address_T_2 = add(io.ex_immediate, _instruction_jump_address_T_1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 250:50]
    node instruction_jump_address = tail(_instruction_jump_address_T_2, 1) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 250:50]
    io.clint_jump_flag <= instruction_jump_flag @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 251:22]
    io.clint_jump_address <= instruction_jump_address @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 252:25]
    node _io_if_jump_flag_T = or(io.interrupt_assert, instruction_jump_flag) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 253:42]
    io.if_jump_flag <= _io_if_jump_flag_T @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 253:19]
    node _io_if_jump_address_T = mux(io.interrupt_assert, io.interrupt_handler_address, instruction_jump_address) @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 254:28]
    io.if_jump_address <= _io_if_jump_address_T @[src/main/scala/riscv/core/fivestage/InstructionDecode.scala 254:22]

  module PipelineRegister_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<32>("h13") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<32>("h1000") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<12>, out : UInt<12>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<12>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module ID2EX :
    input clock : Clock
    input reset : Reset
    output io : { flip stall_flag : UInt<1>, flip flush_enable : UInt<1>, flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip regs_write_enable : UInt<1>, flip regs_write_address : UInt<5>, flip regs_write_source : UInt<2>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip immediate : UInt<32>, flip aluop1_source : UInt<1>, flip aluop2_source : UInt<1>, flip csr_write_enable : UInt<1>, flip csr_address : UInt<12>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip csr_read_data : UInt<32>, output_instruction : UInt<32>, output_instruction_address : UInt<32>, output_regs_write_enable : UInt<1>, output_regs_write_address : UInt<5>, output_regs_write_source : UInt<2>, output_reg1_data : UInt<32>, output_reg2_data : UInt<32>, output_immediate : UInt<32>, output_aluop1_source : UInt<1>, output_aluop2_source : UInt<1>, output_csr_write_enable : UInt<1>, output_csr_address : UInt<12>, output_memory_read_enable : UInt<1>, output_memory_write_enable : UInt<1>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage/ID2EX.scala 21:14]

    node write_enable = eq(io.stall_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/ID2EX.scala 56:22]
    inst instruction of PipelineRegister_3 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 58:27]
    instruction.clock <= clock
    instruction.reset <= reset
    instruction.io.in <= io.instruction @[src/main/scala/riscv/core/fivestage/ID2EX.scala 59:21]
    instruction.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 60:31]
    instruction.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 61:31]
    io.output_instruction <= instruction.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 62:25]
    inst instruction_address of PipelineRegister_4 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 64:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage/ID2EX.scala 65:29]
    instruction_address.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 66:39]
    instruction_address.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 67:39]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 68:33]
    inst regs_write_enable of PipelineRegister_5 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 70:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 71:27]
    regs_write_enable.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 72:37]
    regs_write_enable.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 73:37]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 74:31]
    inst regs_write_address of PipelineRegister_6 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 76:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/fivestage/ID2EX.scala 77:28]
    regs_write_address.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 78:38]
    regs_write_address.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 79:38]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 80:32]
    inst regs_write_source of PipelineRegister_7 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 82:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/fivestage/ID2EX.scala 83:27]
    regs_write_source.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 84:37]
    regs_write_source.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 85:37]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 86:31]
    inst reg1_data of PipelineRegister_8 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 88:25]
    reg1_data.clock <= clock
    reg1_data.reset <= reset
    reg1_data.io.in <= io.reg1_data @[src/main/scala/riscv/core/fivestage/ID2EX.scala 89:19]
    reg1_data.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 90:29]
    reg1_data.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 91:29]
    io.output_reg1_data <= reg1_data.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 92:23]
    inst reg2_data of PipelineRegister_9 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 94:25]
    reg2_data.clock <= clock
    reg2_data.reset <= reset
    reg2_data.io.in <= io.reg2_data @[src/main/scala/riscv/core/fivestage/ID2EX.scala 95:19]
    reg2_data.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 96:29]
    reg2_data.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 97:29]
    io.output_reg2_data <= reg2_data.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 98:23]
    inst immediate of PipelineRegister_10 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 100:25]
    immediate.clock <= clock
    immediate.reset <= reset
    immediate.io.in <= io.immediate @[src/main/scala/riscv/core/fivestage/ID2EX.scala 101:19]
    immediate.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 102:29]
    immediate.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 103:29]
    io.output_immediate <= immediate.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 104:23]
    inst aluop1_source of PipelineRegister_11 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 106:29]
    aluop1_source.clock <= clock
    aluop1_source.reset <= reset
    aluop1_source.io.in <= io.aluop1_source @[src/main/scala/riscv/core/fivestage/ID2EX.scala 107:23]
    aluop1_source.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 108:33]
    aluop1_source.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 109:33]
    io.output_aluop1_source <= aluop1_source.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 110:27]
    inst aluop2_source of PipelineRegister_12 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 112:29]
    aluop2_source.clock <= clock
    aluop2_source.reset <= reset
    aluop2_source.io.in <= io.aluop2_source @[src/main/scala/riscv/core/fivestage/ID2EX.scala 113:23]
    aluop2_source.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 114:33]
    aluop2_source.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 115:33]
    io.output_aluop2_source <= aluop2_source.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 116:27]
    inst csr_write_enable of PipelineRegister_13 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 118:32]
    csr_write_enable.clock <= clock
    csr_write_enable.reset <= reset
    csr_write_enable.io.in <= io.csr_write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 119:26]
    csr_write_enable.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 120:36]
    csr_write_enable.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 121:36]
    io.output_csr_write_enable <= csr_write_enable.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 122:30]
    inst csr_address of PipelineRegister_14 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 124:27]
    csr_address.clock <= clock
    csr_address.reset <= reset
    csr_address.io.in <= io.csr_address @[src/main/scala/riscv/core/fivestage/ID2EX.scala 125:21]
    csr_address.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 126:31]
    csr_address.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 127:31]
    io.output_csr_address <= csr_address.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 128:25]
    inst memory_read_enable of PipelineRegister_15 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 130:34]
    memory_read_enable.clock <= clock
    memory_read_enable.reset <= reset
    memory_read_enable.io.in <= io.memory_read_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 131:28]
    memory_read_enable.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 132:38]
    memory_read_enable.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 133:38]
    io.output_memory_read_enable <= memory_read_enable.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 134:32]
    inst memory_write_enable of PipelineRegister_16 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 136:35]
    memory_write_enable.clock <= clock
    memory_write_enable.reset <= reset
    memory_write_enable.io.in <= io.memory_write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 137:29]
    memory_write_enable.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 138:39]
    memory_write_enable.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 139:39]
    io.output_memory_write_enable <= memory_write_enable.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 140:33]
    inst csr_read_data of PipelineRegister_17 @[src/main/scala/riscv/core/fivestage/ID2EX.scala 142:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/fivestage/ID2EX.scala 143:23]
    csr_read_data.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 144:33]
    csr_read_data.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/ID2EX.scala 145:33]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/fivestage/ID2EX.scala 146:27]

  module ALU :
    input clock : Clock
    input reset : Reset
    output io : { flip func : UInt<4>, flip op1 : UInt<32>, flip op2 : UInt<32>, result : UInt<32>} @[src/main/scala/riscv/core/fivestage/ALU.scala 26:14]

    io.result <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/ALU.scala 35:13]
    node _T = asUInt(UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
    node _T_1 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
    when _T_2 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
      node _io_result_T = add(io.op1, io.op2) @[src/main/scala/riscv/core/fivestage/ALU.scala 38:27]
      node _io_result_T_1 = tail(_io_result_T, 1) @[src/main/scala/riscv/core/fivestage/ALU.scala 38:27]
      io.result <= _io_result_T_1 @[src/main/scala/riscv/core/fivestage/ALU.scala 38:17]
    else :
      node _T_3 = asUInt(UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
      node _T_4 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
      when _T_5 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
        node _io_result_T_2 = sub(io.op1, io.op2) @[src/main/scala/riscv/core/fivestage/ALU.scala 41:27]
        node _io_result_T_3 = tail(_io_result_T_2, 1) @[src/main/scala/riscv/core/fivestage/ALU.scala 41:27]
        io.result <= _io_result_T_3 @[src/main/scala/riscv/core/fivestage/ALU.scala 41:17]
      else :
        node _T_6 = asUInt(UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
        node _T_7 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
        node _T_8 = eq(_T_6, _T_7) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
        when _T_8 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
          node _io_result_T_4 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/fivestage/ALU.scala 44:36]
          node _io_result_T_5 = dshl(io.op1, _io_result_T_4) @[src/main/scala/riscv/core/fivestage/ALU.scala 44:27]
          io.result <= _io_result_T_5 @[src/main/scala/riscv/core/fivestage/ALU.scala 44:17]
        else :
          node _T_9 = asUInt(UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
          node _T_10 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
          node _T_11 = eq(_T_9, _T_10) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
          when _T_11 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
            node _io_result_T_6 = asSInt(io.op1) @[src/main/scala/riscv/core/fivestage/ALU.scala 47:27]
            node _io_result_T_7 = asSInt(io.op2) @[src/main/scala/riscv/core/fivestage/ALU.scala 47:43]
            node _io_result_T_8 = lt(_io_result_T_6, _io_result_T_7) @[src/main/scala/riscv/core/fivestage/ALU.scala 47:34]
            io.result <= _io_result_T_8 @[src/main/scala/riscv/core/fivestage/ALU.scala 47:17]
          else :
            node _T_12 = asUInt(UInt<3>("h5")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
            node _T_13 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
            node _T_14 = eq(_T_12, _T_13) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
            when _T_14 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
              node _io_result_T_9 = xor(io.op1, io.op2) @[src/main/scala/riscv/core/fivestage/ALU.scala 50:27]
              io.result <= _io_result_T_9 @[src/main/scala/riscv/core/fivestage/ALU.scala 50:17]
            else :
              node _T_15 = asUInt(UInt<3>("h6")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
              node _T_16 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
              node _T_17 = eq(_T_15, _T_16) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
              when _T_17 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                node _io_result_T_10 = or(io.op1, io.op2) @[src/main/scala/riscv/core/fivestage/ALU.scala 53:27]
                io.result <= _io_result_T_10 @[src/main/scala/riscv/core/fivestage/ALU.scala 53:17]
              else :
                node _T_18 = asUInt(UInt<3>("h7")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                node _T_19 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                node _T_20 = eq(_T_18, _T_19) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                when _T_20 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                  node _io_result_T_11 = and(io.op1, io.op2) @[src/main/scala/riscv/core/fivestage/ALU.scala 56:27]
                  io.result <= _io_result_T_11 @[src/main/scala/riscv/core/fivestage/ALU.scala 56:17]
                else :
                  node _T_21 = asUInt(UInt<4>("h8")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                  node _T_22 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                  node _T_23 = eq(_T_21, _T_22) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                  when _T_23 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                    node _io_result_T_12 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/fivestage/ALU.scala 59:36]
                    node _io_result_T_13 = dshr(io.op1, _io_result_T_12) @[src/main/scala/riscv/core/fivestage/ALU.scala 59:27]
                    io.result <= _io_result_T_13 @[src/main/scala/riscv/core/fivestage/ALU.scala 59:17]
                  else :
                    node _T_24 = asUInt(UInt<4>("h9")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                    node _T_25 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                    node _T_26 = eq(_T_24, _T_25) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                    when _T_26 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                      node _io_result_T_14 = asSInt(io.op1) @[src/main/scala/riscv/core/fivestage/ALU.scala 62:28]
                      node _io_result_T_15 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/fivestage/ALU.scala 62:44]
                      node _io_result_T_16 = dshr(_io_result_T_14, _io_result_T_15) @[src/main/scala/riscv/core/fivestage/ALU.scala 62:35]
                      node _io_result_T_17 = asUInt(_io_result_T_16) @[src/main/scala/riscv/core/fivestage/ALU.scala 62:52]
                      io.result <= _io_result_T_17 @[src/main/scala/riscv/core/fivestage/ALU.scala 62:17]
                    else :
                      node _T_27 = asUInt(UInt<4>("ha")) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                      node _T_28 = asUInt(io.func) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                      node _T_29 = eq(_T_27, _T_28) @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                      when _T_29 : @[src/main/scala/riscv/core/fivestage/ALU.scala 36:19]
                        node _io_result_T_18 = lt(io.op1, io.op2) @[src/main/scala/riscv/core/fivestage/ALU.scala 65:27]
                        io.result <= _io_result_T_18 @[src/main/scala/riscv/core/fivestage/ALU.scala 65:17]


  module ALUControl :
    input clock : Clock
    input reset : Reset
    output io : { flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>, alu_funct : UInt<4>} @[src/main/scala/riscv/core/fivestage/ALUControl.scala 21:14]

    io.alu_funct <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 29:16]
    node _T = eq(UInt<5>("h13"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
    when _T : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
      node _io_alu_funct_T = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 42:49]
      node _io_alu_funct_T_1 = mux(_io_alu_funct_T, UInt<4>("h9"), UInt<4>("h8")) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 42:39]
      node _io_alu_funct_T_2 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_3 = mux(_io_alu_funct_T_2, UInt<2>("h3"), UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_4 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_5 = mux(_io_alu_funct_T_4, UInt<3>("h4"), _io_alu_funct_T_3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_6 = eq(UInt<2>("h3"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_7 = mux(_io_alu_funct_T_6, UInt<4>("ha"), _io_alu_funct_T_5) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_8 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_9 = mux(_io_alu_funct_T_8, UInt<3>("h5"), _io_alu_funct_T_7) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_10 = eq(UInt<3>("h6"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_11 = mux(_io_alu_funct_T_10, UInt<3>("h6"), _io_alu_funct_T_9) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_12 = eq(UInt<3>("h7"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_13 = mux(_io_alu_funct_T_12, UInt<3>("h7"), _io_alu_funct_T_11) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_14 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      node _io_alu_funct_T_15 = mux(_io_alu_funct_T_14, _io_alu_funct_T_1, _io_alu_funct_T_13) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:62]
      io.alu_funct <= _io_alu_funct_T_15 @[src/main/scala/riscv/core/fivestage/ALUControl.scala 33:20]
    else :
      node _T_1 = eq(UInt<6>("h33"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
      when _T_1 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
        node _io_alu_funct_T_16 = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 49:53]
        node _io_alu_funct_T_17 = mux(_io_alu_funct_T_16, UInt<2>("h2"), UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 49:43]
        node _io_alu_funct_T_18 = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 56:48]
        node _io_alu_funct_T_19 = mux(_io_alu_funct_T_18, UInt<4>("h9"), UInt<4>("h8")) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 56:38]
        node _io_alu_funct_T_20 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_21 = mux(_io_alu_funct_T_20, UInt<2>("h3"), _io_alu_funct_T_17) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_22 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_23 = mux(_io_alu_funct_T_22, UInt<3>("h4"), _io_alu_funct_T_21) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_24 = eq(UInt<2>("h3"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_25 = mux(_io_alu_funct_T_24, UInt<4>("ha"), _io_alu_funct_T_23) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_26 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_27 = mux(_io_alu_funct_T_26, UInt<3>("h5"), _io_alu_funct_T_25) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_28 = eq(UInt<3>("h6"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_29 = mux(_io_alu_funct_T_28, UInt<3>("h6"), _io_alu_funct_T_27) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_30 = eq(UInt<3>("h7"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_31 = mux(_io_alu_funct_T_30, UInt<3>("h7"), _io_alu_funct_T_29) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_32 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        node _io_alu_funct_T_33 = mux(_io_alu_funct_T_32, _io_alu_funct_T_19, _io_alu_funct_T_31) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:62]
        io.alu_funct <= _io_alu_funct_T_33 @[src/main/scala/riscv/core/fivestage/ALUControl.scala 47:20]
      else :
        node _T_2 = eq(UInt<7>("h63"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
        when _T_2 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
          io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 61:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
          when _T_3 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
            io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 64:20]
          else :
            node _T_4 = eq(UInt<6>("h23"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
            when _T_4 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
              io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 67:20]
            else :
              node _T_5 = eq(UInt<7>("h6f"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
              when _T_5 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
                io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 70:20]
              else :
                node _T_6 = eq(UInt<7>("h67"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
                when _T_6 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
                  io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 73:20]
                else :
                  node _T_7 = eq(UInt<6>("h37"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
                  when _T_7 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
                    io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 76:20]
                  else :
                    node _T_8 = eq(UInt<5>("h17"), io.opcode) @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
                    when _T_8 : @[src/main/scala/riscv/core/fivestage/ALUControl.scala 31:21]
                      io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/ALUControl.scala 79:20]


  module Execute :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip immediate : UInt<32>, flip aluop1_source : UInt<1>, flip aluop2_source : UInt<1>, flip csr_read_data : UInt<32>, flip forward_from_mem : UInt<32>, flip forward_from_wb : UInt<32>, flip reg1_forward : UInt<2>, flip reg2_forward : UInt<2>, mem_alu_result : UInt<32>, csr_write_data : UInt<32>} @[src/main/scala/riscv/core/fivestage/Execute.scala 26:14]

    node opcode = bits(io.instruction, 6, 0) @[src/main/scala/riscv/core/fivestage/Execute.scala 44:30]
    node funct3 = bits(io.instruction, 14, 12) @[src/main/scala/riscv/core/fivestage/Execute.scala 45:30]
    node funct7 = bits(io.instruction, 31, 25) @[src/main/scala/riscv/core/fivestage/Execute.scala 46:30]
    node rd = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/fivestage/Execute.scala 47:26]
    node uimm = bits(io.instruction, 19, 15) @[src/main/scala/riscv/core/fivestage/Execute.scala 48:28]
    inst alu of ALU @[src/main/scala/riscv/core/fivestage/Execute.scala 50:19]
    alu.clock <= clock
    alu.reset <= reset
    inst alu_ctrl of ALUControl @[src/main/scala/riscv/core/fivestage/Execute.scala 51:24]
    alu_ctrl.clock <= clock
    alu_ctrl.reset <= reset
    alu_ctrl.io.opcode <= opcode @[src/main/scala/riscv/core/fivestage/Execute.scala 53:22]
    alu_ctrl.io.funct3 <= funct3 @[src/main/scala/riscv/core/fivestage/Execute.scala 54:22]
    alu_ctrl.io.funct7 <= funct7 @[src/main/scala/riscv/core/fivestage/Execute.scala 55:22]
    alu.io.func <= alu_ctrl.io.alu_funct @[src/main/scala/riscv/core/fivestage/Execute.scala 56:15]
    node _alu_io_op1_T = eq(io.aluop1_source, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/Execute.scala 58:22]
    node _alu_io_op1_T_1 = eq(UInt<2>("h1"), io.reg1_forward) @[src/main/scala/riscv/core/fivestage/Execute.scala 60:45]
    node _alu_io_op1_T_2 = mux(_alu_io_op1_T_1, io.forward_from_mem, io.reg1_data) @[src/main/scala/riscv/core/fivestage/Execute.scala 60:45]
    node _alu_io_op1_T_3 = eq(UInt<2>("h2"), io.reg1_forward) @[src/main/scala/riscv/core/fivestage/Execute.scala 60:45]
    node _alu_io_op1_T_4 = mux(_alu_io_op1_T_3, io.forward_from_wb, _alu_io_op1_T_2) @[src/main/scala/riscv/core/fivestage/Execute.scala 60:45]
    node _alu_io_op1_T_5 = mux(_alu_io_op1_T, io.instruction_address, _alu_io_op1_T_4) @[src/main/scala/riscv/core/fivestage/Execute.scala 57:20]
    alu.io.op1 <= _alu_io_op1_T_5 @[src/main/scala/riscv/core/fivestage/Execute.scala 57:14]
    node _alu_io_op2_T = eq(io.aluop2_source, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/Execute.scala 68:22]
    node _alu_io_op2_T_1 = eq(UInt<2>("h1"), io.reg2_forward) @[src/main/scala/riscv/core/fivestage/Execute.scala 70:45]
    node _alu_io_op2_T_2 = mux(_alu_io_op2_T_1, io.forward_from_mem, io.reg2_data) @[src/main/scala/riscv/core/fivestage/Execute.scala 70:45]
    node _alu_io_op2_T_3 = eq(UInt<2>("h2"), io.reg2_forward) @[src/main/scala/riscv/core/fivestage/Execute.scala 70:45]
    node _alu_io_op2_T_4 = mux(_alu_io_op2_T_3, io.forward_from_wb, _alu_io_op2_T_2) @[src/main/scala/riscv/core/fivestage/Execute.scala 70:45]
    node _alu_io_op2_T_5 = mux(_alu_io_op2_T, io.immediate, _alu_io_op2_T_4) @[src/main/scala/riscv/core/fivestage/Execute.scala 67:20]
    alu.io.op2 <= _alu_io_op2_T_5 @[src/main/scala/riscv/core/fivestage/Execute.scala 67:14]
    io.mem_alu_result <= alu.io.result @[src/main/scala/riscv/core/fivestage/Execute.scala 77:21]
    node _io_csr_write_data_T = not(io.reg1_data) @[src/main/scala/riscv/core/fivestage/Execute.scala 80:54]
    node _io_csr_write_data_T_1 = and(io.csr_read_data, _io_csr_write_data_T) @[src/main/scala/riscv/core/fivestage/Execute.scala 80:52]
    node _io_csr_write_data_T_2 = or(io.csr_read_data, io.reg1_data) @[src/main/scala/riscv/core/fivestage/Execute.scala 81:52]
    node _io_csr_write_data_T_3 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/fivestage/Execute.scala 82:38]
    node _io_csr_write_data_T_4 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/fivestage/Execute.scala 83:59]
    node _io_csr_write_data_T_5 = not(_io_csr_write_data_T_4) @[src/main/scala/riscv/core/fivestage/Execute.scala 83:55]
    node _io_csr_write_data_T_6 = and(io.csr_read_data, _io_csr_write_data_T_5) @[src/main/scala/riscv/core/fivestage/Execute.scala 83:53]
    node _io_csr_write_data_T_7 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/fivestage/Execute.scala 84:57]
    node _io_csr_write_data_T_8 = or(io.csr_read_data, _io_csr_write_data_T_7) @[src/main/scala/riscv/core/fivestage/Execute.scala 84:53]
    node _io_csr_write_data_T_9 = eq(UInt<1>("h1"), funct3) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_10 = mux(_io_csr_write_data_T_9, io.reg1_data, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_11 = eq(UInt<2>("h3"), funct3) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_12 = mux(_io_csr_write_data_T_11, _io_csr_write_data_T_1, _io_csr_write_data_T_10) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_13 = eq(UInt<2>("h2"), funct3) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_14 = mux(_io_csr_write_data_T_13, _io_csr_write_data_T_2, _io_csr_write_data_T_12) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_15 = eq(UInt<3>("h5"), funct3) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_16 = mux(_io_csr_write_data_T_15, _io_csr_write_data_T_3, _io_csr_write_data_T_14) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_17 = eq(UInt<3>("h7"), funct3) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_18 = mux(_io_csr_write_data_T_17, _io_csr_write_data_T_6, _io_csr_write_data_T_16) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_19 = eq(UInt<3>("h6"), funct3) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    node _io_csr_write_data_T_20 = mux(_io_csr_write_data_T_19, _io_csr_write_data_T_8, _io_csr_write_data_T_18) @[src/main/scala/riscv/core/fivestage/Execute.scala 78:46]
    io.csr_write_data <= _io_csr_write_data_T_20 @[src/main/scala/riscv/core/fivestage/Execute.scala 78:21]

  module PipelineRegister_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module EX2MEM :
    input clock : Clock
    input reset : Reset
    output io : { flip stall_flag : UInt<1>, flip flush_enable : UInt<1>, flip regs_write_enable : UInt<1>, flip regs_write_source : UInt<2>, flip regs_write_address : UInt<32>, flip instruction_address : UInt<32>, flip instruction : UInt<32>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip alu_result : UInt<32>, flip csr_read_data : UInt<32>, output_regs_write_enable : UInt<1>, output_regs_write_source : UInt<2>, output_regs_write_address : UInt<32>, output_instruction_address : UInt<32>, output_instruction : UInt<32>, output_reg1_data : UInt<32>, output_reg2_data : UInt<32>, output_memory_read_enable : UInt<1>, output_memory_write_enable : UInt<1>, output_alu_result : UInt<32>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 21:14]

    node write_enable = eq(io.stall_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 48:22]
    inst regs_write_enable of PipelineRegister_18 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 50:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 51:27]
    regs_write_enable.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 52:37]
    regs_write_enable.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 53:37]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 54:31]
    inst regs_write_source of PipelineRegister_19 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 56:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 57:27]
    regs_write_source.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 58:37]
    regs_write_source.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 59:37]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 60:31]
    inst regs_write_address of PipelineRegister_20 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 62:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 63:28]
    regs_write_address.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 64:38]
    regs_write_address.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 65:38]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 66:32]
    inst instruction_address of PipelineRegister_21 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 68:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 69:29]
    instruction_address.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 70:39]
    instruction_address.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 71:39]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 72:33]
    inst instruction of PipelineRegister_22 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 74:27]
    instruction.clock <= clock
    instruction.reset <= reset
    instruction.io.in <= io.instruction @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 75:21]
    instruction.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 76:31]
    instruction.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 77:31]
    io.output_instruction <= instruction.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 78:25]
    inst reg1_data of PipelineRegister_23 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 80:25]
    reg1_data.clock <= clock
    reg1_data.reset <= reset
    reg1_data.io.in <= io.reg1_data @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 81:19]
    reg1_data.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 82:29]
    reg1_data.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 83:29]
    io.output_reg1_data <= reg1_data.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 84:23]
    inst reg2_data of PipelineRegister_24 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 86:25]
    reg2_data.clock <= clock
    reg2_data.reset <= reset
    reg2_data.io.in <= io.reg2_data @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 87:19]
    reg2_data.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 88:29]
    reg2_data.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 89:29]
    io.output_reg2_data <= reg2_data.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 90:23]
    inst alu_result of PipelineRegister_25 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 92:26]
    alu_result.clock <= clock
    alu_result.reset <= reset
    alu_result.io.in <= io.alu_result @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 93:20]
    alu_result.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 94:30]
    alu_result.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 95:30]
    io.output_alu_result <= alu_result.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 96:24]
    inst memory_read_enable of PipelineRegister_26 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 98:34]
    memory_read_enable.clock <= clock
    memory_read_enable.reset <= reset
    memory_read_enable.io.in <= io.memory_read_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 99:28]
    memory_read_enable.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 100:38]
    memory_read_enable.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 101:38]
    io.output_memory_read_enable <= memory_read_enable.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 102:32]
    inst memory_write_enable of PipelineRegister_27 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 104:35]
    memory_write_enable.clock <= clock
    memory_write_enable.reset <= reset
    memory_write_enable.io.in <= io.memory_write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 105:29]
    memory_write_enable.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 106:39]
    memory_write_enable.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 107:39]
    io.output_memory_write_enable <= memory_write_enable.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 108:33]
    inst csr_read_data of PipelineRegister_28 @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 110:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 111:23]
    csr_read_data.io.write_enable <= write_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 112:33]
    csr_read_data.io.flush_enable <= io.flush_enable @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 113:33]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/fivestage/EX2MEM.scala 114:27]

  module MemoryAccess :
    input clock : Clock
    input reset : Reset
    output io : { flip alu_result : UInt<32>, flip reg2_data : UInt<32>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip funct3 : UInt<3>, flip regs_write_source : UInt<2>, flip csr_read_data : UInt<32>, flip clint_exception_token : UInt<1>, wb_memory_read_data : UInt<32>, ctrl_stall_flag : UInt<1>, forward_data : UInt<32>, flip physical_address : UInt<32>, bus : { read : UInt<1>, address : UInt<32>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], flip write_valid : UInt<1>, flip busy : UInt<1>, request : UInt<1>, flip granted : UInt<1>}} @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 23:14]

    node mem_address_index = bits(io.physical_address, 1, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 41:46]
    reg mem_access_state : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 42:33]
    io.bus.request <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 49:18]
    io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 50:15]
    io.bus.address <= io.physical_address @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 51:18]
    io.bus.write_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 52:21]
    wire _WIRE : UInt<1>[4] @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:33]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:33]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:33]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:33]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:33]
    io.bus.write_strobe <= _WIRE @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 53:23]
    io.bus.write <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 54:16]
    io.wb_memory_read_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 55:26]
    io.ctrl_stall_flag <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 56:22]
    when io.clint_exception_token : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 58:34]
      io.bus.request <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 59:20]
      io.ctrl_stall_flag <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 60:24]
    else :
      when io.memory_read_enable : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 61:37]
        node _T = eq(mem_access_state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 62:27]
        when _T : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 62:56]
          io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 64:26]
          io.bus.read <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 65:19]
          io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 66:22]
          when io.bus.granted : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 67:28]
            io.bus.address <= io.physical_address @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 68:24]
            io.bus.read <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 69:21]
            mem_access_state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 70:26]
        else :
          node _T_1 = eq(mem_access_state, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 72:33]
          when _T_1 : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 72:62]
            io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 73:22]
            io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 74:19]
            io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 75:26]
            when io.bus.read_valid : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 76:31]
              node _io_wb_memory_read_data_T = bits(io.bus.read_data, 31, 31) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:83]
              node _io_wb_memory_read_data_T_1 = bits(_io_wb_memory_read_data_T, 0, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:74]
              node _io_wb_memory_read_data_T_2 = mux(_io_wb_memory_read_data_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:74]
              node _io_wb_memory_read_data_T_3 = bits(io.bus.read_data, 31, 24) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:94]
              node _io_wb_memory_read_data_T_4 = cat(_io_wb_memory_read_data_T_2, _io_wb_memory_read_data_T_3) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:69]
              node _io_wb_memory_read_data_T_5 = bits(io.bus.read_data, 7, 7) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 82:41]
              node _io_wb_memory_read_data_T_6 = bits(_io_wb_memory_read_data_T_5, 0, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 82:32]
              node _io_wb_memory_read_data_T_7 = mux(_io_wb_memory_read_data_T_6, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 82:32]
              node _io_wb_memory_read_data_T_8 = bits(io.bus.read_data, 7, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 82:51]
              node _io_wb_memory_read_data_T_9 = cat(_io_wb_memory_read_data_T_7, _io_wb_memory_read_data_T_8) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 82:27]
              node _io_wb_memory_read_data_T_10 = bits(io.bus.read_data, 15, 15) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 83:41]
              node _io_wb_memory_read_data_T_11 = bits(_io_wb_memory_read_data_T_10, 0, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 83:32]
              node _io_wb_memory_read_data_T_12 = mux(_io_wb_memory_read_data_T_11, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 83:32]
              node _io_wb_memory_read_data_T_13 = bits(io.bus.read_data, 15, 8) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 83:52]
              node _io_wb_memory_read_data_T_14 = cat(_io_wb_memory_read_data_T_12, _io_wb_memory_read_data_T_13) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 83:27]
              node _io_wb_memory_read_data_T_15 = bits(io.bus.read_data, 23, 23) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 84:41]
              node _io_wb_memory_read_data_T_16 = bits(_io_wb_memory_read_data_T_15, 0, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 84:32]
              node _io_wb_memory_read_data_T_17 = mux(_io_wb_memory_read_data_T_16, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 84:32]
              node _io_wb_memory_read_data_T_18 = bits(io.bus.read_data, 23, 16) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 84:52]
              node _io_wb_memory_read_data_T_19 = cat(_io_wb_memory_read_data_T_17, _io_wb_memory_read_data_T_18) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 84:27]
              node _io_wb_memory_read_data_T_20 = eq(UInt<1>("h0"), mem_address_index) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
              node _io_wb_memory_read_data_T_21 = mux(_io_wb_memory_read_data_T_20, _io_wb_memory_read_data_T_9, _io_wb_memory_read_data_T_4) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
              node _io_wb_memory_read_data_T_22 = eq(UInt<1>("h1"), mem_address_index) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
              node _io_wb_memory_read_data_T_23 = mux(_io_wb_memory_read_data_T_22, _io_wb_memory_read_data_T_14, _io_wb_memory_read_data_T_21) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
              node _io_wb_memory_read_data_T_24 = eq(UInt<2>("h2"), mem_address_index) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
              node _io_wb_memory_read_data_T_25 = mux(_io_wb_memory_read_data_T_24, _io_wb_memory_read_data_T_19, _io_wb_memory_read_data_T_23) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 80:104]
              node _io_wb_memory_read_data_T_26 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:75]
              node _io_wb_memory_read_data_T_27 = bits(io.bus.read_data, 31, 24) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:90]
              node _io_wb_memory_read_data_T_28 = cat(_io_wb_memory_read_data_T_26, _io_wb_memory_read_data_T_27) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:70]
              node _io_wb_memory_read_data_T_29 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 89:32]
              node _io_wb_memory_read_data_T_30 = bits(io.bus.read_data, 7, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 89:47]
              node _io_wb_memory_read_data_T_31 = cat(_io_wb_memory_read_data_T_29, _io_wb_memory_read_data_T_30) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 89:27]
              node _io_wb_memory_read_data_T_32 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 90:32]
              node _io_wb_memory_read_data_T_33 = bits(io.bus.read_data, 15, 8) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 90:47]
              node _io_wb_memory_read_data_T_34 = cat(_io_wb_memory_read_data_T_32, _io_wb_memory_read_data_T_33) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 90:27]
              node _io_wb_memory_read_data_T_35 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 91:32]
              node _io_wb_memory_read_data_T_36 = bits(io.bus.read_data, 23, 16) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 91:47]
              node _io_wb_memory_read_data_T_37 = cat(_io_wb_memory_read_data_T_35, _io_wb_memory_read_data_T_36) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 91:27]
              node _io_wb_memory_read_data_T_38 = eq(UInt<1>("h0"), mem_address_index) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
              node _io_wb_memory_read_data_T_39 = mux(_io_wb_memory_read_data_T_38, _io_wb_memory_read_data_T_31, _io_wb_memory_read_data_T_28) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
              node _io_wb_memory_read_data_T_40 = eq(UInt<1>("h1"), mem_address_index) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
              node _io_wb_memory_read_data_T_41 = mux(_io_wb_memory_read_data_T_40, _io_wb_memory_read_data_T_34, _io_wb_memory_read_data_T_39) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
              node _io_wb_memory_read_data_T_42 = eq(UInt<2>("h2"), mem_address_index) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
              node _io_wb_memory_read_data_T_43 = mux(_io_wb_memory_read_data_T_42, _io_wb_memory_read_data_T_37, _io_wb_memory_read_data_T_41) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 87:100]
              node _io_wb_memory_read_data_T_44 = eq(mem_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 95:33]
              node _io_wb_memory_read_data_T_45 = bits(io.bus.read_data, 15, 15) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 96:32]
              node _io_wb_memory_read_data_T_46 = bits(_io_wb_memory_read_data_T_45, 0, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 96:23]
              node _io_wb_memory_read_data_T_47 = mux(_io_wb_memory_read_data_T_46, UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 96:23]
              node _io_wb_memory_read_data_T_48 = bits(io.bus.read_data, 15, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 96:43]
              node _io_wb_memory_read_data_T_49 = cat(_io_wb_memory_read_data_T_47, _io_wb_memory_read_data_T_48) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 96:18]
              node _io_wb_memory_read_data_T_50 = bits(io.bus.read_data, 31, 31) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:32]
              node _io_wb_memory_read_data_T_51 = bits(_io_wb_memory_read_data_T_50, 0, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:23]
              node _io_wb_memory_read_data_T_52 = mux(_io_wb_memory_read_data_T_51, UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:23]
              node _io_wb_memory_read_data_T_53 = bits(io.bus.read_data, 31, 16) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:43]
              node _io_wb_memory_read_data_T_54 = cat(_io_wb_memory_read_data_T_52, _io_wb_memory_read_data_T_53) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 97:18]
              node _io_wb_memory_read_data_T_55 = mux(_io_wb_memory_read_data_T_44, _io_wb_memory_read_data_T_49, _io_wb_memory_read_data_T_54) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 94:40]
              node _io_wb_memory_read_data_T_56 = eq(mem_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 100:33]
              node _io_wb_memory_read_data_T_57 = mux(UInt<1>("h0"), UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 101:23]
              node _io_wb_memory_read_data_T_58 = bits(io.bus.read_data, 15, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 101:38]
              node _io_wb_memory_read_data_T_59 = cat(_io_wb_memory_read_data_T_57, _io_wb_memory_read_data_T_58) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 101:18]
              node _io_wb_memory_read_data_T_60 = mux(UInt<1>("h0"), UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 102:23]
              node _io_wb_memory_read_data_T_61 = bits(io.bus.read_data, 31, 16) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 102:38]
              node _io_wb_memory_read_data_T_62 = cat(_io_wb_memory_read_data_T_60, _io_wb_memory_read_data_T_61) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 102:18]
              node _io_wb_memory_read_data_T_63 = mux(_io_wb_memory_read_data_T_56, _io_wb_memory_read_data_T_59, _io_wb_memory_read_data_T_62) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 99:41]
              node _io_wb_memory_read_data_T_64 = eq(UInt<1>("h0"), io.funct3) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_65 = mux(_io_wb_memory_read_data_T_64, _io_wb_memory_read_data_T_25, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_66 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_67 = mux(_io_wb_memory_read_data_T_66, _io_wb_memory_read_data_T_43, _io_wb_memory_read_data_T_65) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_68 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_69 = mux(_io_wb_memory_read_data_T_68, _io_wb_memory_read_data_T_55, _io_wb_memory_read_data_T_67) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_70 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_71 = mux(_io_wb_memory_read_data_T_70, _io_wb_memory_read_data_T_63, _io_wb_memory_read_data_T_69) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_72 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              node _io_wb_memory_read_data_T_73 = mux(_io_wb_memory_read_data_T_72, io.bus.read_data, _io_wb_memory_read_data_T_71) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:60]
              io.wb_memory_read_data <= _io_wb_memory_read_data_T_73 @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 78:32]
              mem_access_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 45:22]
              io.ctrl_stall_flag <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 46:24]
      else :
        when io.memory_write_enable : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 110:38]
          node _T_2 = eq(mem_access_state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:27]
          when _T_2 : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 111:56]
            io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 113:26]
            io.bus.write_data <= io.reg2_data @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 114:25]
            wire _WIRE_1 : UInt<1>[4] @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:37]
            _WIRE_1[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:37]
            _WIRE_1[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:37]
            _WIRE_1[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:37]
            _WIRE_1[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:37]
            io.bus.write_strobe <= _WIRE_1 @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 115:27]
            node _T_3 = eq(io.funct3, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 116:22]
            when _T_3 : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 116:48]
              io.bus.write_strobe[mem_address_index] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 117:48]
              node _io_bus_write_data_T = bits(io.reg2_data, 8, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:42]
              node _io_bus_write_data_T_1 = dshl(mem_address_index, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:89]
              node _io_bus_write_data_T_2 = dshl(_io_bus_write_data_T, _io_bus_write_data_T_1) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:67]
              io.bus.write_data <= _io_bus_write_data_T_2 @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 118:27]
            else :
              node _T_4 = eq(io.funct3, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 120:28]
              when _T_4 : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 120:54]
                node _T_5 = eq(mem_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 121:32]
                when _T_5 : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 121:41]
                  io.bus.write_strobe[0] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 123:36]
                  io.bus.write_strobe[1] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 123:36]
                  node _io_bus_write_data_T_3 = bits(io.reg2_data, 16, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 125:44]
                  io.bus.write_data <= _io_bus_write_data_T_3 @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 125:29]
                else :
                  io.bus.write_strobe[2] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 128:36]
                  io.bus.write_strobe[3] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 128:36]
                  node _io_bus_write_data_T_4 = bits(io.reg2_data, 16, 0) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 130:44]
                  node _io_bus_write_data_T_5 = shl(_io_bus_write_data_T_4, 16) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 130:95]
                  io.bus.write_data <= _io_bus_write_data_T_5 @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 130:29]
              else :
                node _T_6 = eq(io.funct3, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 133:28]
                when _T_6 : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 133:54]
                  io.bus.write_strobe[0] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 135:34]
                  io.bus.write_strobe[1] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 135:34]
                  io.bus.write_strobe[2] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 135:34]
                  io.bus.write_strobe[3] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 135:34]
            io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 138:22]
            when io.bus.granted : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 139:28]
              io.bus.write <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 140:22]
              mem_access_state <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 141:26]
          else :
            node _T_7 = eq(mem_access_state, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 143:33]
            when _T_7 : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 143:63]
              io.bus.request <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 144:22]
              io.ctrl_stall_flag <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 145:26]
              io.bus.write <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 146:20]
              when io.bus.write_valid : @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 147:32]
                mem_access_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 45:22]
                io.ctrl_stall_flag <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 46:24]
    node _io_forward_data_T = eq(io.regs_write_source, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 153:47]
    node _io_forward_data_T_1 = mux(_io_forward_data_T, io.csr_read_data, io.alu_result) @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 153:25]
    io.forward_data <= _io_forward_data_T_1 @[src/main/scala/riscv/core/fivestage/MemoryAccess.scala 153:19]

  module PipelineRegister_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module PipelineRegister_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip flush_enable : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 28:20]
    when io.write_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 29:25]
      reg <= io.in @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 30:9]
    else :
      when io.flush_enable : @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 31:31]
        reg <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 32:9]
    io.out <= reg @[src/main/scala/riscv/core/fivestage/PipelineRegister.scala 34:10]

  module MEM2WB :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction_address : UInt<32>, flip alu_result : UInt<32>, flip regs_write_enable : UInt<1>, flip regs_write_source : UInt<2>, flip regs_write_address : UInt<32>, flip memory_read_data : UInt<32>, flip csr_read_data : UInt<32>, output_instruction_address : UInt<32>, output_alu_result : UInt<32>, output_regs_write_enable : UInt<1>, output_regs_write_source : UInt<2>, output_regs_write_address : UInt<32>, output_memory_read_data : UInt<32>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 21:14]

    inst alu_result of PipelineRegister_29 @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 41:26]
    alu_result.clock <= clock
    alu_result.reset <= reset
    alu_result.io.in <= io.alu_result @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 42:20]
    alu_result.io.write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 43:30]
    alu_result.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 44:30]
    io.output_alu_result <= alu_result.io.out @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 45:24]
    inst memory_read_data of PipelineRegister_30 @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 47:32]
    memory_read_data.clock <= clock
    memory_read_data.reset <= reset
    memory_read_data.io.in <= io.memory_read_data @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 48:26]
    memory_read_data.io.write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 49:36]
    memory_read_data.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 50:36]
    io.output_memory_read_data <= memory_read_data.io.out @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 51:30]
    inst regs_write_enable of PipelineRegister_31 @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 53:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 54:27]
    regs_write_enable.io.write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 55:37]
    regs_write_enable.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 56:37]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 57:31]
    inst regs_write_source of PipelineRegister_32 @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 59:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 60:27]
    regs_write_source.io.write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 61:37]
    regs_write_source.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 62:37]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 63:31]
    inst regs_write_address of PipelineRegister_33 @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 65:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 66:28]
    regs_write_address.io.write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 67:38]
    regs_write_address.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 68:38]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 69:32]
    inst instruction_address of PipelineRegister_34 @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 71:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 72:29]
    instruction_address.io.write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 73:39]
    instruction_address.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 74:39]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 75:33]
    inst csr_read_data of PipelineRegister_35 @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 77:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 78:23]
    csr_read_data.io.write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 79:33]
    csr_read_data.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 80:33]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/fivestage/MEM2WB.scala 81:27]

  module WriteBack :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction_address : UInt<32>, flip alu_result : UInt<32>, flip memory_read_data : UInt<32>, flip regs_write_source : UInt<2>, flip csr_read_data : UInt<32>, regs_write_data : UInt<32>} @[src/main/scala/riscv/core/fivestage/WriteBack.scala 22:14]

    node _io_regs_write_data_T = add(io.instruction_address, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 35:72]
    node _io_regs_write_data_T_1 = tail(_io_regs_write_data_T, 1) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 35:72]
    node _io_regs_write_data_T_2 = eq(UInt<2>("h1"), io.regs_write_source) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
    node _io_regs_write_data_T_3 = mux(_io_regs_write_data_T_2, io.memory_read_data, io.alu_result) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
    node _io_regs_write_data_T_4 = eq(UInt<2>("h2"), io.regs_write_source) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
    node _io_regs_write_data_T_5 = mux(_io_regs_write_data_T_4, io.csr_read_data, _io_regs_write_data_T_3) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
    node _io_regs_write_data_T_6 = eq(UInt<2>("h3"), io.regs_write_source) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
    node _io_regs_write_data_T_7 = mux(_io_regs_write_data_T_6, _io_regs_write_data_T_1, _io_regs_write_data_T_5) @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:71]
    io.regs_write_data <= _io_regs_write_data_T_7 @[src/main/scala/riscv/core/fivestage/WriteBack.scala 31:22]

  module Forwarding :
    input clock : Clock
    input reset : Reset
    output io : { flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip rs1_ex : UInt<5>, flip rs2_ex : UInt<5>, flip rd_mem : UInt<5>, flip reg_write_enable_mem : UInt<1>, flip rd_wb : UInt<5>, flip reg_write_enable_wb : UInt<1>, reg1_forward_id : UInt<2>, reg2_forward_id : UInt<2>, reg1_forward_ex : UInt<2>, reg2_forward_ex : UInt<2>} @[src/main/scala/riscv/core/fivestage/Forwarding.scala 27:14]

    node _T = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 43:45]
    node _T_1 = and(io.reg_write_enable_mem, _T) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 43:32]
    node _T_2 = eq(io.rd_mem, io.rs1_id) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 43:66]
    node _T_3 = and(_T_1, _T_2) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 43:53]
    when _T_3 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 43:81]
      io.reg1_forward_id <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 44:24]
    else :
      node _T_4 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 45:49]
      node _T_5 = and(io.reg_write_enable_wb, _T_4) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 45:37]
      node _T_6 = eq(io.rd_wb, io.rs1_id) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 45:69]
      node _T_7 = and(_T_5, _T_6) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 45:57]
      when _T_7 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 45:84]
        io.reg1_forward_id <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 46:24]
      else :
        io.reg1_forward_id <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 48:24]
    node _T_8 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 51:45]
    node _T_9 = and(io.reg_write_enable_mem, _T_8) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 51:32]
    node _T_10 = eq(io.rd_mem, io.rs2_id) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 51:66]
    node _T_11 = and(_T_9, _T_10) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 51:53]
    when _T_11 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 51:81]
      io.reg2_forward_id <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 52:24]
    else :
      node _T_12 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 53:49]
      node _T_13 = and(io.reg_write_enable_wb, _T_12) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 53:37]
      node _T_14 = eq(io.rd_wb, io.rs2_id) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 53:69]
      node _T_15 = and(_T_13, _T_14) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 53:57]
      when _T_15 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 53:84]
        io.reg2_forward_id <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 54:24]
      else :
        io.reg2_forward_id <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 56:24]
    node _T_16 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 59:45]
    node _T_17 = and(io.reg_write_enable_mem, _T_16) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 59:32]
    node _T_18 = eq(io.rd_mem, io.rs1_ex) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 59:66]
    node _T_19 = and(_T_17, _T_18) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 59:53]
    when _T_19 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 59:81]
      io.reg1_forward_ex <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 60:24]
    else :
      node _T_20 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 61:49]
      node _T_21 = and(io.reg_write_enable_wb, _T_20) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 61:37]
      node _T_22 = eq(io.rd_wb, io.rs1_ex) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 61:69]
      node _T_23 = and(_T_21, _T_22) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 61:57]
      when _T_23 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 61:84]
        io.reg1_forward_ex <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 62:24]
      else :
        io.reg1_forward_ex <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 64:24]
    node _T_24 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 67:45]
    node _T_25 = and(io.reg_write_enable_mem, _T_24) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 67:32]
    node _T_26 = eq(io.rd_mem, io.rs2_ex) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 67:66]
    node _T_27 = and(_T_25, _T_26) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 67:53]
    when _T_27 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 67:81]
      io.reg2_forward_ex <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 68:24]
    else :
      node _T_28 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 69:49]
      node _T_29 = and(io.reg_write_enable_wb, _T_28) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 69:37]
      node _T_30 = eq(io.rd_wb, io.rs2_ex) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 69:69]
      node _T_31 = and(_T_29, _T_30) @[src/main/scala/riscv/core/fivestage/Forwarding.scala 69:57]
      when _T_31 : @[src/main/scala/riscv/core/fivestage/Forwarding.scala 69:84]
        io.reg2_forward_ex <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 70:24]
      else :
        io.reg2_forward_ex <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage/Forwarding.scala 72:24]


  module CLINT :
    input clock : Clock
    input reset : Reset
    output io : { flip interrupt_flag : UInt<32>, flip instruction : UInt<32>, flip instruction_address_if : UInt<32>, flip exception_signal : UInt<1>, flip instruction_address_cause_exception : UInt<32>, flip exception_cause : UInt<32>, flip exception_val : UInt<32>, exception_token : UInt<1>, flip jump_flag : UInt<1>, flip jump_address : UInt<32>, flip csr_mtvec : UInt<32>, flip csr_mepc : UInt<32>, flip csr_mstatus : UInt<32>, flip interrupt_enable : UInt<1>, ctrl_stall_flag : UInt<1>, csr_reg_write_enable : UInt<1>, csr_reg_write_address : UInt<12>, csr_reg_write_data : UInt<32>, id_interrupt_handler_address : UInt<32>, id_interrupt_assert : UInt<1>} @[src/main/scala/riscv/core/fivestage/CLINT.scala 49:14]

    wire interrupt_state : UInt @[src/main/scala/riscv/core/fivestage/CLINT.scala 86:33]
    interrupt_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 86:33]
    reg csr_state : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 87:26]
    reg instruction_address : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 88:36]
    reg cause : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 89:22]
    reg trap_val : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 90:25]
    reg interrupt_assert : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 91:33]
    reg interrupt_handler_address : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 92:42]
    reg csr_reg_write_enable : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 93:37]
    reg csr_reg_write_address : UInt<12>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 94:38]
    reg csr_reg_write_data : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 95:35]
    reg exception_token : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 96:32]
    reg exception_signal : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 97:33]
    node _io_ctrl_stall_flag_T = neq(interrupt_state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:42]
    node _io_ctrl_stall_flag_T_1 = neq(csr_state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:79]
    node _io_ctrl_stall_flag_T_2 = or(_io_ctrl_stall_flag_T, _io_ctrl_stall_flag_T_1) @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:66]
    node _io_ctrl_stall_flag_T_3 = eq(exception_token, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:101]
    node _io_ctrl_stall_flag_T_4 = and(_io_ctrl_stall_flag_T_2, _io_ctrl_stall_flag_T_3) @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:98]
    io.ctrl_stall_flag <= _io_ctrl_stall_flag_T_4 @[src/main/scala/riscv/core/fivestage/CLINT.scala 98:22]
    io.exception_token <= exception_token @[src/main/scala/riscv/core/fivestage/CLINT.scala 99:22]
    node _T = eq(csr_state, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:38]
    node _T_1 = and(exception_signal, _T) @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:25]
    when _T_1 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 101:59]
      exception_token <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CLINT.scala 102:21]
    else :
      exception_token <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 104:21]
    when exception_token : @[src/main/scala/riscv/core/fivestage/CLINT.scala 107:25]
      exception_signal <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 108:22]
    else :
      node _T_2 = eq(exception_signal, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 109:31]
      node _T_3 = and(_T_2, io.exception_signal) @[src/main/scala/riscv/core/fivestage/CLINT.scala 109:43]
      when _T_3 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 109:67]
        exception_signal <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CLINT.scala 110:22]
    node _T_4 = eq(io.instruction, UInt<32>("h73")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 115:43]
    node _T_5 = or(exception_signal, _T_4) @[src/main/scala/riscv/core/fivestage/CLINT.scala 115:25]
    node _T_6 = eq(io.instruction, UInt<32>("h100073")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 115:87]
    node _T_7 = or(_T_5, _T_6) @[src/main/scala/riscv/core/fivestage/CLINT.scala 115:69]
    when _T_7 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 115:115]
      interrupt_state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CLINT.scala 116:21]
    else :
      node _T_8 = neq(io.interrupt_flag, UInt<8>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 117:32]
      node _T_9 = and(_T_8, io.interrupt_enable) @[src/main/scala/riscv/core/fivestage/CLINT.scala 117:57]
      when _T_9 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 117:81]
        interrupt_state <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/CLINT.scala 118:21]
      else :
        node _T_10 = eq(io.instruction, UInt<32>("h30200073")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 119:29]
        when _T_10 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 119:55]
          interrupt_state <= UInt<2>("h3") @[src/main/scala/riscv/core/fivestage/CLINT.scala 120:21]
        else :
          interrupt_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 122:21]
    node _T_11 = eq(csr_state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 126:18]
    when _T_11 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 126:37]
      node _T_12 = eq(interrupt_state, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 127:26]
      when _T_12 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 127:57]
        csr_state <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/CLINT.scala 129:17]
        node _instruction_address_T = sub(io.jump_address, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 136:27]
        node _instruction_address_T_1 = tail(_instruction_address_T, 1) @[src/main/scala/riscv/core/fivestage/CLINT.scala 136:27]
        node _instruction_address_T_2 = mux(io.jump_flag, _instruction_address_T_1, io.instruction_address_if) @[src/main/scala/riscv/core/fivestage/CLINT.scala 134:12]
        node _instruction_address_T_3 = mux(exception_signal, io.instruction_address_cause_exception, _instruction_address_T_2) @[src/main/scala/riscv/core/fivestage/CLINT.scala 131:33]
        instruction_address <= _instruction_address_T_3 @[src/main/scala/riscv/core/fivestage/CLINT.scala 131:27]
        node _cause_T = eq(UInt<32>("h73"), io.instruction) @[src/main/scala/riscv/core/fivestage/CLINT.scala 144:40]
        node _cause_T_1 = mux(_cause_T, UInt<4>("hb"), UInt<4>("ha")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 144:40]
        node _cause_T_2 = eq(UInt<32>("h100073"), io.instruction) @[src/main/scala/riscv/core/fivestage/CLINT.scala 144:40]
        node _cause_T_3 = mux(_cause_T_2, UInt<2>("h3"), _cause_T_1) @[src/main/scala/riscv/core/fivestage/CLINT.scala 144:40]
        node _cause_T_4 = mux(exception_signal, io.exception_cause, _cause_T_3) @[src/main/scala/riscv/core/fivestage/CLINT.scala 141:19]
        cause <= _cause_T_4 @[src/main/scala/riscv/core/fivestage/CLINT.scala 141:13]
        node _trap_val_T = mux(exception_signal, io.exception_val, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 154:22]
        trap_val <= _trap_val_T @[src/main/scala/riscv/core/fivestage/CLINT.scala 154:16]
      else :
        node _T_13 = eq(interrupt_state, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 159:32]
        when _T_13 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 159:64]
          cause <= UInt<32>("h8000000b") @[src/main/scala/riscv/core/fivestage/CLINT.scala 161:13]
          node _T_14 = bits(io.interrupt_flag, 0, 0) @[src/main/scala/riscv/core/fivestage/CLINT.scala 162:29]
          when _T_14 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 162:34]
            cause <= UInt<32>("h80000007") @[src/main/scala/riscv/core/fivestage/CLINT.scala 163:15]
          trap_val <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 165:16]
          csr_state <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/CLINT.scala 166:17]
          node _instruction_address_T_4 = mux(io.jump_flag, io.jump_address, io.instruction_address_if) @[src/main/scala/riscv/core/fivestage/CLINT.scala 167:33]
          instruction_address <= _instruction_address_T_4 @[src/main/scala/riscv/core/fivestage/CLINT.scala 167:27]
        else :
          node _T_15 = eq(interrupt_state, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 172:32]
          when _T_15 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 172:57]
            csr_state <= UInt<2>("h3") @[src/main/scala/riscv/core/fivestage/CLINT.scala 174:17]
    else :
      node _T_16 = eq(csr_state, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 176:24]
      when _T_16 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 176:43]
        csr_state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CLINT.scala 177:15]
      else :
        node _T_17 = eq(csr_state, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 178:24]
        when _T_17 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 178:46]
          csr_state <= UInt<3>("h5") @[src/main/scala/riscv/core/fivestage/CLINT.scala 179:15]
        else :
          node _T_18 = eq(csr_state, UInt<3>("h5")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 180:24]
          when _T_18 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 180:44]
            csr_state <= UInt<3>("h4") @[src/main/scala/riscv/core/fivestage/CLINT.scala 181:15]
          else :
            node _T_19 = eq(csr_state, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 182:24]
            when _T_19 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 182:45]
              csr_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 183:15]
            else :
              node _T_20 = eq(csr_state, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 184:24]
              when _T_20 : @[src/main/scala/riscv/core/fivestage/CLINT.scala 184:43]
                csr_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 185:15]
              else :
                csr_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CLINT.scala 187:15]
    node _csr_reg_write_enable_T = neq(csr_state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 190:37]
    csr_reg_write_enable <= _csr_reg_write_enable_T @[src/main/scala/riscv/core/fivestage/CLINT.scala 190:24]
    node _csr_reg_write_address_T = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:36]
    node _csr_reg_write_address_T_1 = eq(UInt<2>("h2"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_2 = mux(_csr_reg_write_address_T_1, UInt<12>("h341"), UInt<12>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_3 = eq(UInt<3>("h4"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_4 = mux(_csr_reg_write_address_T_3, UInt<12>("h342"), _csr_reg_write_address_T_2) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_5 = eq(UInt<1>("h1"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_6 = mux(_csr_reg_write_address_T_5, UInt<12>("h300"), _csr_reg_write_address_T_4) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_7 = eq(UInt<2>("h3"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_8 = mux(_csr_reg_write_address_T_7, UInt<12>("h300"), _csr_reg_write_address_T_6) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_9 = eq(UInt<3>("h5"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_10 = mux(_csr_reg_write_address_T_9, UInt<12>("h343"), _csr_reg_write_address_T_8) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:110]
    node _csr_reg_write_address_T_11 = cat(_csr_reg_write_address_T, _csr_reg_write_address_T_10) @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:31]
    csr_reg_write_address <= _csr_reg_write_address_T_11 @[src/main/scala/riscv/core/fivestage/CLINT.scala 191:25]
    node _csr_reg_write_data_T = bits(io.csr_mstatus, 31, 4) @[src/main/scala/riscv/core/fivestage/CLINT.scala 205:45]
    node _csr_reg_write_data_T_1 = bits(io.csr_mstatus, 2, 0) @[src/main/scala/riscv/core/fivestage/CLINT.scala 205:78]
    node csr_reg_write_data_hi = cat(_csr_reg_write_data_T, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 205:30]
    node _csr_reg_write_data_T_2 = cat(csr_reg_write_data_hi, _csr_reg_write_data_T_1) @[src/main/scala/riscv/core/fivestage/CLINT.scala 205:30]
    node _csr_reg_write_data_T_3 = bits(io.csr_mstatus, 31, 4) @[src/main/scala/riscv/core/fivestage/CLINT.scala 206:42]
    node _csr_reg_write_data_T_4 = bits(io.csr_mstatus, 7, 7) @[src/main/scala/riscv/core/fivestage/CLINT.scala 206:65]
    node _csr_reg_write_data_T_5 = bits(io.csr_mstatus, 2, 0) @[src/main/scala/riscv/core/fivestage/CLINT.scala 206:84]
    node csr_reg_write_data_hi_1 = cat(_csr_reg_write_data_T_3, _csr_reg_write_data_T_4) @[src/main/scala/riscv/core/fivestage/CLINT.scala 206:27]
    node _csr_reg_write_data_T_6 = cat(csr_reg_write_data_hi_1, _csr_reg_write_data_T_5) @[src/main/scala/riscv/core/fivestage/CLINT.scala 206:27]
    node _csr_reg_write_data_T_7 = eq(UInt<2>("h2"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_8 = mux(_csr_reg_write_data_T_7, instruction_address, UInt<32>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_9 = eq(UInt<3>("h4"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_10 = mux(_csr_reg_write_data_T_9, cause, _csr_reg_write_data_T_8) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_11 = eq(UInt<1>("h1"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_12 = mux(_csr_reg_write_data_T_11, _csr_reg_write_data_T_2, _csr_reg_write_data_T_10) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_13 = eq(UInt<2>("h3"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_14 = mux(_csr_reg_write_data_T_13, _csr_reg_write_data_T_6, _csr_reg_write_data_T_12) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_15 = eq(UInt<3>("h5"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    node _csr_reg_write_data_T_16 = mux(_csr_reg_write_data_T_15, trap_val, _csr_reg_write_data_T_14) @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:72]
    csr_reg_write_data <= _csr_reg_write_data_T_16 @[src/main/scala/riscv/core/fivestage/CLINT.scala 201:22]
    io.csr_reg_write_enable <= csr_reg_write_enable @[src/main/scala/riscv/core/fivestage/CLINT.scala 211:27]
    io.csr_reg_write_address <= csr_reg_write_address @[src/main/scala/riscv/core/fivestage/CLINT.scala 212:28]
    io.csr_reg_write_data <= csr_reg_write_data @[src/main/scala/riscv/core/fivestage/CLINT.scala 213:25]
    node _interrupt_assert_T = eq(csr_state, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 215:33]
    node _interrupt_assert_T_1 = eq(csr_state, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 215:66]
    node _interrupt_assert_T_2 = or(_interrupt_assert_T, _interrupt_assert_T_1) @[src/main/scala/riscv/core/fivestage/CLINT.scala 215:53]
    interrupt_assert <= _interrupt_assert_T_2 @[src/main/scala/riscv/core/fivestage/CLINT.scala 215:20]
    node _interrupt_handler_address_T = eq(UInt<3>("h4"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 216:79]
    node _interrupt_handler_address_T_1 = mux(_interrupt_handler_address_T, io.csr_mtvec, UInt<32>("h0")) @[src/main/scala/riscv/core/fivestage/CLINT.scala 216:79]
    node _interrupt_handler_address_T_2 = eq(UInt<2>("h3"), csr_state) @[src/main/scala/riscv/core/fivestage/CLINT.scala 216:79]
    node _interrupt_handler_address_T_3 = mux(_interrupt_handler_address_T_2, io.csr_mepc, _interrupt_handler_address_T_1) @[src/main/scala/riscv/core/fivestage/CLINT.scala 216:79]
    interrupt_handler_address <= _interrupt_handler_address_T_3 @[src/main/scala/riscv/core/fivestage/CLINT.scala 216:29]
    io.id_interrupt_assert <= interrupt_assert @[src/main/scala/riscv/core/fivestage/CLINT.scala 223:26]
    io.id_interrupt_handler_address <= interrupt_handler_address @[src/main/scala/riscv/core/fivestage/CLINT.scala 224:35]

  module CSR :
    input clock : Clock
    input reset : Reset
    output io : { flip reg_write_enable_ex : UInt<1>, flip reg_read_address_id : UInt<12>, flip reg_write_address_ex : UInt<12>, flip reg_write_data_ex : UInt<32>, flip reg_write_enable_clint : UInt<1>, flip reg_read_address_clint : UInt<12>, flip reg_write_address_clint : UInt<12>, flip reg_write_data_clint : UInt<32>, interrupt_enable : UInt<1>, mmu_enable : UInt<1>, id_reg_data : UInt<32>, start_paging : UInt<1>, clint_reg_data : UInt<32>, clint_csr_mtvec : UInt<32>, clint_csr_mepc : UInt<32>, clint_csr_mstatus : UInt<32>, mmu_csr_satp : UInt<32>} @[src/main/scala/riscv/core/fivestage/CSR.scala 37:14]

    reg cycles : UInt<64>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 62:23]
    reg mtvec : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 63:22]
    reg mcause : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 64:23]
    reg mepc : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 65:21]
    reg mie : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 66:20]
    reg mstatus : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 67:24]
    reg mscratch : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 68:25]
    reg mtval : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 69:22]
    reg satp : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 70:21]
    node _cycles_T = add(cycles, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CSR.scala 72:20]
    node _cycles_T_1 = tail(_cycles_T, 1) @[src/main/scala/riscv/core/fivestage/CSR.scala 72:20]
    cycles <= _cycles_T_1 @[src/main/scala/riscv/core/fivestage/CSR.scala 72:10]
    io.clint_csr_mtvec <= mtvec @[src/main/scala/riscv/core/fivestage/CSR.scala 73:22]
    io.clint_csr_mepc <= mepc @[src/main/scala/riscv/core/fivestage/CSR.scala 74:21]
    io.clint_csr_mstatus <= mstatus @[src/main/scala/riscv/core/fivestage/CSR.scala 75:24]
    node _io_interrupt_enable_T = bits(mstatus, 3, 3) @[src/main/scala/riscv/core/fivestage/CSR.scala 76:33]
    node _io_interrupt_enable_T_1 = eq(_io_interrupt_enable_T, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CSR.scala 76:37]
    io.interrupt_enable <= _io_interrupt_enable_T_1 @[src/main/scala/riscv/core/fivestage/CSR.scala 76:23]
    io.mmu_csr_satp <= satp @[src/main/scala/riscv/core/fivestage/CSR.scala 77:19]
    node _io_mmu_enable_T = bits(satp, 31, 31) @[src/main/scala/riscv/core/fivestage/CSR.scala 78:24]
    node _io_mmu_enable_T_1 = eq(_io_mmu_enable_T, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CSR.scala 78:29]
    io.mmu_enable <= _io_mmu_enable_T_1 @[src/main/scala/riscv/core/fivestage/CSR.scala 78:17]
    io.start_paging <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CSR.scala 79:19]
    wire reg_write_address : UInt<12> @[src/main/scala/riscv/core/fivestage/CSR.scala 81:31]
    wire reg_write_data : UInt<32> @[src/main/scala/riscv/core/fivestage/CSR.scala 82:28]
    reg_write_address <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CSR.scala 83:21]
    reg_write_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CSR.scala 84:18]
    wire reg_read_address : UInt<12> @[src/main/scala/riscv/core/fivestage/CSR.scala 86:30]
    wire reg_read_data : UInt<32> @[src/main/scala/riscv/core/fivestage/CSR.scala 87:27]
    reg_read_address <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CSR.scala 88:20]
    reg_read_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CSR.scala 89:17]
    when io.reg_write_enable_ex : @[src/main/scala/riscv/core/fivestage/CSR.scala 91:32]
      node _reg_write_address_T = bits(io.reg_write_address_ex, 11, 0) @[src/main/scala/riscv/core/fivestage/CSR.scala 92:49]
      reg_write_address <= _reg_write_address_T @[src/main/scala/riscv/core/fivestage/CSR.scala 92:23]
      reg_write_data <= io.reg_write_data_ex @[src/main/scala/riscv/core/fivestage/CSR.scala 93:20]
    else :
      when io.reg_write_enable_clint : @[src/main/scala/riscv/core/fivestage/CSR.scala 94:41]
        node _reg_write_address_T_1 = bits(io.reg_write_address_clint, 11, 0) @[src/main/scala/riscv/core/fivestage/CSR.scala 95:52]
        reg_write_address <= _reg_write_address_T_1 @[src/main/scala/riscv/core/fivestage/CSR.scala 95:23]
        reg_write_data <= io.reg_write_data_clint @[src/main/scala/riscv/core/fivestage/CSR.scala 96:20]
    node _T = eq(reg_write_address, UInt<12>("h305")) @[src/main/scala/riscv/core/fivestage/CSR.scala 99:26]
    when _T : @[src/main/scala/riscv/core/fivestage/CSR.scala 99:49]
      mtvec <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 100:11]
    else :
      node _T_1 = eq(reg_write_address, UInt<12>("h342")) @[src/main/scala/riscv/core/fivestage/CSR.scala 101:32]
      when _T_1 : @[src/main/scala/riscv/core/fivestage/CSR.scala 101:56]
        mcause <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 102:12]
      else :
        node _T_2 = eq(reg_write_address, UInt<12>("h341")) @[src/main/scala/riscv/core/fivestage/CSR.scala 103:32]
        when _T_2 : @[src/main/scala/riscv/core/fivestage/CSR.scala 103:54]
          mepc <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 104:10]
        else :
          node _T_3 = eq(reg_write_address, UInt<12>("h304")) @[src/main/scala/riscv/core/fivestage/CSR.scala 105:32]
          when _T_3 : @[src/main/scala/riscv/core/fivestage/CSR.scala 105:53]
            mie <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 106:9]
          else :
            node _T_4 = eq(reg_write_address, UInt<12>("h300")) @[src/main/scala/riscv/core/fivestage/CSR.scala 107:32]
            when _T_4 : @[src/main/scala/riscv/core/fivestage/CSR.scala 107:57]
              mstatus <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 108:13]
            else :
              node _T_5 = eq(reg_write_address, UInt<12>("h340")) @[src/main/scala/riscv/core/fivestage/CSR.scala 109:32]
              when _T_5 : @[src/main/scala/riscv/core/fivestage/CSR.scala 109:58]
                mscratch <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 110:14]
              else :
                node _T_6 = eq(reg_write_address, UInt<12>("h343")) @[src/main/scala/riscv/core/fivestage/CSR.scala 111:32]
                when _T_6 : @[src/main/scala/riscv/core/fivestage/CSR.scala 111:55]
                  mtval <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 112:11]
                else :
                  node _T_7 = eq(reg_write_address, UInt<12>("h180")) @[src/main/scala/riscv/core/fivestage/CSR.scala 113:32]
                  when _T_7 : @[src/main/scala/riscv/core/fivestage/CSR.scala 113:54]
                    satp <= reg_write_data @[src/main/scala/riscv/core/fivestage/CSR.scala 114:10]
                    node _T_8 = bits(reg_write_data, 31, 31) @[src/main/scala/riscv/core/fivestage/CSR.scala 115:24]
                    node _T_9 = eq(_T_8, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CSR.scala 115:29]
                    node _T_10 = bits(satp, 31, 31) @[src/main/scala/riscv/core/fivestage/CSR.scala 115:44]
                    node _T_11 = eq(_T_10, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 115:49]
                    node _T_12 = and(_T_9, _T_11) @[src/main/scala/riscv/core/fivestage/CSR.scala 115:37]
                    when _T_12 : @[src/main/scala/riscv/core/fivestage/CSR.scala 115:58]
                      io.start_paging <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CSR.scala 116:23]
    node _T_13 = bits(cycles, 31, 0) @[src/main/scala/riscv/core/fivestage/CSR.scala 122:35]
    node _T_14 = bits(cycles, 63, 32) @[src/main/scala/riscv/core/fivestage/CSR.scala 123:35]
    node _io_id_reg_data_T = eq(UInt<12>("hc00"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_1 = mux(_io_id_reg_data_T, _T_13, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_2 = eq(UInt<12>("hc80"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_3 = mux(_io_id_reg_data_T_2, _T_14, _io_id_reg_data_T_1) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_4 = eq(UInt<12>("h305"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_5 = mux(_io_id_reg_data_T_4, mtvec, _io_id_reg_data_T_3) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_6 = eq(UInt<12>("h342"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_7 = mux(_io_id_reg_data_T_6, mcause, _io_id_reg_data_T_5) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_8 = eq(UInt<12>("h341"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_9 = mux(_io_id_reg_data_T_8, mepc, _io_id_reg_data_T_7) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_10 = eq(UInt<12>("h304"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_11 = mux(_io_id_reg_data_T_10, mie, _io_id_reg_data_T_9) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_12 = eq(UInt<12>("h300"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_13 = mux(_io_id_reg_data_T_12, mstatus, _io_id_reg_data_T_11) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_14 = eq(UInt<12>("h340"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_15 = mux(_io_id_reg_data_T_14, mscratch, _io_id_reg_data_T_13) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_16 = eq(UInt<12>("h343"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_17 = mux(_io_id_reg_data_T_16, mtval, _io_id_reg_data_T_15) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_18 = eq(UInt<12>("h180"), io.reg_read_address_id) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    node _io_id_reg_data_T_19 = mux(_io_id_reg_data_T_18, satp, _io_id_reg_data_T_17) @[src/main/scala/riscv/core/fivestage/CSR.scala 134:59]
    io.id_reg_data <= _io_id_reg_data_T_19 @[src/main/scala/riscv/core/fivestage/CSR.scala 134:18]
    node _io_clint_reg_data_T = eq(UInt<12>("hc00"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_1 = mux(_io_clint_reg_data_T, _T_13, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_2 = eq(UInt<12>("hc80"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_3 = mux(_io_clint_reg_data_T_2, _T_14, _io_clint_reg_data_T_1) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_4 = eq(UInt<12>("h305"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_5 = mux(_io_clint_reg_data_T_4, mtvec, _io_clint_reg_data_T_3) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_6 = eq(UInt<12>("h342"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_7 = mux(_io_clint_reg_data_T_6, mcause, _io_clint_reg_data_T_5) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_8 = eq(UInt<12>("h341"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_9 = mux(_io_clint_reg_data_T_8, mepc, _io_clint_reg_data_T_7) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_10 = eq(UInt<12>("h304"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_11 = mux(_io_clint_reg_data_T_10, mie, _io_clint_reg_data_T_9) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_12 = eq(UInt<12>("h300"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_13 = mux(_io_clint_reg_data_T_12, mstatus, _io_clint_reg_data_T_11) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_14 = eq(UInt<12>("h340"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_15 = mux(_io_clint_reg_data_T_14, mscratch, _io_clint_reg_data_T_13) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_16 = eq(UInt<12>("h343"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_17 = mux(_io_clint_reg_data_T_16, mtval, _io_clint_reg_data_T_15) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_18 = eq(UInt<12>("h180"), io.reg_read_address_clint) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    node _io_clint_reg_data_T_19 = mux(_io_clint_reg_data_T_18, satp, _io_clint_reg_data_T_17) @[src/main/scala/riscv/core/fivestage/CSR.scala 138:65]
    io.clint_reg_data <= _io_clint_reg_data_T_19 @[src/main/scala/riscv/core/fivestage/CSR.scala 138:21]

  module AXI4LiteMaster :
    input clock : Clock
    input reset : Reset
    output io : { channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { flip read : UInt<1>, flip write : UInt<1>, read_data : UInt<32>, flip write_data : UInt<32>, flip write_strobe : UInt<1>[4], flip address : UInt<32>, busy : UInt<1>, read_valid : UInt<1>, write_valid : UInt<1>}} @[src/main/scala/bus/AXI4Lite.scala 215:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 219:22]
    node _io_bundle_busy_T = neq(state, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 220:27]
    io.bundle.busy <= _io_bundle_busy_T @[src/main/scala/bus/AXI4Lite.scala 220:18]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 222:21]
    reg read_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 223:27]
    io.bundle.read_valid <= read_valid @[src/main/scala/bus/AXI4Lite.scala 224:24]
    reg write_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 225:28]
    io.bundle.write_valid <= write_valid @[src/main/scala/bus/AXI4Lite.scala 226:25]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 227:27]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 228:29]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 229:26]
    io.channels.read_address_channel.ARADDR <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 231:43]
    reg ARVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 232:24]
    io.channels.read_address_channel.ARVALID <= ARVALID @[src/main/scala/bus/AXI4Lite.scala 233:44]
    io.channels.read_address_channel.ARPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 234:43]
    reg RREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 235:23]
    io.channels.read_data_channel.RREADY <= RREADY @[src/main/scala/bus/AXI4Lite.scala 236:40]
    io.bundle.read_data <= io.channels.read_data_channel.RDATA @[src/main/scala/bus/AXI4Lite.scala 238:23]
    reg AWVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 239:24]
    io.channels.write_address_channel.AWADDR <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 240:44]
    io.channels.write_address_channel.AWVALID <= AWVALID @[src/main/scala/bus/AXI4Lite.scala 241:45]
    reg WVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 242:23]
    io.channels.write_data_channel.WVALID <= WVALID @[src/main/scala/bus/AXI4Lite.scala 243:41]
    io.channels.write_data_channel.WDATA <= write_data @[src/main/scala/bus/AXI4Lite.scala 244:40]
    io.channels.write_address_channel.AWPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 245:44]
    node io_channels_write_data_channel_WSTRB_lo = cat(write_strobe[1], write_strobe[0]) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    node io_channels_write_data_channel_WSTRB_hi = cat(write_strobe[3], write_strobe[2]) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    node _io_channels_write_data_channel_WSTRB_T = cat(io_channels_write_data_channel_WSTRB_hi, io_channels_write_data_channel_WSTRB_lo) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    io.channels.write_data_channel.WSTRB <= _io_channels_write_data_channel_WSTRB_T @[src/main/scala/bus/AXI4Lite.scala 246:40]
    reg BREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 247:23]
    io.channels.write_response_channel.BREADY <= BREADY @[src/main/scala/bus/AXI4Lite.scala 248:45]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
      WVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 252:14]
      AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 253:15]
      ARVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 254:15]
      RREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 255:14]
      read_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 256:18]
      write_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 257:19]
      when io.bundle.write : @[src/main/scala/bus/AXI4Lite.scala 258:29]
        state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 259:15]
        addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 260:14]
        write_data <= io.bundle.write_data @[src/main/scala/bus/AXI4Lite.scala 261:20]
        write_strobe <= io.bundle.write_strobe @[src/main/scala/bus/AXI4Lite.scala 262:22]
      else :
        when io.bundle.read : @[src/main/scala/bus/AXI4Lite.scala 263:34]
          state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 264:15]
          addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 265:14]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
        ARVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 269:15]
        io.channels.read_address_channel.ARADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 270:47]
        node _T_6 = and(io.channels.read_address_channel.ARREADY, ARVALID) @[src/main/scala/bus/AXI4Lite.scala 271:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 271:65]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 272:15]
          io.channels.read_address_channel.ARADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 273:49]
          ARVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 274:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_10 = eq(io.channels.read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 278:88]
          node _T_11 = and(io.channels.read_data_channel.RVALID, _T_10) @[src/main/scala/bus/AXI4Lite.scala 278:49]
          when _T_11 : @[src/main/scala/bus/AXI4Lite.scala 278:97]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 279:15]
            read_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 280:20]
            RREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 281:16]
            read_data <= io.channels.read_data_channel.RDATA @[src/main/scala/bus/AXI4Lite.scala 282:19]
        else :
          node _T_12 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_13 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_14 = eq(_T_12, _T_13) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
            AWVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 286:15]
            io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 287:48]
            node _T_15 = and(io.channels.write_address_channel.AWREADY, AWVALID) @[src/main/scala/bus/AXI4Lite.scala 288:54]
            when _T_15 : @[src/main/scala/bus/AXI4Lite.scala 288:66]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 289:15]
              io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 290:50]
              AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 291:17]
          else :
            node _T_16 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            node _T_17 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            node _T_18 = eq(_T_16, _T_17) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
              WVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 295:14]
              io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 296:48]
              node _T_19 = and(io.channels.write_data_channel.WREADY, WVALID) @[src/main/scala/bus/AXI4Lite.scala 297:50]
              when _T_19 : @[src/main/scala/bus/AXI4Lite.scala 297:61]
                io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 298:50]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 299:15]
                WVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 300:16]
            else :
              node _T_20 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              node _T_21 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              node _T_22 = eq(_T_20, _T_21) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              when _T_22 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
                BREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 304:14]
                node _T_23 = and(io.channels.write_response_channel.BVALID, BREADY) @[src/main/scala/bus/AXI4Lite.scala 305:54]
                when _T_23 : @[src/main/scala/bus/AXI4Lite.scala 305:65]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 306:15]
                  write_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 307:21]
                  BREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 308:16]


  module MMU :
    input clock : Clock
    input reset : Reset
    output io : { flip instructions : UInt<32>, flip instructions_address : UInt<32>, flip ppn_from_satp : UInt<20>, flip virtual_address : UInt<32>, flip mmu_occupied_by_mem : UInt<1>, flip restart : UInt<1>, restart_done : UInt<1>, pa_valid : UInt<1>, pa : UInt<32>, page_fault_signals : UInt<1>, va_cause_page_fault : UInt<32>, ecause : UInt<32>, epc : UInt<32>, flip page_fault_responed : UInt<1>, bus : { read : UInt<1>, address : UInt<32>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], flip write_valid : UInt<1>, flip busy : UInt<1>, request : UInt<1>, flip granted : UInt<1>}} @[src/main/scala/riscv/core/fivestage/MMU.scala 14:14]

    node opcode = bits(io.instructions, 6, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 37:31]
    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 39:22]
    reg pa : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 41:19]
    node vpn1 = bits(io.virtual_address, 31, 22) @[src/main/scala/riscv/core/fivestage/MMU.scala 43:16]
    node vpn0 = bits(io.virtual_address, 21, 12) @[src/main/scala/riscv/core/fivestage/MMU.scala 45:16]
    node pageoffset = bits(io.virtual_address, 11, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 46:22]
    reg pte1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pte1) @[src/main/scala/riscv/core/fivestage/MMU.scala 48:17]
    reg pte0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pte0) @[src/main/scala/riscv/core/fivestage/MMU.scala 49:17]
    reg page_fault_signals : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 51:35]
    io.pa_valid <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 77:15]
    io.bus.request <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 78:18]
    io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 79:15]
    io.bus.address <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 80:18]
    io.bus.write_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 81:21]
    wire _WIRE : UInt<1>[4] @[src/main/scala/riscv/core/fivestage/MMU.scala 82:33]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 82:33]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 82:33]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 82:33]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 82:33]
    io.bus.write_strobe <= _WIRE @[src/main/scala/riscv/core/fivestage/MMU.scala 82:23]
    io.bus.write <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 83:16]
    io.page_fault_signals <= page_fault_signals @[src/main/scala/riscv/core/fivestage/MMU.scala 84:25]
    io.ecause <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 86:13]
    io.pa <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 87:9]
    io.restart_done <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 88:19]
    io.va_cause_page_fault <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 89:26]
    io.epc <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 90:10]
    when io.bus.granted : @[src/main/scala/riscv/core/fivestage/MMU.scala 94:24]
      node _T = eq(state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 95:16]
      when _T : @[src/main/scala/riscv/core/fivestage/MMU.scala 95:36]
        io.pa_valid <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 98:19]
        io.bus.read <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 99:19]
        io.restart_done <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 100:23]
        node _io_bus_address_T = dshl(io.ppn_from_satp, UInt<4>("hc")) @[src/main/scala/riscv/core/fivestage/MMU.scala 101:44]
        node _io_bus_address_T_1 = shl(vpn1, 2) @[src/main/scala/riscv/core/fivestage/MMU.scala 101:91]
        node _io_bus_address_T_2 = and(_io_bus_address_T, _io_bus_address_T_1) @[src/main/scala/riscv/core/fivestage/MMU.scala 101:83]
        io.bus.address <= _io_bus_address_T_2 @[src/main/scala/riscv/core/fivestage/MMU.scala 101:22]
        state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 103:13]
      else :
        node _T_1 = eq(state, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/MMU.scala 104:22]
        when _T_1 : @[src/main/scala/riscv/core/fivestage/MMU.scala 104:44]
          io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 106:19]
          when io.bus.read_valid : @[src/main/scala/riscv/core/fivestage/MMU.scala 107:31]
            pte1 <= io.bus.read_data @[src/main/scala/riscv/core/fivestage/MMU.scala 108:14]
            when io.restart : @[src/main/scala/riscv/core/fivestage/MMU.scala 109:26]
              io.restart_done <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 110:27]
              state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 111:17]
            else :
              state <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/MMU.scala 113:17]
        else :
          node _T_2 = eq(state, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/MMU.scala 116:22]
          when _T_2 : @[src/main/scala/riscv/core/fivestage/MMU.scala 116:47]
            when io.restart : @[src/main/scala/riscv/core/fivestage/MMU.scala 118:24]
              io.restart_done <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 119:25]
              state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 120:15]
            else :
              node _T_3 = bits(pte1, 0, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:22]
              node _T_4 = eq(_T_3, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:26]
              node _T_5 = bits(pte1, 2, 1) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:42]
              node _T_6 = eq(_T_5, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:49]
              node _T_7 = or(_T_4, _T_6) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:34]
              node _T_8 = bits(pte1, 9, 8) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:70]
              node _T_9 = neq(_T_8, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:77]
              node _T_10 = or(_T_7, _T_9) @[src/main/scala/riscv/core/fivestage/MMU.scala 121:62]
              when _T_10 : @[src/main/scala/riscv/core/fivestage/MMU.scala 121:91]
                node _io_ecause_T = eq(UInt<6>("h23"), io.instructions) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                node _io_ecause_T_1 = mux(_io_ecause_T, UInt<4>("hf"), UInt<4>("ha")) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                node _io_ecause_T_2 = eq(UInt<2>("h3"), io.instructions) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                node _io_ecause_T_3 = mux(_io_ecause_T_2, UInt<4>("hd"), _io_ecause_T_1) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                node _io_ecause_T_4 = mux(io.mmu_occupied_by_mem, _io_ecause_T_3, UInt<4>("hc")) @[src/main/scala/riscv/core/fivestage/MMU.scala 54:21]
                io.ecause <= _io_ecause_T_4 @[src/main/scala/riscv/core/fivestage/MMU.scala 54:15]
                io.va_cause_page_fault <= io.virtual_address @[src/main/scala/riscv/core/fivestage/MMU.scala 64:28]
                page_fault_signals <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 65:24]
                node _io_epc_T = mux(io.mmu_occupied_by_mem, io.instructions_address, io.virtual_address) @[src/main/scala/riscv/core/fivestage/MMU.scala 66:18]
                io.epc <= _io_epc_T @[src/main/scala/riscv/core/fivestage/MMU.scala 66:12]
                when io.page_fault_responed : @[src/main/scala/riscv/core/fivestage/MMU.scala 71:34]
                  page_fault_signals <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 72:26]
                  state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 73:13]
              else :
                io.bus.read <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 125:21]
                node _io_bus_address_T_3 = bits(pte1, 29, 10) @[src/main/scala/riscv/core/fivestage/MMU.scala 126:33]
                node _io_bus_address_T_4 = dshl(_io_bus_address_T_3, UInt<4>("hc")) @[src/main/scala/riscv/core/fivestage/MMU.scala 126:42]
                node _io_bus_address_T_5 = shl(vpn0, 2) @[src/main/scala/riscv/core/fivestage/MMU.scala 126:89]
                node _io_bus_address_T_6 = and(_io_bus_address_T_4, _io_bus_address_T_5) @[src/main/scala/riscv/core/fivestage/MMU.scala 126:81]
                io.bus.address <= _io_bus_address_T_6 @[src/main/scala/riscv/core/fivestage/MMU.scala 126:24]
                when io.bus.granted : @[src/main/scala/riscv/core/fivestage/MMU.scala 128:30]
                  state <= UInt<2>("h3") @[src/main/scala/riscv/core/fivestage/MMU.scala 129:17]
          else :
            node _T_11 = eq(state, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/MMU.scala 132:22]
            when _T_11 : @[src/main/scala/riscv/core/fivestage/MMU.scala 132:44]
              io.bus.read <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 133:19]
              when io.bus.read_valid : @[src/main/scala/riscv/core/fivestage/MMU.scala 134:31]
                pte0 <= io.bus.read_data @[src/main/scala/riscv/core/fivestage/MMU.scala 135:14]
                when io.restart : @[src/main/scala/riscv/core/fivestage/MMU.scala 136:26]
                  io.restart_done <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 137:27]
                  state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 138:17]
                else :
                  state <= UInt<3>("h4") @[src/main/scala/riscv/core/fivestage/MMU.scala 140:17]
            else :
              node _T_12 = eq(state, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/MMU.scala 143:22]
              when _T_12 : @[src/main/scala/riscv/core/fivestage/MMU.scala 143:47]
                when io.restart : @[src/main/scala/riscv/core/fivestage/MMU.scala 144:24]
                  io.restart_done <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 145:25]
                  state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 146:15]
                else :
                  node _T_13 = bits(pte0, 0, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:22]
                  node _T_14 = eq(_T_13, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:26]
                  node _T_15 = bits(pte0, 2, 1) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:42]
                  node _T_16 = eq(_T_15, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:49]
                  node _T_17 = or(_T_14, _T_16) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:34]
                  node _T_18 = bits(pte0, 9, 8) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:70]
                  node _T_19 = neq(_T_18, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:77]
                  node _T_20 = or(_T_17, _T_19) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:62]
                  node _T_21 = bits(pte0, 3, 1) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:98]
                  node _T_22 = eq(_T_21, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:105]
                  node _T_23 = or(_T_20, _T_22) @[src/main/scala/riscv/core/fivestage/MMU.scala 147:90]
                  when _T_23 : @[src/main/scala/riscv/core/fivestage/MMU.scala 147:120]
                    node _io_ecause_T_5 = eq(UInt<6>("h23"), io.instructions) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                    node _io_ecause_T_6 = mux(_io_ecause_T_5, UInt<4>("hf"), UInt<4>("ha")) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                    node _io_ecause_T_7 = eq(UInt<2>("h3"), io.instructions) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                    node _io_ecause_T_8 = mux(_io_ecause_T_7, UInt<4>("hd"), _io_ecause_T_6) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                    node _io_ecause_T_9 = mux(io.mmu_occupied_by_mem, _io_ecause_T_8, UInt<4>("hc")) @[src/main/scala/riscv/core/fivestage/MMU.scala 54:21]
                    io.ecause <= _io_ecause_T_9 @[src/main/scala/riscv/core/fivestage/MMU.scala 54:15]
                    io.va_cause_page_fault <= io.virtual_address @[src/main/scala/riscv/core/fivestage/MMU.scala 64:28]
                    page_fault_signals <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 65:24]
                    node _io_epc_T_1 = mux(io.mmu_occupied_by_mem, io.instructions_address, io.virtual_address) @[src/main/scala/riscv/core/fivestage/MMU.scala 66:18]
                    io.epc <= _io_epc_T_1 @[src/main/scala/riscv/core/fivestage/MMU.scala 66:12]
                    when io.page_fault_responed : @[src/main/scala/riscv/core/fivestage/MMU.scala 71:34]
                      page_fault_signals <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 72:26]
                      state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 73:13]
                  else :
                    node _T_24 = bits(pte0, 1, 1) @[src/main/scala/riscv/core/fivestage/MMU.scala 150:22]
                    node _T_25 = eq(_T_24, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/MMU.scala 150:26]
                    node _T_26 = bits(pte0, 3, 3) @[src/main/scala/riscv/core/fivestage/MMU.scala 150:41]
                    node _T_27 = eq(_T_26, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/MMU.scala 150:45]
                    node _T_28 = or(_T_25, _T_27) @[src/main/scala/riscv/core/fivestage/MMU.scala 150:34]
                    when _T_28 : @[src/main/scala/riscv/core/fivestage/MMU.scala 150:54]
                      node _instructionInvalid_T = eq(io.mmu_occupied_by_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 152:57]
                      node _instructionInvalid_T_1 = bits(pte0, 3, 3) @[src/main/scala/riscv/core/fivestage/MMU.scala 152:76]
                      node _instructionInvalid_T_2 = eq(_instructionInvalid_T_1, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 152:80]
                      node instructionInvalid = and(_instructionInvalid_T, _instructionInvalid_T_2) @[src/main/scala/riscv/core/fivestage/MMU.scala 152:69]
                      node _storeInvalid_T = bits(io.instructions, 6, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 153:43]
                      node _storeInvalid_T_1 = eq(_storeInvalid_T, UInt<6>("h23")) @[src/main/scala/riscv/core/fivestage/MMU.scala 153:50]
                      node _storeInvalid_T_2 = bits(pte0, 2, 2) @[src/main/scala/riscv/core/fivestage/MMU.scala 153:80]
                      node _storeInvalid_T_3 = eq(_storeInvalid_T_2, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 153:84]
                      node storeInvalid = and(_storeInvalid_T_1, _storeInvalid_T_3) @[src/main/scala/riscv/core/fivestage/MMU.scala 153:73]
                      node _loadInvalid_T = bits(io.instructions, 6, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 154:42]
                      node _loadInvalid_T_1 = eq(_loadInvalid_T, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/MMU.scala 154:49]
                      node _loadInvalid_T_2 = bits(pte0, 1, 1) @[src/main/scala/riscv/core/fivestage/MMU.scala 154:79]
                      node _loadInvalid_T_3 = eq(_loadInvalid_T_2, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 154:83]
                      node loadInvalid = and(_loadInvalid_T_1, _loadInvalid_T_3) @[src/main/scala/riscv/core/fivestage/MMU.scala 154:72]
                      node _T_29 = or(instructionInvalid, storeInvalid) @[src/main/scala/riscv/core/fivestage/MMU.scala 155:33]
                      node _T_30 = or(_T_29, loadInvalid) @[src/main/scala/riscv/core/fivestage/MMU.scala 155:49]
                      when _T_30 : @[src/main/scala/riscv/core/fivestage/MMU.scala 155:65]
                        node _io_ecause_T_10 = eq(UInt<6>("h23"), io.instructions) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                        node _io_ecause_T_11 = mux(_io_ecause_T_10, UInt<4>("hf"), UInt<4>("ha")) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                        node _io_ecause_T_12 = eq(UInt<2>("h3"), io.instructions) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                        node _io_ecause_T_13 = mux(_io_ecause_T_12, UInt<4>("hd"), _io_ecause_T_11) @[src/main/scala/riscv/core/fivestage/MMU.scala 56:39]
                        node _io_ecause_T_14 = mux(io.mmu_occupied_by_mem, _io_ecause_T_13, UInt<4>("hc")) @[src/main/scala/riscv/core/fivestage/MMU.scala 54:21]
                        io.ecause <= _io_ecause_T_14 @[src/main/scala/riscv/core/fivestage/MMU.scala 54:15]
                        io.va_cause_page_fault <= io.virtual_address @[src/main/scala/riscv/core/fivestage/MMU.scala 64:28]
                        page_fault_signals <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 65:24]
                        node _io_epc_T_2 = mux(io.mmu_occupied_by_mem, io.instructions_address, io.virtual_address) @[src/main/scala/riscv/core/fivestage/MMU.scala 66:18]
                        io.epc <= _io_epc_T_2 @[src/main/scala/riscv/core/fivestage/MMU.scala 66:12]
                        when io.page_fault_responed : @[src/main/scala/riscv/core/fivestage/MMU.scala 71:34]
                          page_fault_signals <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 72:26]
                          state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 73:13]
                      else :
                        node _T_31 = bits(pte0, 6, 6) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:24]
                        node _T_32 = eq(_T_31, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:28]
                        node _T_33 = bits(pte0, 7, 7) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:44]
                        node _T_34 = eq(_T_33, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:48]
                        node _T_35 = bits(io.instructions, 6, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:74]
                        node _T_36 = eq(_T_35, UInt<6>("h23")) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:81]
                        node _T_37 = and(_T_34, _T_36) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:56]
                        node _T_38 = or(_T_32, _T_37) @[src/main/scala/riscv/core/fivestage/MMU.scala 158:36]
                        when _T_38 : @[src/main/scala/riscv/core/fivestage/MMU.scala 158:106]
                          node _setAbit_T = bits(io.instructions, 6, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 163:40]
                          node setAbit = eq(_setAbit_T, UInt<6>("h23")) @[src/main/scala/riscv/core/fivestage/MMU.scala 163:47]
                          node _io_bus_write_data_T = bits(pte0, 31, 8) @[src/main/scala/riscv/core/fivestage/MMU.scala 164:40]
                          node _io_bus_write_data_T_1 = bits(pte0, 5, 0) @[src/main/scala/riscv/core/fivestage/MMU.scala 164:72]
                          node io_bus_write_data_lo = cat(UInt<1>("h1"), _io_bus_write_data_T_1) @[src/main/scala/riscv/core/fivestage/MMU.scala 164:35]
                          node io_bus_write_data_hi = cat(_io_bus_write_data_T, setAbit) @[src/main/scala/riscv/core/fivestage/MMU.scala 164:35]
                          node _io_bus_write_data_T_2 = cat(io_bus_write_data_hi, io_bus_write_data_lo) @[src/main/scala/riscv/core/fivestage/MMU.scala 164:35]
                          io.bus.write_data <= _io_bus_write_data_T_2 @[src/main/scala/riscv/core/fivestage/MMU.scala 164:29]
                          io.bus.write <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 165:24]
                          node _io_bus_address_T_7 = bits(pte1, 29, 10) @[src/main/scala/riscv/core/fivestage/MMU.scala 166:35]
                          node _io_bus_address_T_8 = dshl(_io_bus_address_T_7, UInt<4>("hc")) @[src/main/scala/riscv/core/fivestage/MMU.scala 166:44]
                          node _io_bus_address_T_9 = shl(vpn0, 2) @[src/main/scala/riscv/core/fivestage/MMU.scala 166:91]
                          node _io_bus_address_T_10 = add(_io_bus_address_T_8, _io_bus_address_T_9) @[src/main/scala/riscv/core/fivestage/MMU.scala 166:83]
                          node _io_bus_address_T_11 = tail(_io_bus_address_T_10, 1) @[src/main/scala/riscv/core/fivestage/MMU.scala 166:83]
                          io.bus.address <= _io_bus_address_T_11 @[src/main/scala/riscv/core/fivestage/MMU.scala 166:26]
                          io.bus.write_strobe[0] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 168:36]
                          io.bus.write_strobe[1] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 168:36]
                          io.bus.write_strobe[2] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 168:36]
                          io.bus.write_strobe[3] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 168:36]
                          state <= UInt<3>("h5") @[src/main/scala/riscv/core/fivestage/MMU.scala 170:17]
                        else :
                          state <= UInt<3>("h6") @[src/main/scala/riscv/core/fivestage/MMU.scala 172:17]
              else :
                node _T_39 = eq(state, UInt<3>("h5")) @[src/main/scala/riscv/core/fivestage/MMU.scala 175:22]
                when _T_39 : @[src/main/scala/riscv/core/fivestage/MMU.scala 175:46]
                  io.bus.write <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 176:20]
                  when io.bus.write_valid : @[src/main/scala/riscv/core/fivestage/MMU.scala 177:32]
                    when io.restart : @[src/main/scala/riscv/core/fivestage/MMU.scala 178:26]
                      io.restart_done <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 179:27]
                      state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 180:17]
                    else :
                      state <= UInt<3>("h6") @[src/main/scala/riscv/core/fivestage/MMU.scala 182:17]
                else :
                  node _T_40 = eq(state, UInt<3>("h6")) @[src/main/scala/riscv/core/fivestage/MMU.scala 185:22]
                  when _T_40 : @[src/main/scala/riscv/core/fivestage/MMU.scala 185:55]
                    when io.restart : @[src/main/scala/riscv/core/fivestage/MMU.scala 186:24]
                      io.restart_done <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 187:25]
                      state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 188:15]
                    else :
                      node _io_pa_T = bits(pte0, 29, 10) @[src/main/scala/riscv/core/fivestage/MMU.scala 190:26]
                      node _io_pa_T_1 = cat(_io_pa_T, pageoffset) @[src/main/scala/riscv/core/fivestage/MMU.scala 190:21]
                      io.pa <= _io_pa_T_1 @[src/main/scala/riscv/core/fivestage/MMU.scala 190:15]
                      io.pa_valid <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/MMU.scala 191:21]
                      state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/MMU.scala 192:15]


  module CPU :
    input clock : Clock
    input reset : Reset
    output io : { axi4_channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bus_address : UInt<32>, flip interrupt_flag : UInt<32>, flip stall_flag_bus : UInt<1>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>, flip instruction_valid : UInt<1>, bus_busy : UInt<1>, debug : UInt<32>[6]} @[src/main/scala/riscv/core/fivestage/CPU.scala 31:14]

    inst ctrl of Control @[src/main/scala/riscv/core/fivestage/CPU.scala 33:20]
    ctrl.clock <= clock
    ctrl.reset <= reset
    inst regs of RegisterFile @[src/main/scala/riscv/core/fivestage/CPU.scala 34:20]
    regs.clock <= clock
    regs.reset <= reset
    inst inst_fetch of InstructionFetch @[src/main/scala/riscv/core/fivestage/CPU.scala 35:26]
    inst_fetch.clock <= clock
    inst_fetch.reset <= reset
    inst if2id of IF2ID @[src/main/scala/riscv/core/fivestage/CPU.scala 36:21]
    if2id.clock <= clock
    if2id.reset <= reset
    inst id of InstructionDecode @[src/main/scala/riscv/core/fivestage/CPU.scala 37:18]
    id.clock <= clock
    id.reset <= reset
    inst id2ex of ID2EX @[src/main/scala/riscv/core/fivestage/CPU.scala 38:21]
    id2ex.clock <= clock
    id2ex.reset <= reset
    inst ex of Execute @[src/main/scala/riscv/core/fivestage/CPU.scala 39:18]
    ex.clock <= clock
    ex.reset <= reset
    inst ex2mem of EX2MEM @[src/main/scala/riscv/core/fivestage/CPU.scala 40:22]
    ex2mem.clock <= clock
    ex2mem.reset <= reset
    inst mem of MemoryAccess @[src/main/scala/riscv/core/fivestage/CPU.scala 41:19]
    mem.clock <= clock
    mem.reset <= reset
    inst mem2wb of MEM2WB @[src/main/scala/riscv/core/fivestage/CPU.scala 42:22]
    mem2wb.clock <= clock
    mem2wb.reset <= reset
    inst wb of WriteBack @[src/main/scala/riscv/core/fivestage/CPU.scala 43:18]
    wb.clock <= clock
    wb.reset <= reset
    inst forwarding of Forwarding @[src/main/scala/riscv/core/fivestage/CPU.scala 44:26]
    forwarding.clock <= clock
    forwarding.reset <= reset
    inst clint of CLINT @[src/main/scala/riscv/core/fivestage/CPU.scala 45:21]
    clint.clock <= clock
    clint.reset <= reset
    inst csr_regs of CSR @[src/main/scala/riscv/core/fivestage/CPU.scala 46:24]
    csr_regs.clock <= clock
    csr_regs.reset <= reset
    inst axi4_master of AXI4LiteMaster @[src/main/scala/riscv/core/fivestage/CPU.scala 47:27]
    axi4_master.clock <= clock
    axi4_master.reset <= reset
    inst mmu of MMU @[src/main/scala/riscv/core/fivestage/CPU.scala 48:19]
    mmu.clock <= clock
    mmu.reset <= reset
    axi4_master.io.channels.read_data_channel.RRESP <= io.axi4_channels.read_data_channel.RRESP @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    axi4_master.io.channels.read_data_channel.RDATA <= io.axi4_channels.read_data_channel.RDATA @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.read_data_channel.RREADY <= axi4_master.io.channels.read_data_channel.RREADY @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    axi4_master.io.channels.read_data_channel.RVALID <= io.axi4_channels.read_data_channel.RVALID @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.read_address_channel.ARPROT <= axi4_master.io.channels.read_address_channel.ARPROT @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.read_address_channel.ARADDR <= axi4_master.io.channels.read_address_channel.ARADDR @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    axi4_master.io.channels.read_address_channel.ARREADY <= io.axi4_channels.read_address_channel.ARREADY @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.read_address_channel.ARVALID <= axi4_master.io.channels.read_address_channel.ARVALID @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    axi4_master.io.channels.write_response_channel.BRESP <= io.axi4_channels.write_response_channel.BRESP @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.write_response_channel.BREADY <= axi4_master.io.channels.write_response_channel.BREADY @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    axi4_master.io.channels.write_response_channel.BVALID <= io.axi4_channels.write_response_channel.BVALID @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.write_data_channel.WSTRB <= axi4_master.io.channels.write_data_channel.WSTRB @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.write_data_channel.WDATA <= axi4_master.io.channels.write_data_channel.WDATA @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    axi4_master.io.channels.write_data_channel.WREADY <= io.axi4_channels.write_data_channel.WREADY @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.write_data_channel.WVALID <= axi4_master.io.channels.write_data_channel.WVALID @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.write_address_channel.AWPROT <= axi4_master.io.channels.write_address_channel.AWPROT @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.write_address_channel.AWADDR <= axi4_master.io.channels.write_address_channel.AWADDR @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    axi4_master.io.channels.write_address_channel.AWREADY <= io.axi4_channels.write_address_channel.AWREADY @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.axi4_channels.write_address_channel.AWVALID <= axi4_master.io.channels.write_address_channel.AWVALID @[src/main/scala/riscv/core/fivestage/CPU.scala 49:27]
    io.debug[0] <= ex.io.reg1_data @[src/main/scala/riscv/core/fivestage/CPU.scala 50:15]
    io.debug[1] <= ex.io.reg2_data @[src/main/scala/riscv/core/fivestage/CPU.scala 51:15]
    io.debug[2] <= ex.io.instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 52:15]
    io.debug[3] <= ex.io.instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 53:15]
    io.debug[4] <= inst_fetch.io.jump_address_id @[src/main/scala/riscv/core/fivestage/CPU.scala 54:15]
    io.debug[5] <= inst_fetch.io.jump_flag_id @[src/main/scala/riscv/core/fivestage/CPU.scala 55:15]
    io.bus_busy <= axi4_master.io.bundle.busy @[src/main/scala/riscv/core/fivestage/CPU.scala 56:15]
    reg bus_granted : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 58:28]
    reg mem_access_state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 59:33]
    reg virtual_address : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 60:32]
    reg physical_address : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 61:33]
    reg mmu_restart : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 62:28]
    reg pending : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 63:24]
    node _T = eq(mem_access_state, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 66:25]
    when _T : @[src/main/scala/riscv/core/fivestage/CPU.scala 66:50]
      bus_granted <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 67:17]
      node _T_1 = eq(axi4_master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 68:10]
      node _T_2 = eq(axi4_master.io.bundle.read_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 68:41]
      node _T_3 = and(_T_1, _T_2) @[src/main/scala/riscv/core/fivestage/CPU.scala 68:38]
      when _T_3 : @[src/main/scala/riscv/core/fivestage/CPU.scala 68:76]
        when csr_regs.io.mmu_enable : @[src/main/scala/riscv/core/fivestage/CPU.scala 69:36]
          when mem.io.bus.request : @[src/main/scala/riscv/core/fivestage/CPU.scala 70:34]
            mem_access_state <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/CPU.scala 71:28]
            bus_granted <= UInt<2>("h3") @[src/main/scala/riscv/core/fivestage/CPU.scala 72:23]
            virtual_address <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/fivestage/CPU.scala 73:27]
          else :
            node _T_4 = and(inst_fetch.io.bus.request, io.instruction_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 74:46]
            node _T_5 = and(_T_4, inst_fetch.io.pc_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 74:70]
            when _T_5 : @[src/main/scala/riscv/core/fivestage/CPU.scala 74:97]
              mem_access_state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 75:28]
              bus_granted <= UInt<3>("h4") @[src/main/scala/riscv/core/fivestage/CPU.scala 76:23]
              virtual_address <= inst_fetch.io.id_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 77:27]
        else :
          when mem.io.bus.request : @[src/main/scala/riscv/core/fivestage/CPU.scala 80:34]
            mem_access_state <= UInt<2>("h3") @[src/main/scala/riscv/core/fivestage/CPU.scala 81:28]
            physical_address <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/fivestage/CPU.scala 82:28]
            bus_granted <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/CPU.scala 83:23]
          else :
            node _T_6 = and(inst_fetch.io.bus.request, io.instruction_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 84:46]
            node _T_7 = and(_T_6, inst_fetch.io.pc_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 84:70]
            when _T_7 : @[src/main/scala/riscv/core/fivestage/CPU.scala 84:97]
              mem_access_state <= UInt<3>("h4") @[src/main/scala/riscv/core/fivestage/CPU.scala 85:28]
              bus_granted <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 86:23]
              physical_address <= inst_fetch.io.id_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 87:28]
    else :
      node _T_8 = eq(mem_access_state, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CPU.scala 91:31]
      when _T_8 : @[src/main/scala/riscv/core/fivestage/CPU.scala 91:73]
        when clint.io.exception_token : @[src/main/scala/riscv/core/fivestage/CPU.scala 92:36]
          mem_access_state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 93:24]
          bus_granted <= UInt<3>("h4") @[src/main/scala/riscv/core/fivestage/CPU.scala 94:19]
          virtual_address <= id.io.if_jump_address @[src/main/scala/riscv/core/fivestage/CPU.scala 95:23]
        else :
          when mmu.io.pa_valid : @[src/main/scala/riscv/core/fivestage/CPU.scala 96:33]
            mem_access_state <= UInt<2>("h3") @[src/main/scala/riscv/core/fivestage/CPU.scala 97:24]
            bus_granted <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/CPU.scala 98:19]
            physical_address <= mmu.io.pa @[src/main/scala/riscv/core/fivestage/CPU.scala 99:24]
      else :
        node _T_9 = eq(mem_access_state, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CPU.scala 101:31]
        when _T_9 : @[src/main/scala/riscv/core/fivestage/CPU.scala 101:72]
          when mem.io.bus.request : @[src/main/scala/riscv/core/fivestage/CPU.scala 103:30]
            mmu_restart <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 104:19]
            when mmu.io.restart_done : @[src/main/scala/riscv/core/fivestage/CPU.scala 105:33]
              mmu_restart <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 106:21]
              mem_access_state <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage/CPU.scala 107:26]
              bus_granted <= UInt<2>("h3") @[src/main/scala/riscv/core/fivestage/CPU.scala 108:21]
              virtual_address <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/fivestage/CPU.scala 109:25]
          else :
            when pending : @[src/main/scala/riscv/core/fivestage/CPU.scala 112:21]
              when mmu.io.restart_done : @[src/main/scala/riscv/core/fivestage/CPU.scala 113:35]
                mmu_restart <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 114:23]
                pending <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 115:19]
                mem_access_state <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 116:28]
                bus_granted <= UInt<3>("h4") @[src/main/scala/riscv/core/fivestage/CPU.scala 117:23]
                virtual_address <= inst_fetch.io.id_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 118:27]
            else :
              node _T_10 = eq(id.io.if_jump_flag, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 121:14]
              node _T_11 = and(_T_10, mmu.io.pa_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 121:34]
              when _T_11 : @[src/main/scala/riscv/core/fivestage/CPU.scala 121:54]
                mem_access_state <= UInt<3>("h4") @[src/main/scala/riscv/core/fivestage/CPU.scala 122:28]
                bus_granted <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 123:23]
                physical_address <= mmu.io.pa @[src/main/scala/riscv/core/fivestage/CPU.scala 124:28]
            when id.io.if_jump_flag : @[src/main/scala/riscv/core/fivestage/CPU.scala 128:32]
              mmu_restart <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 129:21]
              pending <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage/CPU.scala 130:17]
        else :
          node _T_12 = eq(mem_access_state, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 133:31]
          when _T_12 : @[src/main/scala/riscv/core/fivestage/CPU.scala 133:62]
            node _T_13 = or(mem.io.bus.read_valid, mem.io.bus.write_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 134:32]
            when _T_13 : @[src/main/scala/riscv/core/fivestage/CPU.scala 134:59]
              mem_access_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 135:24]
              bus_granted <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 136:19]
          else :
            node _T_14 = eq(mem_access_state, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CPU.scala 138:31]
            when _T_14 : @[src/main/scala/riscv/core/fivestage/CPU.scala 138:61]
              when inst_fetch.io.bus.read_valid : @[src/main/scala/riscv/core/fivestage/CPU.scala 139:40]
                bus_granted <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 140:19]
                mem_access_state <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 141:24]
    node _T_15 = eq(bus_granted, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CPU.scala 145:20]
    node _T_16 = eq(bus_granted, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 145:65]
    node _T_17 = or(_T_15, _T_16) @[src/main/scala/riscv/core/fivestage/CPU.scala 145:50]
    when _T_17 : @[src/main/scala/riscv/core/fivestage/CPU.scala 145:97]
      io.bus_address <= mmu.io.bus.address @[src/main/scala/riscv/core/fivestage/CPU.scala 146:20]
      axi4_master.io.bundle.read <= mmu.io.bus.read @[src/main/scala/riscv/core/fivestage/CPU.scala 147:32]
      axi4_master.io.bundle.address <= mmu.io.bus.address @[src/main/scala/riscv/core/fivestage/CPU.scala 148:35]
      axi4_master.io.bundle.write <= mmu.io.bus.write @[src/main/scala/riscv/core/fivestage/CPU.scala 149:33]
      axi4_master.io.bundle.write_data <= mmu.io.bus.write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 150:38]
      axi4_master.io.bundle.write_strobe[0] <= mmu.io.bus.write_strobe[0] @[src/main/scala/riscv/core/fivestage/CPU.scala 151:40]
      axi4_master.io.bundle.write_strobe[1] <= mmu.io.bus.write_strobe[1] @[src/main/scala/riscv/core/fivestage/CPU.scala 151:40]
      axi4_master.io.bundle.write_strobe[2] <= mmu.io.bus.write_strobe[2] @[src/main/scala/riscv/core/fivestage/CPU.scala 151:40]
      axi4_master.io.bundle.write_strobe[3] <= mmu.io.bus.write_strobe[3] @[src/main/scala/riscv/core/fivestage/CPU.scala 151:40]
    else :
      node _T_18 = eq(bus_granted, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CPU.scala 152:26]
      when _T_18 : @[src/main/scala/riscv/core/fivestage/CPU.scala 152:54]
        io.bus_address <= mem.io.bus.address @[src/main/scala/riscv/core/fivestage/CPU.scala 153:20]
        axi4_master.io.bundle.read <= mem.io.bus.read @[src/main/scala/riscv/core/fivestage/CPU.scala 154:32]
        axi4_master.io.bundle.address <= mem.io.bus.address @[src/main/scala/riscv/core/fivestage/CPU.scala 155:35]
        axi4_master.io.bundle.write <= mem.io.bus.write @[src/main/scala/riscv/core/fivestage/CPU.scala 156:33]
        axi4_master.io.bundle.write_data <= mem.io.bus.write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 157:38]
        axi4_master.io.bundle.write_strobe[0] <= mem.io.bus.write_strobe[0] @[src/main/scala/riscv/core/fivestage/CPU.scala 158:40]
        axi4_master.io.bundle.write_strobe[1] <= mem.io.bus.write_strobe[1] @[src/main/scala/riscv/core/fivestage/CPU.scala 158:40]
        axi4_master.io.bundle.write_strobe[2] <= mem.io.bus.write_strobe[2] @[src/main/scala/riscv/core/fivestage/CPU.scala 158:40]
        axi4_master.io.bundle.write_strobe[3] <= mem.io.bus.write_strobe[3] @[src/main/scala/riscv/core/fivestage/CPU.scala 158:40]
      else :
        io.bus_address <= inst_fetch.io.bus.address @[src/main/scala/riscv/core/fivestage/CPU.scala 160:20]
        axi4_master.io.bundle.read <= inst_fetch.io.bus.read @[src/main/scala/riscv/core/fivestage/CPU.scala 161:32]
        axi4_master.io.bundle.address <= inst_fetch.io.bus.address @[src/main/scala/riscv/core/fivestage/CPU.scala 162:35]
        axi4_master.io.bundle.write <= inst_fetch.io.bus.write @[src/main/scala/riscv/core/fivestage/CPU.scala 163:33]
        axi4_master.io.bundle.write_data <= inst_fetch.io.bus.write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 164:38]
        axi4_master.io.bundle.write_strobe[0] <= inst_fetch.io.bus.write_strobe[0] @[src/main/scala/riscv/core/fivestage/CPU.scala 165:40]
        axi4_master.io.bundle.write_strobe[1] <= inst_fetch.io.bus.write_strobe[1] @[src/main/scala/riscv/core/fivestage/CPU.scala 165:40]
        axi4_master.io.bundle.write_strobe[2] <= inst_fetch.io.bus.write_strobe[2] @[src/main/scala/riscv/core/fivestage/CPU.scala 165:40]
        axi4_master.io.bundle.write_strobe[3] <= inst_fetch.io.bus.write_strobe[3] @[src/main/scala/riscv/core/fivestage/CPU.scala 165:40]
    node _inst_fetch_io_bus_read_valid_T = eq(bus_granted, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CPU.scala 169:17]
    node _inst_fetch_io_bus_read_valid_T_1 = and(_inst_fetch_io_bus_read_valid_T, io.instruction_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 169:43]
    node _inst_fetch_io_bus_read_valid_T_2 = mux(_inst_fetch_io_bus_read_valid_T_1, axi4_master.io.bundle.read_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 168:38]
    inst_fetch.io.bus.read_valid <= _inst_fetch_io_bus_read_valid_T_2 @[src/main/scala/riscv/core/fivestage/CPU.scala 168:32]
    node _inst_fetch_io_bus_read_data_T = eq(bus_granted, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CPU.scala 174:17]
    node _inst_fetch_io_bus_read_data_T_1 = and(_inst_fetch_io_bus_read_data_T, io.instruction_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 174:43]
    node _inst_fetch_io_bus_read_data_T_2 = mux(_inst_fetch_io_bus_read_data_T_1, axi4_master.io.bundle.read_data, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 173:37]
    inst_fetch.io.bus.read_data <= _inst_fetch_io_bus_read_data_T_2 @[src/main/scala/riscv/core/fivestage/CPU.scala 173:31]
    inst_fetch.io.bus.write_valid <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 178:33]
    node _inst_fetch_io_bus_busy_T = eq(bus_granted, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CPU.scala 180:17]
    node _inst_fetch_io_bus_busy_T_1 = and(_inst_fetch_io_bus_busy_T, io.instruction_valid) @[src/main/scala/riscv/core/fivestage/CPU.scala 180:43]
    node _inst_fetch_io_bus_busy_T_2 = mux(_inst_fetch_io_bus_busy_T_1, axi4_master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 179:32]
    inst_fetch.io.bus.busy <= _inst_fetch_io_bus_busy_T_2 @[src/main/scala/riscv/core/fivestage/CPU.scala 179:26]
    node _mem_io_bus_read_valid_T = eq(bus_granted, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CPU.scala 185:17]
    node _mem_io_bus_read_valid_T_1 = mux(_mem_io_bus_read_valid_T, axi4_master.io.bundle.read_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 184:31]
    mem.io.bus.read_valid <= _mem_io_bus_read_valid_T_1 @[src/main/scala/riscv/core/fivestage/CPU.scala 184:25]
    node _mem_io_bus_read_data_T = eq(bus_granted, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CPU.scala 190:17]
    node _mem_io_bus_read_data_T_1 = mux(_mem_io_bus_read_data_T, axi4_master.io.bundle.read_data, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 189:30]
    mem.io.bus.read_data <= _mem_io_bus_read_data_T_1 @[src/main/scala/riscv/core/fivestage/CPU.scala 189:24]
    node _mem_io_bus_write_valid_T = eq(bus_granted, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CPU.scala 195:17]
    node _mem_io_bus_write_valid_T_1 = mux(_mem_io_bus_write_valid_T, axi4_master.io.bundle.write_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 194:32]
    mem.io.bus.write_valid <= _mem_io_bus_write_valid_T_1 @[src/main/scala/riscv/core/fivestage/CPU.scala 194:26]
    node _mem_io_bus_busy_T = eq(bus_granted, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CPU.scala 200:17]
    node _mem_io_bus_busy_T_1 = mux(_mem_io_bus_busy_T, axi4_master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 199:25]
    mem.io.bus.busy <= _mem_io_bus_busy_T_1 @[src/main/scala/riscv/core/fivestage/CPU.scala 199:19]
    node _mmu_io_bus_read_valid_T = eq(bus_granted, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CPU.scala 205:17]
    node _mmu_io_bus_read_valid_T_1 = eq(bus_granted, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 205:62]
    node _mmu_io_bus_read_valid_T_2 = or(_mmu_io_bus_read_valid_T, _mmu_io_bus_read_valid_T_1) @[src/main/scala/riscv/core/fivestage/CPU.scala 205:47]
    node _mmu_io_bus_read_valid_T_3 = mux(_mmu_io_bus_read_valid_T_2, axi4_master.io.bundle.read_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 204:31]
    mmu.io.bus.read_valid <= _mmu_io_bus_read_valid_T_3 @[src/main/scala/riscv/core/fivestage/CPU.scala 204:25]
    node _mmu_io_bus_read_data_T = eq(bus_granted, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CPU.scala 210:17]
    node _mmu_io_bus_read_data_T_1 = eq(bus_granted, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 210:62]
    node _mmu_io_bus_read_data_T_2 = or(_mmu_io_bus_read_data_T, _mmu_io_bus_read_data_T_1) @[src/main/scala/riscv/core/fivestage/CPU.scala 210:47]
    node _mmu_io_bus_read_data_T_3 = mux(_mmu_io_bus_read_data_T_2, axi4_master.io.bundle.read_data, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 209:30]
    mmu.io.bus.read_data <= _mmu_io_bus_read_data_T_3 @[src/main/scala/riscv/core/fivestage/CPU.scala 209:24]
    node _mmu_io_bus_write_valid_T = eq(bus_granted, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CPU.scala 215:17]
    node _mmu_io_bus_write_valid_T_1 = eq(bus_granted, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 215:62]
    node _mmu_io_bus_write_valid_T_2 = or(_mmu_io_bus_write_valid_T, _mmu_io_bus_write_valid_T_1) @[src/main/scala/riscv/core/fivestage/CPU.scala 215:47]
    node _mmu_io_bus_write_valid_T_3 = mux(_mmu_io_bus_write_valid_T_2, axi4_master.io.bundle.write_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 214:32]
    mmu.io.bus.write_valid <= _mmu_io_bus_write_valid_T_3 @[src/main/scala/riscv/core/fivestage/CPU.scala 214:26]
    node _mmu_io_bus_busy_T = eq(bus_granted, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CPU.scala 220:17]
    node _mmu_io_bus_busy_T_1 = eq(bus_granted, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 220:62]
    node _mmu_io_bus_busy_T_2 = or(_mmu_io_bus_busy_T, _mmu_io_bus_busy_T_1) @[src/main/scala/riscv/core/fivestage/CPU.scala 220:47]
    node _mmu_io_bus_busy_T_3 = mux(_mmu_io_bus_busy_T_2, axi4_master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage/CPU.scala 219:25]
    mmu.io.bus.busy <= _mmu_io_bus_busy_T_3 @[src/main/scala/riscv/core/fivestage/CPU.scala 219:19]
    mmu.io.instructions <= ex2mem.io.output_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 225:23]
    mmu.io.instructions_address <= ex2mem.io.output_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 226:31]
    mmu.io.virtual_address <= virtual_address @[src/main/scala/riscv/core/fivestage/CPU.scala 227:26]
    node _mmu_io_bus_granted_T = eq(bus_granted, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 228:37]
    node _mmu_io_bus_granted_T_1 = eq(bus_granted, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage/CPU.scala 228:83]
    node _mmu_io_bus_granted_T_2 = or(_mmu_io_bus_granted_T, _mmu_io_bus_granted_T_1) @[src/main/scala/riscv/core/fivestage/CPU.scala 228:68]
    mmu.io.bus.granted <= _mmu_io_bus_granted_T_2 @[src/main/scala/riscv/core/fivestage/CPU.scala 228:22]
    mmu.io.page_fault_responed <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 229:30]
    node _mmu_io_ppn_from_satp_T = bits(csr_regs.io.mmu_csr_satp, 21, 0) @[src/main/scala/riscv/core/fivestage/CPU.scala 230:51]
    mmu.io.ppn_from_satp <= _mmu_io_ppn_from_satp_T @[src/main/scala/riscv/core/fivestage/CPU.scala 230:24]
    mmu.io.page_fault_responed <= clint.io.exception_token @[src/main/scala/riscv/core/fivestage/CPU.scala 231:30]
    node _mmu_io_mmu_occupied_by_mem_T = eq(bus_granted, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage/CPU.scala 232:45]
    mmu.io.mmu_occupied_by_mem <= _mmu_io_mmu_occupied_by_mem_T @[src/main/scala/riscv/core/fivestage/CPU.scala 232:30]
    mmu.io.restart <= mmu_restart @[src/main/scala/riscv/core/fivestage/CPU.scala 233:18]
    node _inst_fetch_io_bus_granted_T = eq(bus_granted, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage/CPU.scala 235:44]
    inst_fetch.io.bus.granted <= _inst_fetch_io_bus_granted_T @[src/main/scala/riscv/core/fivestage/CPU.scala 235:29]
    inst_fetch.io.physical_address <= physical_address @[src/main/scala/riscv/core/fivestage/CPU.scala 236:34]
    node _mem_io_bus_granted_T = eq(bus_granted, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage/CPU.scala 238:37]
    mem.io.bus.granted <= _mem_io_bus_granted_T @[src/main/scala/riscv/core/fivestage/CPU.scala 238:22]
    mem.io.physical_address <= physical_address @[src/main/scala/riscv/core/fivestage/CPU.scala 239:27]
    ctrl.io.jump_flag <= id.io.if_jump_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 241:21]
    ctrl.io.jump_instruction_id <= id.io.ctrl_jump_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 242:31]
    ctrl.io.stall_flag_if <= inst_fetch.io.ctrl_stall_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 243:25]
    ctrl.io.stall_flag_mem <= mem.io.ctrl_stall_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 244:26]
    ctrl.io.stall_flag_clint <= clint.io.ctrl_stall_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 245:28]
    ctrl.io.stall_flag_bus <= io.stall_flag_bus @[src/main/scala/riscv/core/fivestage/CPU.scala 246:26]
    ctrl.io.rs1_id <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage/CPU.scala 247:18]
    ctrl.io.rs2_id <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage/CPU.scala 248:18]
    ctrl.io.memory_read_enable_ex <= id2ex.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 249:33]
    ctrl.io.rd_ex <= id2ex.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 250:17]
    ctrl.io.memory_read_enable_mem <= ex2mem.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 251:34]
    ctrl.io.rd_mem <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 252:18]
    ctrl.io.csr_start_paging <= csr_regs.io.start_paging @[src/main/scala/riscv/core/fivestage/CPU.scala 253:28]
    regs.io.write_enable <= mem2wb.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 255:24]
    regs.io.write_address <= mem2wb.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 256:25]
    regs.io.write_data <= wb.io.regs_write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 257:22]
    regs.io.read_address1 <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage/CPU.scala 258:25]
    regs.io.read_address2 <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage/CPU.scala 259:25]
    regs.io.debug_read_address <= io.debug_read_address @[src/main/scala/riscv/core/fivestage/CPU.scala 261:30]
    io.debug_read_data <= regs.io.debug_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 262:22]
    inst_fetch.io.stall_flag_ctrl <= ctrl.io.pc_stall @[src/main/scala/riscv/core/fivestage/CPU.scala 264:33]
    inst_fetch.io.jump_flag_id <= id.io.if_jump_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 265:30]
    inst_fetch.io.jump_address_id <= id.io.if_jump_address @[src/main/scala/riscv/core/fivestage/CPU.scala 266:33]
    if2id.io.stall_flag <= ctrl.io.if_stall @[src/main/scala/riscv/core/fivestage/CPU.scala 268:23]
    if2id.io.flush_enable <= ctrl.io.if_flush @[src/main/scala/riscv/core/fivestage/CPU.scala 269:25]
    if2id.io.instruction <= inst_fetch.io.id_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 270:24]
    if2id.io.instruction_address <= inst_fetch.io.id_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 271:32]
    if2id.io.interrupt_flag <= io.interrupt_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 272:27]
    id.io.instruction <= if2id.io.output_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 274:21]
    id.io.instruction_address <= if2id.io.output_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 275:29]
    id.io.reg1_data <= regs.io.read_data1 @[src/main/scala/riscv/core/fivestage/CPU.scala 276:19]
    id.io.reg2_data <= regs.io.read_data2 @[src/main/scala/riscv/core/fivestage/CPU.scala 277:19]
    id.io.forward_from_mem <= mem.io.forward_data @[src/main/scala/riscv/core/fivestage/CPU.scala 278:26]
    id.io.forward_from_wb <= wb.io.regs_write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 279:25]
    id.io.reg1_forward <= forwarding.io.reg1_forward_id @[src/main/scala/riscv/core/fivestage/CPU.scala 280:22]
    id.io.reg2_forward <= forwarding.io.reg2_forward_id @[src/main/scala/riscv/core/fivestage/CPU.scala 281:22]
    id.io.interrupt_assert <= clint.io.id_interrupt_assert @[src/main/scala/riscv/core/fivestage/CPU.scala 282:26]
    id.io.interrupt_handler_address <= clint.io.id_interrupt_handler_address @[src/main/scala/riscv/core/fivestage/CPU.scala 283:35]
    id2ex.io.stall_flag <= ctrl.io.id_stall @[src/main/scala/riscv/core/fivestage/CPU.scala 285:23]
    id2ex.io.flush_enable <= ctrl.io.id_flush @[src/main/scala/riscv/core/fivestage/CPU.scala 286:25]
    id2ex.io.instruction <= if2id.io.output_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 287:24]
    id2ex.io.instruction_address <= if2id.io.output_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 288:32]
    id2ex.io.regs_write_enable <= id.io.ex_reg_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 289:30]
    id2ex.io.regs_write_address <= id.io.ex_reg_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 290:31]
    id2ex.io.regs_write_source <= id.io.ex_reg_write_source @[src/main/scala/riscv/core/fivestage/CPU.scala 291:30]
    id2ex.io.reg1_data <= regs.io.read_data1 @[src/main/scala/riscv/core/fivestage/CPU.scala 292:22]
    id2ex.io.reg2_data <= regs.io.read_data2 @[src/main/scala/riscv/core/fivestage/CPU.scala 293:22]
    id2ex.io.immediate <= id.io.ex_immediate @[src/main/scala/riscv/core/fivestage/CPU.scala 294:22]
    id2ex.io.aluop1_source <= id.io.ex_aluop1_source @[src/main/scala/riscv/core/fivestage/CPU.scala 295:26]
    id2ex.io.aluop2_source <= id.io.ex_aluop2_source @[src/main/scala/riscv/core/fivestage/CPU.scala 296:26]
    id2ex.io.csr_write_enable <= id.io.ex_csr_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 297:29]
    id2ex.io.csr_address <= id.io.ex_csr_address @[src/main/scala/riscv/core/fivestage/CPU.scala 298:24]
    id2ex.io.memory_read_enable <= id.io.ex_memory_read_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 299:31]
    id2ex.io.memory_write_enable <= id.io.ex_memory_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 300:32]
    id2ex.io.csr_read_data <= csr_regs.io.id_reg_data @[src/main/scala/riscv/core/fivestage/CPU.scala 301:26]
    ex.io.instruction <= id2ex.io.output_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 303:21]
    ex.io.instruction_address <= id2ex.io.output_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 304:29]
    ex.io.reg1_data <= id2ex.io.output_reg1_data @[src/main/scala/riscv/core/fivestage/CPU.scala 305:19]
    ex.io.reg2_data <= id2ex.io.output_reg2_data @[src/main/scala/riscv/core/fivestage/CPU.scala 306:19]
    ex.io.immediate <= id2ex.io.output_immediate @[src/main/scala/riscv/core/fivestage/CPU.scala 307:19]
    ex.io.aluop1_source <= id2ex.io.output_aluop1_source @[src/main/scala/riscv/core/fivestage/CPU.scala 308:23]
    ex.io.aluop2_source <= id2ex.io.output_aluop2_source @[src/main/scala/riscv/core/fivestage/CPU.scala 309:23]
    ex.io.csr_read_data <= id2ex.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 310:23]
    ex.io.forward_from_mem <= mem.io.forward_data @[src/main/scala/riscv/core/fivestage/CPU.scala 311:26]
    ex.io.forward_from_wb <= wb.io.regs_write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 312:25]
    ex.io.reg1_forward <= forwarding.io.reg1_forward_ex @[src/main/scala/riscv/core/fivestage/CPU.scala 313:22]
    ex.io.reg2_forward <= forwarding.io.reg2_forward_ex @[src/main/scala/riscv/core/fivestage/CPU.scala 314:22]
    ex2mem.io.stall_flag <= ctrl.io.ex_stall @[src/main/scala/riscv/core/fivestage/CPU.scala 316:24]
    ex2mem.io.flush_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 317:26]
    ex2mem.io.regs_write_enable <= id2ex.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 318:31]
    ex2mem.io.regs_write_source <= id2ex.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage/CPU.scala 319:31]
    ex2mem.io.regs_write_address <= id2ex.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 320:32]
    ex2mem.io.instruction_address <= id2ex.io.output_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 321:33]
    ex2mem.io.instruction <= id2ex.io.output_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 322:25]
    ex2mem.io.reg1_data <= id2ex.io.output_reg1_data @[src/main/scala/riscv/core/fivestage/CPU.scala 323:23]
    ex2mem.io.reg2_data <= id2ex.io.output_reg2_data @[src/main/scala/riscv/core/fivestage/CPU.scala 324:23]
    ex2mem.io.memory_read_enable <= id2ex.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 325:32]
    ex2mem.io.memory_write_enable <= id2ex.io.output_memory_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 326:33]
    ex2mem.io.alu_result <= ex.io.mem_alu_result @[src/main/scala/riscv/core/fivestage/CPU.scala 327:24]
    ex2mem.io.csr_read_data <= id2ex.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 328:27]
    mem.io.alu_result <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/fivestage/CPU.scala 330:21]
    mem.io.reg2_data <= ex2mem.io.output_reg2_data @[src/main/scala/riscv/core/fivestage/CPU.scala 331:20]
    mem.io.memory_read_enable <= ex2mem.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 332:29]
    mem.io.memory_write_enable <= ex2mem.io.output_memory_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 333:30]
    node _mem_io_funct3_T = bits(ex2mem.io.output_instruction, 14, 12) @[src/main/scala/riscv/core/fivestage/CPU.scala 334:48]
    mem.io.funct3 <= _mem_io_funct3_T @[src/main/scala/riscv/core/fivestage/CPU.scala 334:17]
    mem.io.regs_write_source <= ex2mem.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage/CPU.scala 335:28]
    mem.io.csr_read_data <= ex2mem.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 336:24]
    mem.io.clint_exception_token <= clint.io.exception_token @[src/main/scala/riscv/core/fivestage/CPU.scala 337:32]
    mem2wb.io.instruction_address <= ex2mem.io.output_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 339:33]
    mem2wb.io.alu_result <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/fivestage/CPU.scala 340:24]
    mem2wb.io.regs_write_enable <= ex2mem.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 341:31]
    mem2wb.io.regs_write_source <= ex2mem.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage/CPU.scala 342:31]
    mem2wb.io.regs_write_address <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 343:32]
    mem2wb.io.memory_read_data <= mem.io.wb_memory_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 344:30]
    mem2wb.io.csr_read_data <= ex2mem.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 345:27]
    wb.io.instruction_address <= mem2wb.io.output_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 347:29]
    wb.io.alu_result <= mem2wb.io.output_alu_result @[src/main/scala/riscv/core/fivestage/CPU.scala 348:20]
    wb.io.memory_read_data <= mem2wb.io.output_memory_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 349:26]
    wb.io.regs_write_source <= mem2wb.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage/CPU.scala 350:27]
    wb.io.csr_read_data <= mem2wb.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage/CPU.scala 351:23]
    forwarding.io.rs1_id <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage/CPU.scala 353:24]
    forwarding.io.rs2_id <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage/CPU.scala 354:24]
    node _forwarding_io_rs1_ex_T = bits(id2ex.io.output_instruction, 19, 15) @[src/main/scala/riscv/core/fivestage/CPU.scala 355:54]
    forwarding.io.rs1_ex <= _forwarding_io_rs1_ex_T @[src/main/scala/riscv/core/fivestage/CPU.scala 355:24]
    node _forwarding_io_rs2_ex_T = bits(id2ex.io.output_instruction, 24, 20) @[src/main/scala/riscv/core/fivestage/CPU.scala 356:54]
    forwarding.io.rs2_ex <= _forwarding_io_rs2_ex_T @[src/main/scala/riscv/core/fivestage/CPU.scala 356:24]
    forwarding.io.rd_mem <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 357:24]
    forwarding.io.reg_write_enable_mem <= ex2mem.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 358:38]
    forwarding.io.rd_wb <= mem2wb.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 359:23]
    forwarding.io.reg_write_enable_wb <= mem2wb.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 360:37]
    clint.io.instruction <= if2id.io.output_instruction @[src/main/scala/riscv/core/fivestage/CPU.scala 362:24]
    clint.io.instruction_address_if <= inst_fetch.io.id_instruction_address @[src/main/scala/riscv/core/fivestage/CPU.scala 363:35]
    clint.io.jump_flag <= id.io.if_jump_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 364:22]
    clint.io.jump_address <= id.io.clint_jump_address @[src/main/scala/riscv/core/fivestage/CPU.scala 365:25]
    clint.io.csr_mepc <= csr_regs.io.clint_csr_mepc @[src/main/scala/riscv/core/fivestage/CPU.scala 366:21]
    clint.io.csr_mtvec <= csr_regs.io.clint_csr_mtvec @[src/main/scala/riscv/core/fivestage/CPU.scala 367:22]
    clint.io.csr_mstatus <= csr_regs.io.clint_csr_mstatus @[src/main/scala/riscv/core/fivestage/CPU.scala 368:24]
    clint.io.interrupt_enable <= csr_regs.io.interrupt_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 369:29]
    clint.io.interrupt_flag <= if2id.io.output_interrupt_flag @[src/main/scala/riscv/core/fivestage/CPU.scala 370:27]
    clint.io.exception_signal <= mmu.io.page_fault_signals @[src/main/scala/riscv/core/fivestage/CPU.scala 372:29]
    clint.io.instruction_address_cause_exception <= mmu.io.epc @[src/main/scala/riscv/core/fivestage/CPU.scala 373:48]
    clint.io.exception_val <= mmu.io.va_cause_page_fault @[src/main/scala/riscv/core/fivestage/CPU.scala 374:26]
    clint.io.exception_cause <= mmu.io.ecause @[src/main/scala/riscv/core/fivestage/CPU.scala 375:28]
    csr_regs.io.reg_write_enable_ex <= id2ex.io.output_csr_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 377:35]
    csr_regs.io.reg_write_address_ex <= id2ex.io.output_csr_address @[src/main/scala/riscv/core/fivestage/CPU.scala 378:36]
    csr_regs.io.reg_write_data_ex <= ex.io.csr_write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 379:33]
    csr_regs.io.reg_read_address_id <= id.io.ex_csr_address @[src/main/scala/riscv/core/fivestage/CPU.scala 380:35]
    csr_regs.io.reg_write_enable_clint <= clint.io.csr_reg_write_enable @[src/main/scala/riscv/core/fivestage/CPU.scala 381:38]
    csr_regs.io.reg_write_address_clint <= clint.io.csr_reg_write_address @[src/main/scala/riscv/core/fivestage/CPU.scala 382:39]
    csr_regs.io.reg_write_data_clint <= clint.io.csr_reg_write_data @[src/main/scala/riscv/core/fivestage/CPU.scala 383:36]
    csr_regs.io.reg_read_address_clint <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage/CPU.scala 384:38]

  module CPU_1 :
    input clock : Clock
    input reset : Reset
    output io : { axi4_channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bus_address : UInt<32>, flip interrupt_flag : UInt<32>, flip stall_flag_bus : UInt<1>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>, flip instruction_valid : UInt<1>, bus_busy : UInt<1>, debug : UInt<32>[6]} @[src/main/scala/riscv/core/CPU.scala 23:14]

    inst cpu of CPU @[src/main/scala/riscv/core/CPU.scala 29:23]
    cpu.clock <= clock
    cpu.reset <= reset
    io.debug[0] <= cpu.io.debug[0] @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.debug[1] <= cpu.io.debug[1] @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.debug[2] <= cpu.io.debug[2] @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.debug[3] <= cpu.io.debug[3] @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.debug[4] <= cpu.io.debug[4] @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.debug[5] <= cpu.io.debug[5] @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.bus_busy <= cpu.io.bus_busy @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.instruction_valid <= io.instruction_valid @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.debug_read_data <= cpu.io.debug_read_data @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.debug_read_address <= io.debug_read_address @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.stall_flag_bus <= io.stall_flag_bus @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.interrupt_flag <= io.interrupt_flag @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.bus_address <= cpu.io.bus_address @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.read_data_channel.RRESP <= io.axi4_channels.read_data_channel.RRESP @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.read_data_channel.RDATA <= io.axi4_channels.read_data_channel.RDATA @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.read_data_channel.RREADY <= cpu.io.axi4_channels.read_data_channel.RREADY @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.read_data_channel.RVALID <= io.axi4_channels.read_data_channel.RVALID @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.read_address_channel.ARPROT <= cpu.io.axi4_channels.read_address_channel.ARPROT @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.read_address_channel.ARADDR <= cpu.io.axi4_channels.read_address_channel.ARADDR @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.read_address_channel.ARREADY <= io.axi4_channels.read_address_channel.ARREADY @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.read_address_channel.ARVALID <= cpu.io.axi4_channels.read_address_channel.ARVALID @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.write_response_channel.BRESP <= io.axi4_channels.write_response_channel.BRESP @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.write_response_channel.BREADY <= cpu.io.axi4_channels.write_response_channel.BREADY @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.write_response_channel.BVALID <= io.axi4_channels.write_response_channel.BVALID @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.write_data_channel.WSTRB <= cpu.io.axi4_channels.write_data_channel.WSTRB @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.write_data_channel.WDATA <= cpu.io.axi4_channels.write_data_channel.WDATA @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.write_data_channel.WREADY <= io.axi4_channels.write_data_channel.WREADY @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.write_data_channel.WVALID <= cpu.io.axi4_channels.write_data_channel.WVALID @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.write_address_channel.AWPROT <= cpu.io.axi4_channels.write_address_channel.AWPROT @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.write_address_channel.AWADDR <= cpu.io.axi4_channels.write_address_channel.AWADDR @[src/main/scala/riscv/core/CPU.scala 30:14]
    cpu.io.axi4_channels.write_address_channel.AWREADY <= io.axi4_channels.write_address_channel.AWREADY @[src/main/scala/riscv/core/CPU.scala 30:14]
    io.axi4_channels.write_address_channel.AWVALID <= cpu.io.axi4_channels.write_address_channel.AWVALID @[src/main/scala/riscv/core/CPU.scala 30:14]

  module BlockRAM :
    input clock : Clock
    input reset : Reset
    output io : { flip read_address : UInt<32>, flip write_address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], flip debug_read_address : UInt<32>, read_data : UInt<32>, debug_read_data : UInt<32>} @[src/main/scala/peripheral/Memory.scala 24:14]

    smem mem : UInt<8>[4] [8192] @[src/main/scala/peripheral/Memory.scala 36:24]
    when io.write_enable : @[src/main/scala/peripheral/Memory.scala 37:25]
      wire write_data_vec : UInt<8>[4] @[src/main/scala/peripheral/Memory.scala 38:30]
      node _write_data_vec_0_T = bits(io.write_data, 7, 0) @[src/main/scala/peripheral/Memory.scala 40:41]
      write_data_vec[0] <= _write_data_vec_0_T @[src/main/scala/peripheral/Memory.scala 40:25]
      node _write_data_vec_1_T = bits(io.write_data, 15, 8) @[src/main/scala/peripheral/Memory.scala 40:41]
      write_data_vec[1] <= _write_data_vec_1_T @[src/main/scala/peripheral/Memory.scala 40:25]
      node _write_data_vec_2_T = bits(io.write_data, 23, 16) @[src/main/scala/peripheral/Memory.scala 40:41]
      write_data_vec[2] <= _write_data_vec_2_T @[src/main/scala/peripheral/Memory.scala 40:25]
      node _write_data_vec_3_T = bits(io.write_data, 31, 24) @[src/main/scala/peripheral/Memory.scala 40:41]
      write_data_vec[3] <= _write_data_vec_3_T @[src/main/scala/peripheral/Memory.scala 40:25]
      node _T = dshr(io.write_address, UInt<2>("h2")) @[src/main/scala/peripheral/Memory.scala 42:33]
      node _T_1 = bits(_T, 12, 0)
      write mport MPORT = mem[_T_1], clock
      when io.write_strobe[0] :
        MPORT[0] <= write_data_vec[0]
      when io.write_strobe[1] :
        MPORT[1] <= write_data_vec[1]
      when io.write_strobe[2] :
        MPORT[2] <= write_data_vec[2]
      when io.write_strobe[3] :
        MPORT[3] <= write_data_vec[3]
    node _io_read_data_T = dshr(io.read_address, UInt<2>("h2")) @[src/main/scala/peripheral/Memory.scala 44:45]
    wire _io_read_data_WIRE : UInt @[src/main/scala/peripheral/Memory.scala 44:27]
    _io_read_data_WIRE is invalid @[src/main/scala/peripheral/Memory.scala 44:27]
    when UInt<1>("h1") : @[src/main/scala/peripheral/Memory.scala 44:27]
      _io_read_data_WIRE <= _io_read_data_T @[src/main/scala/peripheral/Memory.scala 44:27]
      node _io_read_data_T_1 = or(_io_read_data_WIRE, UInt<13>("h0")) @[src/main/scala/peripheral/Memory.scala 44:27]
      node _io_read_data_T_2 = bits(_io_read_data_T_1, 12, 0) @[src/main/scala/peripheral/Memory.scala 44:27]
      read mport io_read_data_MPORT = mem[_io_read_data_T_2], clock @[src/main/scala/peripheral/Memory.scala 44:27]
    node io_read_data_lo = cat(io_read_data_MPORT[1], io_read_data_MPORT[0]) @[src/main/scala/peripheral/Memory.scala 44:69]
    node io_read_data_hi = cat(io_read_data_MPORT[3], io_read_data_MPORT[2]) @[src/main/scala/peripheral/Memory.scala 44:69]
    node _io_read_data_T_3 = cat(io_read_data_hi, io_read_data_lo) @[src/main/scala/peripheral/Memory.scala 44:69]
    io.read_data <= _io_read_data_T_3 @[src/main/scala/peripheral/Memory.scala 44:16]
    node _io_debug_read_data_T = dshr(io.debug_read_address, UInt<2>("h2")) @[src/main/scala/peripheral/Memory.scala 45:57]
    wire _io_debug_read_data_WIRE : UInt @[src/main/scala/peripheral/Memory.scala 45:33]
    _io_debug_read_data_WIRE is invalid @[src/main/scala/peripheral/Memory.scala 45:33]
    when UInt<1>("h1") : @[src/main/scala/peripheral/Memory.scala 45:33]
      _io_debug_read_data_WIRE <= _io_debug_read_data_T @[src/main/scala/peripheral/Memory.scala 45:33]
      node _io_debug_read_data_T_1 = or(_io_debug_read_data_WIRE, UInt<13>("h0")) @[src/main/scala/peripheral/Memory.scala 45:33]
      node _io_debug_read_data_T_2 = bits(_io_debug_read_data_T_1, 12, 0) @[src/main/scala/peripheral/Memory.scala 45:33]
      read mport io_debug_read_data_MPORT = mem[_io_debug_read_data_T_2], clock @[src/main/scala/peripheral/Memory.scala 45:33]
    node io_debug_read_data_lo = cat(io_debug_read_data_MPORT[1], io_debug_read_data_MPORT[0]) @[src/main/scala/peripheral/Memory.scala 45:81]
    node io_debug_read_data_hi = cat(io_debug_read_data_MPORT[3], io_debug_read_data_MPORT[2]) @[src/main/scala/peripheral/Memory.scala 45:81]
    node _io_debug_read_data_T_3 = cat(io_debug_read_data_hi, io_debug_read_data_lo) @[src/main/scala/peripheral/Memory.scala 45:81]
    io.debug_read_data <= _io_debug_read_data_T_3 @[src/main/scala/peripheral/Memory.scala 45:22]

  module AXI4LiteSlave_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { read : UInt<1>, write : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], address : UInt<32>}} @[src/main/scala/bus/AXI4Lite.scala 121:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 125:22]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 126:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 127:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 128:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 129:18]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 130:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 131:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 132:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 133:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 134:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 135:26]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 138:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 139:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 140:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 141:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 142:39]
    io.channels.read_data_channel.RDATA <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 144:39]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 147:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 149:41]
    write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 150:14]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 152:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 153:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 154:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 158:12]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 159:13]
      RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 160:14]
      BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 161:14]
      when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 162:55]
        state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 163:15]
      else :
        when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 164:60]
          state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 165:15]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 169:15]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 170:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 170:65]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 171:15]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 172:14]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 173:14]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 174:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
          RVALID <= io.bundle.read_valid @[src/main/scala/bus/AXI4Lite.scala 178:14]
          node _T_10 = and(io.channels.read_data_channel.RREADY, RVALID) @[src/main/scala/bus/AXI4Lite.scala 179:49]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 179:60]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 180:15]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 181:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
            AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 185:15]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 186:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 186:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 187:14]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 188:15]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 193:14]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 194:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 194:61]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 195:15]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 196:20]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                write_strobe[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:15]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 199:16]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 203:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 204:14]
                node _T_26 = and(io.channels.write_response_channel.BREADY, BVALID) @[src/main/scala/bus/AXI4Lite.scala 205:54]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 205:65]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 206:15]
                  write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 207:15]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:16]


  module Memory :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, flip debug_read_address : UInt<32>, debug_read_data : UInt<32>} @[src/main/scala/peripheral/Memory.scala 50:14]

    inst mem of BlockRAM @[src/main/scala/peripheral/Memory.scala 57:19]
    mem.clock <= clock
    mem.reset <= reset
    inst slave of AXI4LiteSlave_1 @[src/main/scala/peripheral/Memory.scala 58:21]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/Memory.scala 59:21]
    slave.io.bundle.read_valid <= UInt<1>("h1") @[src/main/scala/peripheral/Memory.scala 60:30]
    mem.io.write_enable <= slave.io.bundle.write @[src/main/scala/peripheral/Memory.scala 62:23]
    mem.io.write_data <= slave.io.bundle.write_data @[src/main/scala/peripheral/Memory.scala 63:21]
    mem.io.write_address <= slave.io.bundle.address @[src/main/scala/peripheral/Memory.scala 64:24]
    mem.io.write_strobe[0] <= slave.io.bundle.write_strobe[0] @[src/main/scala/peripheral/Memory.scala 65:23]
    mem.io.write_strobe[1] <= slave.io.bundle.write_strobe[1] @[src/main/scala/peripheral/Memory.scala 65:23]
    mem.io.write_strobe[2] <= slave.io.bundle.write_strobe[2] @[src/main/scala/peripheral/Memory.scala 65:23]
    mem.io.write_strobe[3] <= slave.io.bundle.write_strobe[3] @[src/main/scala/peripheral/Memory.scala 65:23]
    mem.io.read_address <= slave.io.bundle.address @[src/main/scala/peripheral/Memory.scala 67:23]
    slave.io.bundle.read_data <= mem.io.read_data @[src/main/scala/peripheral/Memory.scala 68:29]
    mem.io.debug_read_address <= io.debug_read_address @[src/main/scala/peripheral/Memory.scala 70:29]
    io.debug_read_data <= mem.io.debug_read_data @[src/main/scala/peripheral/Memory.scala 71:22]

  module AXI4LiteSlave_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { read : UInt<1>, write : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], address : UInt<8>}} @[src/main/scala/bus/AXI4Lite.scala 121:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 125:22]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 126:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 127:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 128:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 129:18]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 130:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 131:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 132:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 133:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 134:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 135:26]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 138:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 139:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 140:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 141:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 142:39]
    io.channels.read_data_channel.RDATA <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 144:39]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 147:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 149:41]
    write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 150:14]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 152:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 153:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 154:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 158:12]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 159:13]
      RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 160:14]
      BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 161:14]
      when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 162:55]
        state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 163:15]
      else :
        when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 164:60]
          state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 165:15]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 169:15]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 170:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 170:65]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 171:15]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 172:14]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 173:14]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 174:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
          RVALID <= io.bundle.read_valid @[src/main/scala/bus/AXI4Lite.scala 178:14]
          node _T_10 = and(io.channels.read_data_channel.RREADY, RVALID) @[src/main/scala/bus/AXI4Lite.scala 179:49]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 179:60]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 180:15]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 181:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
            AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 185:15]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 186:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 186:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 187:14]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 188:15]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 193:14]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 194:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 194:61]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 195:15]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 196:20]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                write_strobe[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:15]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 199:16]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 203:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 204:14]
                node _T_26 = and(io.channels.write_response_channel.BREADY, BVALID) @[src/main/scala/bus/AXI4Lite.scala 205:54]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 205:65]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 206:15]
                  write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 207:15]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:16]


  module Timer :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<8>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<8>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, signal_interrupt : UInt<1>, debug_limit : UInt<32>, debug_enabled : UInt<1>} @[src/main/scala/peripheral/Timer.scala 23:14]

    inst slave of AXI4LiteSlave_2 @[src/main/scala/peripheral/Timer.scala 30:21]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/Timer.scala 31:21]
    reg count : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/Timer.scala 33:22]
    reg limit : UInt<32>, clock with :
      reset => (reset, UInt<32>("h5f5e100")) @[src/main/scala/peripheral/Timer.scala 34:22]
    io.debug_limit <= limit @[src/main/scala/peripheral/Timer.scala 35:18]
    reg enabled : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/Timer.scala 36:24]
    io.debug_enabled <= enabled @[src/main/scala/peripheral/Timer.scala 37:20]
    slave.io.bundle.read_data <= UInt<1>("h0") @[src/main/scala/peripheral/Timer.scala 39:29]
    slave.io.bundle.read_valid <= UInt<1>("h1") @[src/main/scala/peripheral/Timer.scala 40:30]
    when slave.io.bundle.read : @[src/main/scala/peripheral/Timer.scala 41:30]
      node _slave_io_bundle_read_data_T = eq(UInt<3>("h4"), slave.io.bundle.address) @[src/main/scala/peripheral/Timer.scala 42:73]
      node _slave_io_bundle_read_data_T_1 = mux(_slave_io_bundle_read_data_T, limit, UInt<1>("h0")) @[src/main/scala/peripheral/Timer.scala 42:73]
      node _slave_io_bundle_read_data_T_2 = eq(UInt<4>("h8"), slave.io.bundle.address) @[src/main/scala/peripheral/Timer.scala 42:73]
      node _slave_io_bundle_read_data_T_3 = mux(_slave_io_bundle_read_data_T_2, enabled, _slave_io_bundle_read_data_T_1) @[src/main/scala/peripheral/Timer.scala 42:73]
      slave.io.bundle.read_data <= _slave_io_bundle_read_data_T_3 @[src/main/scala/peripheral/Timer.scala 42:31]
    when slave.io.bundle.write : @[src/main/scala/peripheral/Timer.scala 49:31]
      node _T = eq(slave.io.bundle.address, UInt<3>("h4")) @[src/main/scala/peripheral/Timer.scala 50:34]
      when _T : @[src/main/scala/peripheral/Timer.scala 50:45]
        limit <= slave.io.bundle.write_data @[src/main/scala/peripheral/Timer.scala 51:13]
        count <= UInt<1>("h0") @[src/main/scala/peripheral/Timer.scala 52:13]
      else :
        node _T_1 = eq(slave.io.bundle.address, UInt<4>("h8")) @[src/main/scala/peripheral/Timer.scala 53:40]
        when _T_1 : @[src/main/scala/peripheral/Timer.scala 53:51]
          node _enabled_T = neq(slave.io.bundle.write_data, UInt<1>("h0")) @[src/main/scala/peripheral/Timer.scala 54:45]
          enabled <= _enabled_T @[src/main/scala/peripheral/Timer.scala 54:15]
    node _io_signal_interrupt_T = sub(limit, UInt<4>("ha")) @[src/main/scala/peripheral/Timer.scala 58:54]
    node _io_signal_interrupt_T_1 = tail(_io_signal_interrupt_T, 1) @[src/main/scala/peripheral/Timer.scala 58:54]
    node _io_signal_interrupt_T_2 = geq(count, _io_signal_interrupt_T_1) @[src/main/scala/peripheral/Timer.scala 58:44]
    node _io_signal_interrupt_T_3 = and(enabled, _io_signal_interrupt_T_2) @[src/main/scala/peripheral/Timer.scala 58:34]
    io.signal_interrupt <= _io_signal_interrupt_T_3 @[src/main/scala/peripheral/Timer.scala 58:23]
    node _T_2 = geq(count, limit) @[src/main/scala/peripheral/Timer.scala 60:14]
    when _T_2 : @[src/main/scala/peripheral/Timer.scala 60:24]
      count <= UInt<1>("h0") @[src/main/scala/peripheral/Timer.scala 61:11]
    else :
      node _count_T = add(count, UInt<1>("h1")) @[src/main/scala/peripheral/Timer.scala 63:20]
      node _count_T_1 = tail(_count_T, 1) @[src/main/scala/peripheral/Timer.scala 63:20]
      count <= _count_T_1 @[src/main/scala/peripheral/Timer.scala 63:11]


  module AXI4LiteSlave_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { read : UInt<1>, write : UInt<1>, flip read_data : UInt<32>, flip read_valid : UInt<1>, write_data : UInt<32>, write_strobe : UInt<1>[4], address : UInt<32>}} @[src/main/scala/bus/AXI4Lite.scala 121:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 125:22]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 126:21]
    io.bundle.address <= addr @[src/main/scala/bus/AXI4Lite.scala 127:21]
    reg read : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 128:21]
    io.bundle.read <= read @[src/main/scala/bus/AXI4Lite.scala 129:18]
    reg write : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 130:22]
    io.bundle.write <= write @[src/main/scala/bus/AXI4Lite.scala 131:19]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 132:27]
    io.bundle.write_data <= write_data @[src/main/scala/bus/AXI4Lite.scala 133:24]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 134:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 134:29]
    io.bundle.write_strobe <= write_strobe @[src/main/scala/bus/AXI4Lite.scala 135:26]
    reg ARREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 137:24]
    io.channels.read_address_channel.ARREADY <= ARREADY @[src/main/scala/bus/AXI4Lite.scala 138:44]
    reg RVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 139:23]
    io.channels.read_data_channel.RVALID <= RVALID @[src/main/scala/bus/AXI4Lite.scala 140:40]
    reg RRESP : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/bus/AXI4Lite.scala 141:22]
    io.channels.read_data_channel.RRESP <= RRESP @[src/main/scala/bus/AXI4Lite.scala 142:39]
    io.channels.read_data_channel.RDATA <= io.bundle.read_data @[src/main/scala/bus/AXI4Lite.scala 144:39]
    reg AWREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 146:24]
    io.channels.write_address_channel.AWREADY <= AWREADY @[src/main/scala/bus/AXI4Lite.scala 147:45]
    reg WREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 148:23]
    io.channels.write_data_channel.WREADY <= WREADY @[src/main/scala/bus/AXI4Lite.scala 149:41]
    write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 150:14]
    reg BVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 151:23]
    io.channels.write_response_channel.BVALID <= BVALID @[src/main/scala/bus/AXI4Lite.scala 152:45]
    wire BRESP : UInt<2> @[src/main/scala/bus/AXI4Lite.scala 153:23]
    BRESP <= UInt<2>("h0") @[src/main/scala/bus/AXI4Lite.scala 153:23]
    io.channels.write_response_channel.BRESP <= BRESP @[src/main/scala/bus/AXI4Lite.scala 154:44]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 156:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
      read <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 158:12]
      write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 159:13]
      RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 160:14]
      BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 161:14]
      when io.channels.write_address_channel.AWVALID : @[src/main/scala/bus/AXI4Lite.scala 162:55]
        state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 163:15]
      else :
        when io.channels.read_address_channel.ARVALID : @[src/main/scala/bus/AXI4Lite.scala 164:60]
          state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 165:15]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 156:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
        ARREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 169:15]
        node _T_6 = and(io.channels.read_address_channel.ARVALID, ARREADY) @[src/main/scala/bus/AXI4Lite.scala 170:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 170:65]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 171:15]
          addr <= io.channels.read_address_channel.ARADDR @[src/main/scala/bus/AXI4Lite.scala 172:14]
          read <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 173:14]
          ARREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 174:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 156:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
          RVALID <= io.bundle.read_valid @[src/main/scala/bus/AXI4Lite.scala 178:14]
          node _T_10 = and(io.channels.read_data_channel.RREADY, RVALID) @[src/main/scala/bus/AXI4Lite.scala 179:49]
          when _T_10 : @[src/main/scala/bus/AXI4Lite.scala 179:60]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 180:15]
            RVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 181:16]
        else :
          node _T_11 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_12 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          node _T_13 = eq(_T_11, _T_12) @[src/main/scala/bus/AXI4Lite.scala 156:17]
          when _T_13 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
            AWREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 185:15]
            node _T_14 = and(io.channels.write_address_channel.AWVALID, AWREADY) @[src/main/scala/bus/AXI4Lite.scala 186:54]
            when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 186:66]
              addr <= io.channels.write_address_channel.AWADDR @[src/main/scala/bus/AXI4Lite.scala 187:14]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 188:15]
              AWREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 189:17]
          else :
            node _T_15 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_16 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            node _T_17 = eq(_T_15, _T_16) @[src/main/scala/bus/AXI4Lite.scala 156:17]
            when _T_17 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
              WREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 193:14]
              node _T_18 = and(io.channels.write_data_channel.WVALID, WREADY) @[src/main/scala/bus/AXI4Lite.scala 194:50]
              when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 194:61]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 195:15]
                write_data <= io.channels.write_data_channel.WDATA @[src/main/scala/bus/AXI4Lite.scala 196:20]
                node _T_19 = bits(io.channels.write_data_channel.WSTRB, 0, 0) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_20 = bits(io.channels.write_data_channel.WSTRB, 1, 1) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_21 = bits(io.channels.write_data_channel.WSTRB, 2, 2) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                node _T_22 = bits(io.channels.write_data_channel.WSTRB, 3, 3) @[src/main/scala/bus/AXI4Lite.scala 197:62]
                write_strobe[0] <= _T_19 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[1] <= _T_20 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[2] <= _T_21 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write_strobe[3] <= _T_22 @[src/main/scala/bus/AXI4Lite.scala 197:22]
                write <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 198:15]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 199:16]
            else :
              node _T_23 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_24 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              node _T_25 = eq(_T_23, _T_24) @[src/main/scala/bus/AXI4Lite.scala 156:17]
              when _T_25 : @[src/main/scala/bus/AXI4Lite.scala 156:17]
                WREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 203:14]
                BVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 204:14]
                node _T_26 = and(io.channels.write_response_channel.BREADY, BVALID) @[src/main/scala/bus/AXI4Lite.scala 205:54]
                when _T_26 : @[src/main/scala/bus/AXI4Lite.scala 205:65]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 206:15]
                  write <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 207:15]
                  BVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 208:16]


  module DummySlave :
    input clock : Clock
    input reset : Reset
    output io : { flip channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<4>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<4>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}} @[src/main/scala/peripheral/DummySlave.scala 24:14]

    inst slave of AXI4LiteSlave_3 @[src/main/scala/peripheral/DummySlave.scala 28:21]
    slave.clock <= clock
    slave.reset <= reset
    slave.io.channels <= io.channels @[src/main/scala/peripheral/DummySlave.scala 29:21]
    slave.io.bundle.read_valid <= UInt<1>("h1") @[src/main/scala/peripheral/DummySlave.scala 30:30]
    slave.io.bundle.read_data <= UInt<32>("hdeadbeef") @[src/main/scala/peripheral/DummySlave.scala 31:29]

  module BusArbiter :
    input clock : Clock
    input reset : Reset
    output io : { flip bus_request : UInt<1>[1], bus_granted : UInt<1>[1], ctrl_stall_flag : UInt<1>} @[src/main/scala/bus/BusArbiter.scala 21:14]

    wire granted : UInt @[src/main/scala/bus/BusArbiter.scala 27:21]
    granted <= UInt<1>("h0") @[src/main/scala/bus/BusArbiter.scala 30:11]
    when io.bus_request[UInt<1>("h0")] : @[src/main/scala/bus/BusArbiter.scala 32:31]
      granted <= UInt<1>("h0") @[src/main/scala/bus/BusArbiter.scala 33:15]
    node _io_bus_granted_0_T = eq(UInt<1>("h0"), granted) @[src/main/scala/bus/BusArbiter.scala 37:32]
    io.bus_granted[UInt<1>("h0")] <= _io_bus_granted_0_T @[src/main/scala/bus/BusArbiter.scala 37:25]
    node _io_ctrl_stall_flag_T = eq(io.bus_granted[UInt<1>("h0")], UInt<1>("h0")) @[src/main/scala/bus/BusArbiter.scala 39:25]
    io.ctrl_stall_flag <= _io_ctrl_stall_flag_T @[src/main/scala/bus/BusArbiter.scala 39:22]

  module AXI4LiteMaster_1 :
    input clock : Clock
    input reset : Reset
    output io : { channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { flip read : UInt<1>, flip write : UInt<1>, read_data : UInt<32>, flip write_data : UInt<32>, flip write_strobe : UInt<1>[4], flip address : UInt<32>, busy : UInt<1>, read_valid : UInt<1>, write_valid : UInt<1>}} @[src/main/scala/bus/AXI4Lite.scala 215:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 219:22]
    node _io_bundle_busy_T = neq(state, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 220:27]
    io.bundle.busy <= _io_bundle_busy_T @[src/main/scala/bus/AXI4Lite.scala 220:18]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 222:21]
    reg read_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 223:27]
    io.bundle.read_valid <= read_valid @[src/main/scala/bus/AXI4Lite.scala 224:24]
    reg write_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 225:28]
    io.bundle.write_valid <= write_valid @[src/main/scala/bus/AXI4Lite.scala 226:25]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 227:27]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 228:29]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 229:26]
    io.channels.read_address_channel.ARADDR <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 231:43]
    reg ARVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 232:24]
    io.channels.read_address_channel.ARVALID <= ARVALID @[src/main/scala/bus/AXI4Lite.scala 233:44]
    io.channels.read_address_channel.ARPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 234:43]
    reg RREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 235:23]
    io.channels.read_data_channel.RREADY <= RREADY @[src/main/scala/bus/AXI4Lite.scala 236:40]
    io.bundle.read_data <= io.channels.read_data_channel.RDATA @[src/main/scala/bus/AXI4Lite.scala 238:23]
    reg AWVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 239:24]
    io.channels.write_address_channel.AWADDR <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 240:44]
    io.channels.write_address_channel.AWVALID <= AWVALID @[src/main/scala/bus/AXI4Lite.scala 241:45]
    reg WVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 242:23]
    io.channels.write_data_channel.WVALID <= WVALID @[src/main/scala/bus/AXI4Lite.scala 243:41]
    io.channels.write_data_channel.WDATA <= write_data @[src/main/scala/bus/AXI4Lite.scala 244:40]
    io.channels.write_address_channel.AWPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 245:44]
    node io_channels_write_data_channel_WSTRB_lo = cat(write_strobe[1], write_strobe[0]) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    node io_channels_write_data_channel_WSTRB_hi = cat(write_strobe[3], write_strobe[2]) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    node _io_channels_write_data_channel_WSTRB_T = cat(io_channels_write_data_channel_WSTRB_hi, io_channels_write_data_channel_WSTRB_lo) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    io.channels.write_data_channel.WSTRB <= _io_channels_write_data_channel_WSTRB_T @[src/main/scala/bus/AXI4Lite.scala 246:40]
    reg BREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 247:23]
    io.channels.write_response_channel.BREADY <= BREADY @[src/main/scala/bus/AXI4Lite.scala 248:45]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
      WVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 252:14]
      AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 253:15]
      ARVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 254:15]
      RREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 255:14]
      read_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 256:18]
      write_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 257:19]
      when io.bundle.write : @[src/main/scala/bus/AXI4Lite.scala 258:29]
        state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 259:15]
        addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 260:14]
        write_data <= io.bundle.write_data @[src/main/scala/bus/AXI4Lite.scala 261:20]
        write_strobe <= io.bundle.write_strobe @[src/main/scala/bus/AXI4Lite.scala 262:22]
      else :
        when io.bundle.read : @[src/main/scala/bus/AXI4Lite.scala 263:34]
          state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 264:15]
          addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 265:14]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
        ARVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 269:15]
        io.channels.read_address_channel.ARADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 270:47]
        node _T_6 = and(io.channels.read_address_channel.ARREADY, ARVALID) @[src/main/scala/bus/AXI4Lite.scala 271:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 271:65]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 272:15]
          io.channels.read_address_channel.ARADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 273:49]
          ARVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 274:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_10 = eq(io.channels.read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 278:88]
          node _T_11 = and(io.channels.read_data_channel.RVALID, _T_10) @[src/main/scala/bus/AXI4Lite.scala 278:49]
          when _T_11 : @[src/main/scala/bus/AXI4Lite.scala 278:97]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 279:15]
            read_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 280:20]
            RREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 281:16]
            read_data <= io.channels.read_data_channel.RDATA @[src/main/scala/bus/AXI4Lite.scala 282:19]
        else :
          node _T_12 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_13 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_14 = eq(_T_12, _T_13) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
            AWVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 286:15]
            io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 287:48]
            node _T_15 = and(io.channels.write_address_channel.AWREADY, AWVALID) @[src/main/scala/bus/AXI4Lite.scala 288:54]
            when _T_15 : @[src/main/scala/bus/AXI4Lite.scala 288:66]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 289:15]
              io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 290:50]
              AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 291:17]
          else :
            node _T_16 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            node _T_17 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            node _T_18 = eq(_T_16, _T_17) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
              WVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 295:14]
              io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 296:48]
              node _T_19 = and(io.channels.write_data_channel.WREADY, WVALID) @[src/main/scala/bus/AXI4Lite.scala 297:50]
              when _T_19 : @[src/main/scala/bus/AXI4Lite.scala 297:61]
                io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 298:50]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 299:15]
                WVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 300:16]
            else :
              node _T_20 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              node _T_21 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              node _T_22 = eq(_T_20, _T_21) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              when _T_22 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
                BREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 304:14]
                node _T_23 = and(io.channels.write_response_channel.BVALID, BREADY) @[src/main/scala/bus/AXI4Lite.scala 305:54]
                when _T_23 : @[src/main/scala/bus/AXI4Lite.scala 305:65]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 306:15]
                  write_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 307:21]
                  BREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 308:16]


  module DummyMaster :
    input clock : Clock
    input reset : Reset
    output io : { channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}} @[src/main/scala/peripheral/DummyMaster.scala 23:14]

    inst master of AXI4LiteMaster_1 @[src/main/scala/peripheral/DummyMaster.scala 26:22]
    master.clock <= clock
    master.reset <= reset
    master.io.channels.read_data_channel.RRESP <= io.channels.read_data_channel.RRESP @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    master.io.channels.read_data_channel.RDATA <= io.channels.read_data_channel.RDATA @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.read_data_channel.RREADY <= master.io.channels.read_data_channel.RREADY @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    master.io.channels.read_data_channel.RVALID <= io.channels.read_data_channel.RVALID @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.read_address_channel.ARPROT <= master.io.channels.read_address_channel.ARPROT @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.read_address_channel.ARADDR <= master.io.channels.read_address_channel.ARADDR @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    master.io.channels.read_address_channel.ARREADY <= io.channels.read_address_channel.ARREADY @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.read_address_channel.ARVALID <= master.io.channels.read_address_channel.ARVALID @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    master.io.channels.write_response_channel.BRESP <= io.channels.write_response_channel.BRESP @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.write_response_channel.BREADY <= master.io.channels.write_response_channel.BREADY @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    master.io.channels.write_response_channel.BVALID <= io.channels.write_response_channel.BVALID @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.write_data_channel.WSTRB <= master.io.channels.write_data_channel.WSTRB @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.write_data_channel.WDATA <= master.io.channels.write_data_channel.WDATA @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    master.io.channels.write_data_channel.WREADY <= io.channels.write_data_channel.WREADY @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.write_data_channel.WVALID <= master.io.channels.write_data_channel.WVALID @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.write_address_channel.AWPROT <= master.io.channels.write_address_channel.AWPROT @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.write_address_channel.AWADDR <= master.io.channels.write_address_channel.AWADDR @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    master.io.channels.write_address_channel.AWREADY <= io.channels.write_address_channel.AWREADY @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    io.channels.write_address_channel.AWVALID <= master.io.channels.write_address_channel.AWVALID @[src/main/scala/peripheral/DummyMaster.scala 27:22]
    wire _WIRE : UInt<1>[4] @[src/main/scala/peripheral/DummyMaster.scala 28:43]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 28:43]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 28:43]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 28:43]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 28:43]
    master.io.bundle.write_strobe[0] <= _WIRE[0] @[src/main/scala/peripheral/DummyMaster.scala 28:33]
    master.io.bundle.write_strobe[1] <= _WIRE[1] @[src/main/scala/peripheral/DummyMaster.scala 28:33]
    master.io.bundle.write_strobe[2] <= _WIRE[2] @[src/main/scala/peripheral/DummyMaster.scala 28:33]
    master.io.bundle.write_strobe[3] <= _WIRE[3] @[src/main/scala/peripheral/DummyMaster.scala 28:33]
    master.io.bundle.write_data <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 29:31]
    master.io.bundle.write <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 30:26]
    master.io.bundle.read <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 31:25]
    master.io.bundle.address <= UInt<1>("h0") @[src/main/scala/peripheral/DummyMaster.scala 32:28]

  module BusSwitch :
    input clock : Clock
    input reset : Reset
    output io : { flip address : UInt<32>, slaves : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}[8], flip master : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}} @[src/main/scala/bus/BusSwitch.scala 22:14]

    inst dummy of DummyMaster @[src/main/scala/bus/BusSwitch.scala 27:21]
    dummy.clock <= clock
    dummy.reset <= reset
    node index = bits(io.address, 31, 29) @[src/main/scala/bus/BusSwitch.scala 28:25]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[0].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[0].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[0].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[0].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[0].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[0].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[0].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[0].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[0].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[1].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[1].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[1].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[1].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[1].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[1].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[1].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[1].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[1].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[2].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[2].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[2].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[2].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[2].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[2].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[2].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[2].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[2].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[3].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[3].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[3].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[3].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[3].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[3].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[3].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[3].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[3].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[4].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[4].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[4].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[4].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[4].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[4].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[4].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[4].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[4].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[5].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[5].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[5].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[5].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[5].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[5].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[5].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[5].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[5].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[6].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[6].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[6].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[6].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[6].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[6].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[6].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[6].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[6].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RRESP <= io.slaves[7].read_data_channel.RRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RDATA <= io.slaves[7].read_data_channel.RDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].read_data_channel.RREADY <= dummy.io.channels.read_data_channel.RREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_data_channel.RVALID <= io.slaves[7].read_data_channel.RVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].read_address_channel.ARPROT <= dummy.io.channels.read_address_channel.ARPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].read_address_channel.ARADDR <= dummy.io.channels.read_address_channel.ARADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.read_address_channel.ARREADY <= io.slaves[7].read_address_channel.ARREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].read_address_channel.ARVALID <= dummy.io.channels.read_address_channel.ARVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BRESP <= io.slaves[7].write_response_channel.BRESP @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].write_response_channel.BREADY <= dummy.io.channels.write_response_channel.BREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_response_channel.BVALID <= io.slaves[7].write_response_channel.BVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].write_data_channel.WSTRB <= dummy.io.channels.write_data_channel.WSTRB @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].write_data_channel.WDATA <= dummy.io.channels.write_data_channel.WDATA @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_data_channel.WREADY <= io.slaves[7].write_data_channel.WREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].write_data_channel.WVALID <= dummy.io.channels.write_data_channel.WVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].write_address_channel.AWPROT <= dummy.io.channels.write_address_channel.AWPROT @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].write_address_channel.AWADDR <= dummy.io.channels.write_address_channel.AWADDR @[src/main/scala/bus/BusSwitch.scala 30:18]
    dummy.io.channels.write_address_channel.AWREADY <= io.slaves[7].write_address_channel.AWREADY @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[7].write_address_channel.AWVALID <= dummy.io.channels.write_address_channel.AWVALID @[src/main/scala/bus/BusSwitch.scala 30:18]
    io.slaves[index] <= io.master @[src/main/scala/bus/BusSwitch.scala 32:13]

  module InstructionROM :
    input clock : Clock
    input reset : Reset
    output io : { flip address : UInt<32>, data : UInt<32>} @[src/main/scala/peripheral/InstructionROM.scala 28:14]

    smem mem : UInt<32> [1051] @[src/main/scala/peripheral/InstructionROM.scala 34:24]
    wire _io_data_WIRE : UInt @[src/main/scala/peripheral/InstructionROM.scala 40:22]
    _io_data_WIRE is invalid @[src/main/scala/peripheral/InstructionROM.scala 40:22]
    when UInt<1>("h1") : @[src/main/scala/peripheral/InstructionROM.scala 40:22]
      _io_data_WIRE <= io.address @[src/main/scala/peripheral/InstructionROM.scala 40:22]
      node _io_data_T = or(_io_data_WIRE, UInt<11>("h0")) @[src/main/scala/peripheral/InstructionROM.scala 40:22]
      node _io_data_T_1 = bits(_io_data_T, 10, 0) @[src/main/scala/peripheral/InstructionROM.scala 40:22]
      read mport io_data_MPORT = mem[_io_data_T_1], clock @[src/main/scala/peripheral/InstructionROM.scala 40:22]
    io.data <= io_data_MPORT @[src/main/scala/peripheral/InstructionROM.scala 40:11]

  module AXI4LiteMaster_2 :
    input clock : Clock
    input reset : Reset
    output io : { channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, bundle : { flip read : UInt<1>, flip write : UInt<1>, read_data : UInt<32>, flip write_data : UInt<32>, flip write_strobe : UInt<1>[4], flip address : UInt<32>, busy : UInt<1>, read_valid : UInt<1>, write_valid : UInt<1>}} @[src/main/scala/bus/AXI4Lite.scala 215:14]

    reg state : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 219:22]
    node _io_bundle_busy_T = neq(state, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 220:27]
    io.bundle.busy <= _io_bundle_busy_T @[src/main/scala/bus/AXI4Lite.scala 220:18]
    reg addr : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 222:21]
    reg read_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 223:27]
    io.bundle.read_valid <= read_valid @[src/main/scala/bus/AXI4Lite.scala 224:24]
    reg write_valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 225:28]
    io.bundle.write_valid <= write_valid @[src/main/scala/bus/AXI4Lite.scala 226:25]
    reg write_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 227:27]
    wire _write_strobe_WIRE : UInt<1>[4] @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[0] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[1] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[2] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    _write_strobe_WIRE[3] <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 228:37]
    reg write_strobe : UInt<1>[4], clock with :
      reset => (reset, _write_strobe_WIRE) @[src/main/scala/bus/AXI4Lite.scala 228:29]
    reg read_data : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/bus/AXI4Lite.scala 229:26]
    io.channels.read_address_channel.ARADDR <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 231:43]
    reg ARVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 232:24]
    io.channels.read_address_channel.ARVALID <= ARVALID @[src/main/scala/bus/AXI4Lite.scala 233:44]
    io.channels.read_address_channel.ARPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 234:43]
    reg RREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 235:23]
    io.channels.read_data_channel.RREADY <= RREADY @[src/main/scala/bus/AXI4Lite.scala 236:40]
    io.bundle.read_data <= io.channels.read_data_channel.RDATA @[src/main/scala/bus/AXI4Lite.scala 238:23]
    reg AWVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 239:24]
    io.channels.write_address_channel.AWADDR <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 240:44]
    io.channels.write_address_channel.AWVALID <= AWVALID @[src/main/scala/bus/AXI4Lite.scala 241:45]
    reg WVALID : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 242:23]
    io.channels.write_data_channel.WVALID <= WVALID @[src/main/scala/bus/AXI4Lite.scala 243:41]
    io.channels.write_data_channel.WDATA <= write_data @[src/main/scala/bus/AXI4Lite.scala 244:40]
    io.channels.write_address_channel.AWPROT <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 245:44]
    node io_channels_write_data_channel_WSTRB_lo = cat(write_strobe[1], write_strobe[0]) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    node io_channels_write_data_channel_WSTRB_hi = cat(write_strobe[3], write_strobe[2]) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    node _io_channels_write_data_channel_WSTRB_T = cat(io_channels_write_data_channel_WSTRB_hi, io_channels_write_data_channel_WSTRB_lo) @[src/main/scala/bus/AXI4Lite.scala 246:56]
    io.channels.write_data_channel.WSTRB <= _io_channels_write_data_channel_WSTRB_T @[src/main/scala/bus/AXI4Lite.scala 246:40]
    reg BREADY : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 247:23]
    io.channels.write_response_channel.BREADY <= BREADY @[src/main/scala/bus/AXI4Lite.scala 248:45]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    node _T_1 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/bus/AXI4Lite.scala 250:17]
    when _T_2 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
      WVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 252:14]
      AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 253:15]
      ARVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 254:15]
      RREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 255:14]
      read_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 256:18]
      write_valid <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 257:19]
      when io.bundle.write : @[src/main/scala/bus/AXI4Lite.scala 258:29]
        state <= UInt<2>("h3") @[src/main/scala/bus/AXI4Lite.scala 259:15]
        addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 260:14]
        write_data <= io.bundle.write_data @[src/main/scala/bus/AXI4Lite.scala 261:20]
        write_strobe <= io.bundle.write_strobe @[src/main/scala/bus/AXI4Lite.scala 262:22]
      else :
        when io.bundle.read : @[src/main/scala/bus/AXI4Lite.scala 263:34]
          state <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 264:15]
          addr <= io.bundle.address @[src/main/scala/bus/AXI4Lite.scala 265:14]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      node _T_4 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/bus/AXI4Lite.scala 250:17]
      when _T_5 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
        ARVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 269:15]
        io.channels.read_address_channel.ARADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 270:47]
        node _T_6 = and(io.channels.read_address_channel.ARREADY, ARVALID) @[src/main/scala/bus/AXI4Lite.scala 271:53]
        when _T_6 : @[src/main/scala/bus/AXI4Lite.scala 271:65]
          state <= UInt<2>("h2") @[src/main/scala/bus/AXI4Lite.scala 272:15]
          io.channels.read_address_channel.ARADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 273:49]
          ARVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 274:17]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        node _T_8 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/bus/AXI4Lite.scala 250:17]
        when _T_9 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_10 = eq(io.channels.read_data_channel.RRESP, UInt<1>("h0")) @[src/main/scala/bus/AXI4Lite.scala 278:88]
          node _T_11 = and(io.channels.read_data_channel.RVALID, _T_10) @[src/main/scala/bus/AXI4Lite.scala 278:49]
          when _T_11 : @[src/main/scala/bus/AXI4Lite.scala 278:97]
            state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 279:15]
            read_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 280:20]
            RREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 281:16]
            read_data <= io.channels.read_data_channel.RDATA @[src/main/scala/bus/AXI4Lite.scala 282:19]
        else :
          node _T_12 = asUInt(UInt<2>("h3")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_13 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          node _T_14 = eq(_T_12, _T_13) @[src/main/scala/bus/AXI4Lite.scala 250:17]
          when _T_14 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
            AWVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 286:15]
            io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 287:48]
            node _T_15 = and(io.channels.write_address_channel.AWREADY, AWVALID) @[src/main/scala/bus/AXI4Lite.scala 288:54]
            when _T_15 : @[src/main/scala/bus/AXI4Lite.scala 288:66]
              state <= UInt<3>("h4") @[src/main/scala/bus/AXI4Lite.scala 289:15]
              io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 290:50]
              AWVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 291:17]
          else :
            node _T_16 = asUInt(UInt<3>("h4")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            node _T_17 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            node _T_18 = eq(_T_16, _T_17) @[src/main/scala/bus/AXI4Lite.scala 250:17]
            when _T_18 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
              WVALID <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 295:14]
              io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 296:48]
              node _T_19 = and(io.channels.write_data_channel.WREADY, WVALID) @[src/main/scala/bus/AXI4Lite.scala 297:50]
              when _T_19 : @[src/main/scala/bus/AXI4Lite.scala 297:61]
                io.channels.write_address_channel.AWADDR <= addr @[src/main/scala/bus/AXI4Lite.scala 298:50]
                state <= UInt<3>("h5") @[src/main/scala/bus/AXI4Lite.scala 299:15]
                WVALID <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 300:16]
            else :
              node _T_20 = asUInt(UInt<3>("h5")) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              node _T_21 = asUInt(state) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              node _T_22 = eq(_T_20, _T_21) @[src/main/scala/bus/AXI4Lite.scala 250:17]
              when _T_22 : @[src/main/scala/bus/AXI4Lite.scala 250:17]
                BREADY <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 304:14]
                node _T_23 = and(io.channels.write_response_channel.BVALID, BREADY) @[src/main/scala/bus/AXI4Lite.scala 305:54]
                when _T_23 : @[src/main/scala/bus/AXI4Lite.scala 305:65]
                  state <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 306:15]
                  write_valid <= UInt<1>("h1") @[src/main/scala/bus/AXI4Lite.scala 307:21]
                  BREADY <= UInt<1>("h0") @[src/main/scala/bus/AXI4Lite.scala 308:16]


  module ROMLoader :
    input clock : Clock
    input reset : Reset
    output io : { channels : { write_address_channel : { AWVALID : UInt<1>, flip AWREADY : UInt<1>, AWADDR : UInt<32>, AWPROT : UInt<3>}, write_data_channel : { WVALID : UInt<1>, flip WREADY : UInt<1>, WDATA : UInt<32>, WSTRB : UInt<4>}, write_response_channel : { flip BVALID : UInt<1>, BREADY : UInt<1>, flip BRESP : UInt<2>}, read_address_channel : { ARVALID : UInt<1>, flip ARREADY : UInt<1>, ARADDR : UInt<32>, ARPROT : UInt<3>}, read_data_channel : { flip RVALID : UInt<1>, RREADY : UInt<1>, flip RDATA : UInt<32>, flip RRESP : UInt<2>}}, rom_address : UInt<32>, flip rom_data : UInt<32>, flip load_start : UInt<1>, flip load_address : UInt<32>, load_finished : UInt<1>} @[src/main/scala/peripheral/ROMLoader.scala 22:14]

    inst master of AXI4LiteMaster_2 @[src/main/scala/peripheral/ROMLoader.scala 32:22]
    master.clock <= clock
    master.reset <= reset
    master.io.channels.read_data_channel.RRESP <= io.channels.read_data_channel.RRESP @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    master.io.channels.read_data_channel.RDATA <= io.channels.read_data_channel.RDATA @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.read_data_channel.RREADY <= master.io.channels.read_data_channel.RREADY @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    master.io.channels.read_data_channel.RVALID <= io.channels.read_data_channel.RVALID @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.read_address_channel.ARPROT <= master.io.channels.read_address_channel.ARPROT @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.read_address_channel.ARADDR <= master.io.channels.read_address_channel.ARADDR @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    master.io.channels.read_address_channel.ARREADY <= io.channels.read_address_channel.ARREADY @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.read_address_channel.ARVALID <= master.io.channels.read_address_channel.ARVALID @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    master.io.channels.write_response_channel.BRESP <= io.channels.write_response_channel.BRESP @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.write_response_channel.BREADY <= master.io.channels.write_response_channel.BREADY @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    master.io.channels.write_response_channel.BVALID <= io.channels.write_response_channel.BVALID @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.write_data_channel.WSTRB <= master.io.channels.write_data_channel.WSTRB @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.write_data_channel.WDATA <= master.io.channels.write_data_channel.WDATA @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    master.io.channels.write_data_channel.WREADY <= io.channels.write_data_channel.WREADY @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.write_data_channel.WVALID <= master.io.channels.write_data_channel.WVALID @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.write_address_channel.AWPROT <= master.io.channels.write_address_channel.AWPROT @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.write_address_channel.AWADDR <= master.io.channels.write_address_channel.AWADDR @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    master.io.channels.write_address_channel.AWREADY <= io.channels.write_address_channel.AWREADY @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    io.channels.write_address_channel.AWVALID <= master.io.channels.write_address_channel.AWVALID @[src/main/scala/peripheral/ROMLoader.scala 33:22]
    reg address : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 35:24]
    reg valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 36:22]
    reg loading : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 37:24]
    master.io.bundle.read <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 39:25]
    io.load_finished <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 40:20]
    when io.load_start : @[src/main/scala/peripheral/ROMLoader.scala 42:23]
      valid <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 43:11]
      loading <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 44:13]
      address <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 45:13]
    master.io.bundle.write <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 48:26]
    master.io.bundle.write_data <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 49:31]
    wire _WIRE : UInt<1>[4] @[src/main/scala/peripheral/ROMLoader.scala 50:43]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 50:43]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 50:43]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 50:43]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 50:43]
    master.io.bundle.write_strobe[0] <= _WIRE[0] @[src/main/scala/peripheral/ROMLoader.scala 50:33]
    master.io.bundle.write_strobe[1] <= _WIRE[1] @[src/main/scala/peripheral/ROMLoader.scala 50:33]
    master.io.bundle.write_strobe[2] <= _WIRE[2] @[src/main/scala/peripheral/ROMLoader.scala 50:33]
    master.io.bundle.write_strobe[3] <= _WIRE[3] @[src/main/scala/peripheral/ROMLoader.scala 50:33]
    master.io.bundle.address <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 51:28]
    node _T = eq(loading, UInt<1>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 53:8]
    node _T_1 = eq(master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 53:20]
    node _T_2 = and(_T, _T_1) @[src/main/scala/peripheral/ROMLoader.scala 53:17]
    node _T_3 = geq(address, UInt<11>("h41a")) @[src/main/scala/peripheral/ROMLoader.scala 53:54]
    node _T_4 = and(_T_2, _T_3) @[src/main/scala/peripheral/ROMLoader.scala 53:43]
    when _T_4 : @[src/main/scala/peripheral/ROMLoader.scala 53:75]
      io.load_finished <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 54:22]
    when loading : @[src/main/scala/peripheral/ROMLoader.scala 56:17]
      valid <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 57:11]
      node _T_5 = eq(master.io.bundle.busy, UInt<1>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 58:10]
      node _T_6 = eq(master.io.bundle.write_valid, UInt<1>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 58:36]
      node _T_7 = and(_T_5, _T_6) @[src/main/scala/peripheral/ROMLoader.scala 58:33]
      when _T_7 : @[src/main/scala/peripheral/ROMLoader.scala 58:67]
        when valid : @[src/main/scala/peripheral/ROMLoader.scala 59:19]
          master.io.bundle.write <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 60:32]
          master.io.bundle.write_data <= io.rom_data @[src/main/scala/peripheral/ROMLoader.scala 61:37]
          wire _WIRE_1 : UInt<1>[4] @[src/main/scala/peripheral/ROMLoader.scala 62:49]
          _WIRE_1[0] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 62:49]
          _WIRE_1[1] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 62:49]
          _WIRE_1[2] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 62:49]
          _WIRE_1[3] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 62:49]
          master.io.bundle.write_strobe[0] <= _WIRE_1[0] @[src/main/scala/peripheral/ROMLoader.scala 62:39]
          master.io.bundle.write_strobe[1] <= _WIRE_1[1] @[src/main/scala/peripheral/ROMLoader.scala 62:39]
          master.io.bundle.write_strobe[2] <= _WIRE_1[2] @[src/main/scala/peripheral/ROMLoader.scala 62:39]
          master.io.bundle.write_strobe[3] <= _WIRE_1[3] @[src/main/scala/peripheral/ROMLoader.scala 62:39]
          node _master_io_bundle_address_T = dshl(address, UInt<2>("h2")) @[src/main/scala/peripheral/ROMLoader.scala 63:46]
          node _master_io_bundle_address_T_1 = add(_master_io_bundle_address_T, io.load_address) @[src/main/scala/peripheral/ROMLoader.scala 63:61]
          node _master_io_bundle_address_T_2 = tail(_master_io_bundle_address_T_1, 1) @[src/main/scala/peripheral/ROMLoader.scala 63:61]
          master.io.bundle.address <= _master_io_bundle_address_T_2 @[src/main/scala/peripheral/ROMLoader.scala 63:34]
      when master.io.bundle.write_valid : @[src/main/scala/peripheral/ROMLoader.scala 66:40]
        node _T_8 = geq(address, UInt<11>("h41a")) @[src/main/scala/peripheral/ROMLoader.scala 67:20]
        when _T_8 : @[src/main/scala/peripheral/ROMLoader.scala 67:41]
          loading <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 68:17]
        else :
          loading <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 70:17]
          node _address_T = add(address, UInt<1>("h1")) @[src/main/scala/peripheral/ROMLoader.scala 71:28]
          node _address_T_1 = tail(_address_T, 1) @[src/main/scala/peripheral/ROMLoader.scala 71:28]
          address <= _address_T_1 @[src/main/scala/peripheral/ROMLoader.scala 71:17]
          valid <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 72:15]
      else :
        address <= address @[src/main/scala/peripheral/ROMLoader.scala 75:15]
    io.rom_address <= address @[src/main/scala/peripheral/ROMLoader.scala 78:18]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io : { led : UInt<1>, tx : UInt<1>, flip rx : UInt<1>} @[src/main/scala/board/z710/z710/Top.scala 26:14]

    reg boot_state : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/board/z710/z710/Top.scala 37:27]
    inst uart of Uart @[src/main/scala/board/z710/z710/Top.scala 39:20]
    uart.clock <= clock
    uart.reset <= reset
    io.tx <= uart.io.txd @[src/main/scala/board/z710/z710/Top.scala 40:9]
    uart.io.rxd <= io.rx @[src/main/scala/board/z710/z710/Top.scala 41:15]
    inst cpu of CPU_1 @[src/main/scala/board/z710/z710/Top.scala 43:19]
    cpu.clock <= clock
    cpu.reset <= reset
    inst mem of Memory @[src/main/scala/board/z710/z710/Top.scala 44:19]
    mem.clock <= clock
    mem.reset <= reset
    inst timer of Timer @[src/main/scala/board/z710/z710/Top.scala 45:21]
    timer.clock <= clock
    timer.reset <= reset
    inst dummy of DummySlave @[src/main/scala/board/z710/z710/Top.scala 46:21]
    dummy.clock <= clock
    dummy.reset <= reset
    inst bus_arbiter of BusArbiter @[src/main/scala/board/z710/z710/Top.scala 47:27]
    bus_arbiter.clock <= clock
    bus_arbiter.reset <= reset
    inst bus_switch of BusSwitch @[src/main/scala/board/z710/z710/Top.scala 48:26]
    bus_switch.clock <= clock
    bus_switch.reset <= reset
    inst instruction_rom of InstructionROM @[src/main/scala/board/z710/z710/Top.scala 50:31]
    instruction_rom.clock <= clock
    instruction_rom.reset <= reset
    inst rom_loader of ROMLoader @[src/main/scala/board/z710/z710/Top.scala 51:26]
    rom_loader.clock <= clock
    rom_loader.reset <= reset
    bus_arbiter.io.bus_request[0] <= UInt<1>("h1") @[src/main/scala/board/z710/z710/Top.scala 53:33]
    bus_switch.io.master <= cpu.io.axi4_channels @[src/main/scala/board/z710/z710/Top.scala 55:24]
    bus_switch.io.address <= cpu.io.bus_address @[src/main/scala/board/z710/z710/Top.scala 56:25]
    dummy.io.channels <= bus_switch.io.slaves[0] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    dummy.io.channels <= bus_switch.io.slaves[1] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    dummy.io.channels <= bus_switch.io.slaves[2] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    dummy.io.channels <= bus_switch.io.slaves[3] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    dummy.io.channels <= bus_switch.io.slaves[4] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    dummy.io.channels <= bus_switch.io.slaves[5] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    dummy.io.channels <= bus_switch.io.slaves[6] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    dummy.io.channels <= bus_switch.io.slaves[7] @[src/main/scala/board/z710/z710/Top.scala 58:29]
    rom_loader.io.load_address <= UInt<32>("h1000") @[src/main/scala/board/z710/z710/Top.scala 60:30]
    rom_loader.io.load_start <= UInt<1>("h0") @[src/main/scala/board/z710/z710/Top.scala 61:28]
    rom_loader.io.rom_data <= instruction_rom.io.data @[src/main/scala/board/z710/z710/Top.scala 62:26]
    instruction_rom.io.address <= rom_loader.io.rom_address @[src/main/scala/board/z710/z710/Top.scala 63:30]
    cpu.io.stall_flag_bus <= UInt<1>("h1") @[src/main/scala/board/z710/z710/Top.scala 64:25]
    cpu.io.instruction_valid <= UInt<1>("h0") @[src/main/scala/board/z710/z710/Top.scala 65:28]
    mem.io.channels <= bus_switch.io.slaves[0] @[src/main/scala/board/z710/z710/Top.scala 66:27]
    dummy.io.channels <= rom_loader.io.channels @[src/main/scala/board/z710/z710/Top.scala 67:26]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/board/z710/z710/Top.scala 68:22]
    node _T_1 = asUInt(boot_state) @[src/main/scala/board/z710/z710/Top.scala 68:22]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/board/z710/z710/Top.scala 68:22]
    when _T_2 : @[src/main/scala/board/z710/z710/Top.scala 68:22]
      rom_loader.io.load_start <= UInt<1>("h1") @[src/main/scala/board/z710/z710/Top.scala 70:32]
      boot_state <= UInt<1>("h1") @[src/main/scala/board/z710/z710/Top.scala 71:18]
      mem.io.channels <= rom_loader.io.channels @[src/main/scala/board/z710/z710/Top.scala 72:30]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/board/z710/z710/Top.scala 68:22]
      node _T_4 = asUInt(boot_state) @[src/main/scala/board/z710/z710/Top.scala 68:22]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/board/z710/z710/Top.scala 68:22]
      when _T_5 : @[src/main/scala/board/z710/z710/Top.scala 68:22]
        rom_loader.io.load_start <= UInt<1>("h0") @[src/main/scala/board/z710/z710/Top.scala 75:32]
        mem.io.channels <= rom_loader.io.channels @[src/main/scala/board/z710/z710/Top.scala 76:30]
        when rom_loader.io.load_finished : @[src/main/scala/board/z710/z710/Top.scala 77:41]
          boot_state <= UInt<2>("h3") @[src/main/scala/board/z710/z710/Top.scala 78:20]
      else :
        node _T_6 = asUInt(UInt<2>("h3")) @[src/main/scala/board/z710/z710/Top.scala 68:22]
        node _T_7 = asUInt(boot_state) @[src/main/scala/board/z710/z710/Top.scala 68:22]
        node _T_8 = eq(_T_6, _T_7) @[src/main/scala/board/z710/z710/Top.scala 68:22]
        when _T_8 : @[src/main/scala/board/z710/z710/Top.scala 68:22]
          cpu.io.stall_flag_bus <= UInt<1>("h0") @[src/main/scala/board/z710/z710/Top.scala 82:29]
          cpu.io.instruction_valid <= UInt<1>("h1") @[src/main/scala/board/z710/z710/Top.scala 83:32]
    uart.io.channels <= bus_switch.io.slaves[2] @[src/main/scala/board/z710/z710/Top.scala 87:27]
    timer.io.channels <= bus_switch.io.slaves[4] @[src/main/scala/board/z710/z710/Top.scala 88:27]
    node _cpu_io_interrupt_flag_T = cat(uart.io.signal_interrupt, timer.io.signal_interrupt) @[src/main/scala/board/z710/z710/Top.scala 90:31]
    cpu.io.interrupt_flag <= _cpu_io_interrupt_flag_T @[src/main/scala/board/z710/z710/Top.scala 90:25]
    cpu.io.debug_read_address <= UInt<1>("h0") @[src/main/scala/board/z710/z710/Top.scala 92:29]
    mem.io.debug_read_address <= UInt<1>("h0") @[src/main/scala/board/z710/z710/Top.scala 93:29]
    reg led_count : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/board/z710/z710/Top.scala 99:26]
    node _T_9 = geq(led_count, UInt<27>("h5f5e100")) @[src/main/scala/board/z710/z710/Top.scala 100:19]
    when _T_9 : @[src/main/scala/board/z710/z710/Top.scala 100:34]
      led_count <= UInt<1>("h0") @[src/main/scala/board/z710/z710/Top.scala 101:15]
    else :
      node _led_count_T = add(led_count, UInt<1>("h1")) @[src/main/scala/board/z710/z710/Top.scala 103:28]
      node _led_count_T_1 = tail(_led_count_T, 1) @[src/main/scala/board/z710/z710/Top.scala 103:28]
      led_count <= _led_count_T_1 @[src/main/scala/board/z710/z710/Top.scala 103:15]
    node _io_led_T = shr(UInt<27>("h5f5e100"), 1) @[src/main/scala/board/z710/z710/Top.scala 106:39]
    node _io_led_T_1 = geq(led_count, _io_led_T) @[src/main/scala/board/z710/z710/Top.scala 106:24]
    io.led <= _io_led_T_1 @[src/main/scala/board/z710/z710/Top.scala 106:10]

