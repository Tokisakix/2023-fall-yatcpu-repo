# 尝试使用 DDR3 板载内存

本文档记录使用 AXI4 接口使用 Zynq 开发板板载 DDR3 内存的尝试过程及经验总结。

## 进展

- 2025-08-24 基本知悉 通过 Zynq PS AXI_HP 连接 DDR 控制器的方法


## 注意事项

- 将 ILA 排除在工具链以外，ILA 无法检测板上 AXI 事务
- 通过将 LED 接入 wvalid 信号以检测 traffic generator 是否有写出数据
- read traffic generator 运行若干个事务后会停止
- PS 上运行程序时，会独占 DDR 控制器，PL 无法使用
- EMIO 似乎可以使得 PL 信号直达 UART
- 使用 AXI Interconnect 时，Address Editor 似乎无法为其分配地址，但是否影响功能尚未测试

## TODO

- 在 chisel 中编写简单部件，测试仅 PL 能否正确读写 DDR 内存，包括测试 AXI 实现的正确性
- 将所有 Top 的内存拆除，并引出 AXI4Lite 接口至外部
- 
