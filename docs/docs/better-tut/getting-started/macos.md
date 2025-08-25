# macOS 配置指南

By: [:material-github: wu-kan](https://github.com/wu-kan)、[:material-github: howardlau1999](https://github.com/howardlau1999)

!!! warning "macOS 无法烧板"
    除了 Vivado 之外，所有工具都可以在 macOS 上运行，也即可以顺利完成软件测试以及波形仿真。但由于 **Vivado 无法在 macOS 上安装**，所以如果你使用的是 macOS 并且**需要进行烧板实验**，请通过虚拟机或使用其他设备等方式使用上述的操作系统进行实验。


打开终端，执行以下命令安装 Homebrew（已经安装的可以跳过）：

```bash
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

/bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
```

完全退出终端，重新打开终端，执行以下命令安装依赖：

```bash
brew install llvm cmake verilator sbt
```

由于 macOS 系统有可能已经自带了 LLVM 工具链，如果需要使用 Homebrew 安装的 LLVM 工具链，需要设置环境变量：

```bash
export PATH=$(brew --prefix llvm)/bin:$PATH
```

上面也可以添加到 `~/.bashrc` 或 `~/.zshrc` 中，以便每次打开终端时自动设置。

执行命令 `verilator --version` 测试安装是否成功。如果安装无误，应当看到如下输出（版本号可能不同）：

```
Verilator 5.016 2023-09-16 rev UNKNOWN.REV
```

之后，运行仿真测试的时候，测试框架将自动寻找 Verilator 并用来加速。

上面完成了 macOS 的命令行配置，和 Linux 差不多，如果你更喜欢图形化操作，macOS 上也可以使用 IDEA IDE，配置方法参考 Windows 环境配置一节。

