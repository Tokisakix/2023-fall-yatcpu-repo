# RISC-V 指令集架构

By: [:material-github: howardlau1999](https://github.com/howardlau1999), Purple Power

RISC-V 是一种精简指令集架构，其支持32位和64位，及各种扩展。如 `rv32im` 指 32位 RISC-V 架构并支持 I拓展（整数运算，所有 RISC-V 架构必须支持） 和 M拓展（乘法支持）。
本实验中，我们将实现最基础的 RISC-V 32位架构的 CPU，并支持整数运算。
在此之前，您需要先了解 RISC-V 指令的格式。




## 指令格式

RISC-V 有六种基本的指令类型：

- R 类型指令，用于寄存器-寄存器操作
- I 类型指令，用于短立即数和访存 load 操作
- S 类型指令，用于访存 store 操作
- B 类型指令，用于条件跳转操作
- U 类型指令，用于长立即数
- J 类型指令，用于无条件跳转 

这些指令支持基本的整数运算，您可以通过 risc-v reference card 以快速查阅其格式或汇编指令语法，下面给出的两个 refcards 第一页就能基本覆盖实验所需，您也可以在 Google 搜索 RISC-V reference card 等关键词以查找。

[RISC-V ISA Reference Card](https://github.com/jameslzhu/riscv-card/releases/download/latest/riscv-card.pdf)

[RISC-V Assembly Reference Card](https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf)

??? abstract "RISC-V 基础整数指令格式及汇编语法 refcard"
    ![](../cheatsheets/images/riscv-refcard-page1-fmt-32i.png)

    ![](../cheatsheets/images/riscv-asm-refcard-page1.png)

TODO: asm example and godbolt showcase

## Spike 模拟器

TODO: more

[Spike](https://github.com/riscv-software-src/riscv-isa-sim) 是一个 RISC-V ISA 模拟器，支持多种 RISC-V 扩展，通常被人们拿来作为参考实现，以验证自己实现的正确性。





