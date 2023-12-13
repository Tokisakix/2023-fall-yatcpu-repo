# YatCPU

本仓库由 [Tokisakix](https://github.com/Tokisakix)、[PurplePower](https://github.com/PurplePower)、[Han Huang](https://github.com/HHTheBest) 在 [2022-fall-yatcpu-repo](https://github.com/hrpccs/2022-fall-yatcpu-repo) 的基础上结合 2023 机组教学实情整理而来，有较多原创内容

(PS: 能求个 star⭐ 吗 QAQ ~)

- [YatCPU](#yatcpu)
  * [为什么创建本仓库](#jmp1)
  * [本仓库的优势](#jmp2)
  * [如何使用本整合仓库](#jmp3)
    + [如何一键完成环境配置](#jmp31)
    + [如何使用一键烧板脚本](#jmp32)
  * [外部参考链接](#jmp4)

## <span id="jmp1">为什么创建本仓库？</span>

1.  开发环境配置困难，为配置开发环境需要付出很多精力，开发效率低
2.  学生在运行 <code>build.bat</code> 或 <code>build.sh</code> 时经常遇到问题
3.  原教学仓库 [2022-fall-yatcpu-repo](https://github.com/hrpccs/2022-fall-yatcpu-repo) 并不支持 ZYBO-Z710 开发板的烧录
4.  ZYBO-Z710 烧板流程复杂、为支持烧板脚本的正常运行需要学生手动根据助教增改很多文件，开发效率低

## <span id="jmp2">本整合仓库具有以下特点：</span>

- 提供基于 Vscode + Dev Container 一键环境配置工具和配套文档
- 已提前用 cmake 编译好测试文件，无须再运行 <code>build.bat</code> 或 <code>build.sh</code>
- 完全保留了原教学仓库的代码段填空设置和项目架构，代码迁移便利
- 支持 Basys3、Pynq、Verilator、ZYBO-Z710 四款开发板的一键烧录，学生可以专心把精力集中在 CPU 的编写

## <span id="jmp3">如何使用本整合仓库？</span>

下列内容主要讲述如何使用本仓库来完成开发环境的一键配置和一键烧板

### <span id="jmp31">如何使用一键完成环境配置</span>

[点击此处跳转页面](docs/env_doc.md)

### <span id="jmp32">如何使用一键烧板脚本</span>

[点击此处跳转页面](docs/board.md)

## <span id="jmp4">外部参考链接</span>
- [YatCPU 文档地址](https://yatcpu.sysu.tech)
- [YatCPU 的 Dev Container 环境配置](http://tokisakix.cn/2023/11/14/%5BDocker%5D%20YatCPU%20%E7%9A%84%20Dev%20container%20%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE/)
- [测试 Tokisakix 的烧板文件](https://blog.skyw.cc/archives/258.html)
