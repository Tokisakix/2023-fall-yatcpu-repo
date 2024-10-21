# YatCPU

YatCPU (Yet another toy CPU，逸芯) 是一款开源、开发中的教学用 RISC-V 处理器，基于 Chisel 硬件设计语言实现，并用于中山大学 (Sun Yat-sen University) 计算机学院冯班组成原理实验课程的教学。同样欢迎其他高校相关课程使用！

本仓库由 [Tokisakix](https://github.com/Tokisakix)、[PurplePower](https://github.com/PurplePower)、[Han Huang](https://github.com/HHTheBest) 在 [2022-fall-yatcpu-repo](https://github.com/hrpccs/2022-fall-yatcpu-repo) 的基础上结合 2023 计组教学实情整理而来，有较多原创内容

非常感谢 [xy3](https://github.com/xy3xy3) 在此仓库开发期间多次帮我测试代码文件

联系我们：xurlin5@mail2.sysu.edu.cn

## Getting Started

你可以选择在线阅读我们编写的[配套文档](http://www.tokisakix.cn/2023-Fall-YatCPU-Docs/)

你也可以选择在下载到本地后阅读

```
git clone https://github.com/Tokisakix/2023-fall-yatcpu-repo.git
cd 2023-fall-yatcpu-repo/docs
pip install -r requirements.txt
mkdocs serve
```

## TODO list

1. better automation
2. add riscv-m extension
3. using rx for receive from PC
4. using other display ports
5. summary of problems
6. add more test on alu source to ExecuteTest
7. bug on lab3 5-stage pipeline ID.rs2
8. TODO: ?disable verilator to debug
