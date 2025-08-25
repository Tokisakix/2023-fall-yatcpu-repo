Writen By: [Tokisakix](https://github.com/Tokisakix)

# 前言

YatCPU (Yet another toy CPU，逸芯) 是一款开源、开发中的教学用 RISC-V 处理器，基于 Chisel 硬件设计语言实现，并用于中山大学 (Sun Yat-sen University) 计算机学院冯班组成原理实验课程的教学。同样欢迎其他高校相关课程使用！

本仓库由 [Tokisakix](https://github.com/Tokisakix)、[PurplePower](https://github.com/PurplePower)、[Han Huang](https://github.com/HHTheBest) 在 [2022-fall-yatcpu-repo](https://github.com/hrpccs/2022-fall-yatcpu-repo) 的基础上结合 2023 计组教学实情 及原 YatCPU 教学文档整理而来，改进了实验流程，有较多原创内容

非常感谢 [xy3](https://github.com/xy3xy3) 在此仓库开发期间多次帮我测试代码文件

(PS: 能求个 star⭐⭐⭐ 吗 QAQ ~)

## 为什么创建本仓库？

1.  开发环境配置困难，为配置开发环境需要付出很多精力，开发效率低
2.  学生在运行 <code>build.bat</code> 或 <code>build.sh</code> 时经常遇到问题
3.  原教学仓库 [2022-fall-yatcpu-repo](https://github.com/hrpccs/2022-fall-yatcpu-repo) 并不支持 ZYBO-Z710 开发板的烧录
4.  ZYBO-Z710 烧板流程复杂、为支持烧板脚本的正常运行需要学生手动根据助教增改很多文件，开发效率低

**基于上述问题，我们希望学生们在做计组实验时能把时间和精力集中在编写 CPU 上，而不是把额外的时间浪费在环境配置和烧板流程上**

## 本仓库具有的优势

- 提供基于 Vscode + Dev Container 一键环境配置工具和配套文档
- 已提前用 cmake 编译好测试文件，无须再运行 <code>build.bat</code> 或 <code>build.sh</code>
- 基本保留了原教学仓库的代码段填空设置和项目架构，代码迁移便利
- 改进了教程内容，对原教程中同学感到疑惑的部分增加引导和说明
- 支持 Basys3、Pynq、Verilator、ZYBO-Z710 四款开发板的一键烧录，学生可以专心把精力集中在 CPU 的编写

## 如何使用本整合仓库？

下列内容主要讲述如何使用本仓库来完成开发环境的一键配置和一键烧板

1. [如何使用一键完成环境配置](env.md)
2. [如何使用一键烧板脚本](board.md)

## 外部参考链接

- [YatCPU 文档地址](https://yatcpu.sysu.tech)
- [YatCPU 的 Dev Container 环境配置](http://tokisakix.cn/2023/11/14/%5BDocker%5D%20YatCPU%20%E7%9A%84%20Dev%20container%20%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE/)
- [测试 Tokisakix 的烧板文件](https://blog.skyw.cc/archives/258.html)
