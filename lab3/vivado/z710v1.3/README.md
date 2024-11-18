# 如何使用脚本烧录 CPU 至 Zynq7010 FPGA V1.3_24/02 开发板并从 UART 读取输出

## 0. 预先准备

在执行下述步骤前，请确保完成：

1. 通过 CPUTest 确保实现无误.
2. 在 `src\main\scala\z710v1.3\Top.scala` 运行 `VerilogGenerator` 并生成 `verilog\z710v1.3\Top.v` 。
3. 确认您的板子确实为如下板子，**并调整好下图中 UART 选择的跳线（序号①处）**、连接好右侧的线。

<!-- ![开发板一览](resources/ZYNQ%207010开发板硬件资源.png) -->
<img src="resources/board-explain.png" alt="Alt Text" style="width:70%; height:auto;">



接下来将使用 Vivado 2020 或 2022 版本，更高版本应当也适用。您将在命令行调用这些工具，如果您已经将其所在目录添加到系统变量 PATH 中，则可直接在命令行中输入 `vivado` 进行调用，如目录 `E:\Xilinx\Vivado\2020.1\bin\vivado` 。
若还没有添加，可以使用 E:\Xilinx\Vivado\2020.1\bin\vivado 来代替。

若您使用 2020.1 或较久版本的 Xilinx 工具，在 Windows Powershell 中执行将在额外弹出的窗口中运行 `vivado` 和 `xsct`。您可以在命令前添加 `cmd /c` 以指定其在 cmd 中运行并保留输出至本窗口。

**以下操作均默认在 `vivado/z710v1.3` 目录下打开终端并执行，您可以使用 cd 命令切换目录。**


## 1. 生成 Vivado 项目

执行指令 

```pwsh
vivado -mode batch -source ./rv-z710v1.3-20.tcl
```

这将生成 Vivado 项目，成功后应能看见 `rv-z710v1.3-20\rv-z710v1.3-20.xpr` 文件，注意中途输出有无报错。

## 2. 生成比特流文件

执行指令

```pwsh
vivado -mode batch -source ./generate_bitstream.tcl
```

这可能耗费较长时间，成功后，您应看见 `vivado\z710v1.3\rv-z710v1.3-20\rv-z710v1.3-20.runs\impl_1\design_1_wrapper.bit` 文件，或成功的输出信息（可能略有不同）：

```text
...
Creating bitmap...
Creating bitstream...
Writing bitstream ./design_1_wrapper.bit...
INFO: [Vivado 12-1842] Bitgen Completed Successfully.
INFO: [Project 1-120] WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
INFO: [Common 17-83] Releasing license: Implementation
128 Infos, 1 Warnings, 0 Critical Warnings and 0 Errors encountered.
write_bitstream completed successfully
write_bitstream: Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 2220.910 ; gain = 419.598
INFO: [Common 17-206] Exiting Vivado at Mon Nov 18 17:22:21 2024...
[Mon Nov 18 17:22:26 2024] impl_1 finished
wait_on_run: Time (s): cpu = 00:00:00 ; elapsed = 00:01:05 . Memory (MB): peak = 1074.246 ; gain = 0.000
INFO: [Common 17-206] Exiting Vivado at Mon Nov 18 17:22:26 2024...
```

## 3. 烧录至开发板

确认您的开发板已调整跳线为使用 UART3 接口，见 [预先准备](#0-预先准备)。

将您的开发板连接至电脑，包括连接 USB-UART 的 type-C 口线缆 和 JTAG 烧录接口共两个口。若成功连接，您可在设备管理器 - 端口（COM 和 LPT）中看到 `USB Serial Port (COMx)` 端口，其中 `x` 为端口号，后面打开串口时就使用这个 COM 口。

然后执行指令 

```pwsh
vivado -mode batch -source ./program_device.tcl
```

若烧录成功，您应看见开发板中央的核心小板亮起绿灯，见 [预先准备](#0-预先准备) 图中的序号④。随后打开 PL_SW1 以开启时钟信号。

使用软件打开串口，您可以使用 MobaXTerm、XCom 或 Vitis 等来打开串口，设置 baud rate 为 115200，数据位 8、停止位 1、无校验位，即可收到 CPU 的输出 UART 信息，切换 PL_SW2 以发送 reset 信号重置 CPU 打印。



## For Maintainers

本板子 Zynq7010 Soc 引了 PL 到 UART3，因此可以直连而不必通过 ARM 核心转发 UART 信号。但有以下需要注意的：

- reset 信号在 Vivado 2020 中不要连接至 button 或使用 Utility Vector Logic 做 NOT 门，否则会导致乱码输出，原因未知，好像可以将 TX 输出连接到一个 ILA debug 模块使输出正常。在 Vivado 2022 中使用则无问题。
- `say_goodbye.c` 中打印间隔调大，因为时钟信号只有 50MHz
- 其他引线等资源参考 resources 下的内容
- 其他可参考 Z710 的 README.md
