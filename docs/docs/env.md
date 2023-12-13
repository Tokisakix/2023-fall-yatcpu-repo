Writen By: [Tokisakix](https://github.com/Tokisakix)

# 如何使用 Vscode + Dev Container 来一键完成环境配置

> 如果你已经在你的设备上完成了开发的环境配置，可以选择跳过此内容。
> **此部分内容搬运自 [YatCPU 的 Dev Container 环境配置](http://tokisakix.cn/2023/11/14/%5BDocker%5D%20YatCPU%20%E7%9A%84%20Dev%20container%20%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE/)**，你可以前往文档原地址获得更好的阅读体验

使用 Docker + Dev Container 配置开发环境比较简单，而且也经过了测试，所以，我们推荐在 Windows 上直接使用 Dev Container 来设置开发环境。

按照安装指南配置好 Dev Container 环境，环境中含有 Scala 开发环境以及 Verilator 仿真器，但不包含 Vivado。如果你不需要烧板，那么使用 Dev Container 环境就可以完成所有实验以及软件测试了。

**软件安装**

安装 VSCode，直接在[官网下载](https://code.visualstudio.com/)

安装 Docker，直接在[官网下载](https://www.docker.com/)，你可以参照这个[视频教程](https://docker.easydoc.net/doc/81170005/cCewZWoN/lTKfePfP)配置

**安装 Dev Containers 插件**

在 VSCode 的扩展处搜索 Dev Containers，下载安装

![image](asset/devcontainer1.png)

**使用 Dev Containers 打开项目**

仓库内已经提前准备写好了启动 Dev Containers 的配置文件，所以我们无须自行编写配置文件，可以直接按 VSCode 左下角的蓝色按钮来运行 Dev Containers:

在上方的运行选项中选择在容器中重新打开，这个命令会让 Dev container 自动根据 <code>devcontainer.json</code> 里的配置信息来创建 Docker 环境

![image](asset/devcontainer2.png)

如果你是第一次在容器中打开，你可能需要十几分钟的时间等待容器配置完毕，如果在配置过程中发生异常，请检查你的网络情况后再次运行

**运行测试**

上述步骤完成后，我们就可以像在 Dev container 为我们配置好的开发环境中运行、调试代码了。

切换路径为 <code>2023-fall-yatcpu-repo/mini-yatcpu/</code>，新建终端并输入 <code>sbt test</code>，期望你有如下输出

![image](asset/devcontainer3.png)

```bash
[info] All tests passed.
[success] Total time: 181 s (03:01), completed Nov 14, 2023, 3:24:02 PM
```

后续当你需要再次启动开发环境时，按相同的步骤运行 Dev Containers 即可，此时 Dev Containers 会自动使用之前已经配置好的环境，不需要再次花费十几分钟等待环境配置