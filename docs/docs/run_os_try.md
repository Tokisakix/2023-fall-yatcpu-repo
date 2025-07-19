2025-02-19 01:19:45

# Tried to run egos-2000 on Single-Cycle RV32IM_Zicsr processor

## Results

**FAILED**. Verilator simulation shows some correct output but loops infinitely in `disk_init()`. Vivado synthesis failed.

## EGOS-2000

egos provides basic, runnable OS without any modification on qemu SiFive multi-core system. 

## Efforts

1. M-extension support, not tested
   1. see `ALU`, `ALUControl`
2. added MMIO regs `mtime` and `mtimecmp` for egos-2000 timing, not tested
   1. see `CLINT`
3. modify memory map in `Top.scala`, assign 0x8xxxxxxx for memory; egos uses 16MB for RAM
4. implement neccessary CSRs, `mvendorid`, `mhartid`, `marchid`, etc, to disguise CPU as ARTY platform in egos
5. modify egos UART address in `tty.c`, `NCORE` in `egos.h`
6. modify `boot.S` amoswap.w.aq instruction to simple loop only suitable for single-core (the only place using atomic operations)
   ```asm
    boot_aq_again:
    lw t2, 0(t0)
    bnez t2, boot_aq_again
    sw t1, 0(t0)
    li t1, 0
   ```
7. use xpack on Linux to build egos-2000 and copy out the .text, .data, etc. sections to assembly binary file.
8. tried to implement A-extension for Atomic Memory Operation. However, `amoswap` requires read and write to memory in the same CPU cycle.
   1. detached `MemoryAccess` read and write signal processing, so read and write can run concurrently
   2. `SyncMem` provides sequential read, where the data is available at the next cycle of the request. 
   3. Current memory and CPU interaction is tricky and unstable, CPU is div-freq so a CPU cycle is longer than memory read/write. This causes mem-arith-mem loop.
   4. Some read done mechanism should be added, and single cycle CPU should stall until memory read data available. This can help later labs for adding cache.


## Reasons

1. Vivado Synthesis failed due to insufficient RAMB18: egos uses 16MB memory, which is now synthesised on PL.
2. Cannot handle file system, it requires SPI to SD card, or read only Flash ROM


## TODO

1. rebase project on lab4 with AXI4 support
2. connect to Zynq board memory through AXI4
3. connect to Flash ROM or SD
4. [optional] add memory read done and stall mechanism

