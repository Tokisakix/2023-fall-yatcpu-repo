# YatCPU

本仓库由 [Tokisakix](https://github.com/Tokisakix)、[PurplePower](https://github.com/PurplePower)、[Han Huang](https://github.com/HHTheBest) 在 [2022-fall-yatcpu-repo](https://github.com/hrpccs/2022-fall-yatcpu-repo) 的基础上结合教学实情整理而来

为什么需要本仓库？
1.  学生在使用 <code>build.bat</code> 或 <code>build.sh</code> 时经常遇到问题
2.  原教学仓库 [2022-fall-yatcpu-repo](https://github.com/hrpccs/2022-fall-yatcpu-repo) 并不支持 ZYBO-Z710 开发板的烧录
3.  ZYBO-Z710 烧板流程复杂、为支持烧板脚本的正常运行需要学生手动根据助教增改很多文件，开发效率低

本整合仓库具有以下特点：
- 已提前用 cmake 编译好测试文件，无须再运行 <code>build.bat</code> 或 <code>build.sh</code>
- 完全保留了原教学仓库的代码段填空设置和项目架构，代码迁移便利
- 支持 Basys3、Pynq、Verilator、ZYBO-Z710 四款开发板的一键烧录，学生可以专心把精力集中在 CPU 的编写

YatCPU [文档地址](https://yatcpu.sysu.tech)

Tokisakix [个人博客](http://tokisakix.cn/)/打广告/bushi

(PS: 能求个 star⭐ 吗 QAQ ~)
