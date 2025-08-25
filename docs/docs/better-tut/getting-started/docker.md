# Docker 配置指南

!!!tips "如果你不了解什么是 Docker"
    如果你不知道什么是 Docker，可以直接跳过这一节，按照下面的 Windows 或 Linux/WSL 配置方法在本机进行配置。

该方法适用于 Windows、Linux 和 macOS 系统。

首先到 [Docker 官方网站](https://docs.docker.com/engine/install/#supported-platforms) 选择并下载你使用的操作系统所对应的安装包，按照安装指南配置好 Docker。Docker 环境中含有 Scala 开发环境以及 Verilator 仿真器，但不包含 Vivado。如果你不需要烧板，那么使用 Docker 环境就可以完成所有实验以及软件测试了。

之后，只需要运行

```bash
docker run -it --rm howardlau1999/yatcpu
sbt test
```

Docker 会自动下载我们准备好的镜像并运行容器。如果成功执行，你会看到类似这样的输出。

```
[success] Total time: 385 s (06:25), completed Dec 15, 2021, 8:45:25 PM
```

Docker 中的 YatCPU 代码可能不是最新版，且容器结束运行之后所有修改都将丢失，如果你需要完成实验，需要先将代码仓库克隆到本机，然后在运行 Docker 容器时挂载本机目录：

```
git clone --recursive https://github.com/Tokisakix/2023-fall-yatcpu-repo
docker run -it --rm -v yatcpu:/root/yatcpu howardlau1999/yatcpu
```

按照这种方法在容器中所做的修改将保存到本机文件夹，反之同理。

