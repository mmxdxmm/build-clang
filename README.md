1、先配置运行环境

* ### 安装最新的编译器
  
  ```
  wget https://apt.llvm.org/llvm.sh -O llvm.sh && chmod +x llvm.sh && sudo ./llvm.sh 20
  ```

* ### Debian/Ubuntu

  ```
  sudo apt install bc \
              binutils-dev \
              bison \
              build-essential \
              ca-certificates \
              ccache \
              clang \
              cmake \
              curl \
              file \
              flex \
              git \
              libelf-dev \
              libssl-dev \
              libstdc++-$(apt list libstdc++6 2>/dev/null | grep -Eos '[0-9]+\.[0-9]+\.[0-9]+' | head -1 | cut -d . -f 1)-dev \
              lld \
              make \
              ninja-build \
              python3-dev \
              texinfo \
              u-boot-tools \
              xz-utils \
              zlib1g-dev
  ```

* ### Fedora

  ```
  dnf install bc \
              binutils-devel \
              bison \
              ccache \
              clang \
              cmake \
              elfutils-libelf-devel \
              flex \
              gcc \
              gcc-c++ \
              git \
              lld \
              make \
              ninja-build \
              openssl-devel \
              python3 \
              texinfo-tex \
              uboot-tools \
              xz \
              zlib-devel
  ```

* ### Arch Linux / Manjaro

  ```
  pacman -S base-devel \
            bc \
            bison \
            ccache \
            clang \
            cpio \
            cmake \
            flex \
            git \
            libelf \
            lld \
            llvm \
            ninja \
            openssl \
            python3 \
            uboot-tools
  ```

* ### Clear Linux

  ```
  swupd bundle-add c-basic \
                   ccache \
                   curl \
                   dev-utils \
                   devpkg-elfutils \
                   devpkg-openssl \
                   git \
                   python3-basic \
                   which
  ```

2、克隆仓库

  ```
  git clone -b sh https://github.com/mmxdxmm/build-clang.git build
  ```

3、进入项目

cd ./build


4、下载并解压源码

wget https://github.com/mmxdxmm/build-clang/releases/download/clang-r547379/llvm-project.zip -O llvm-project.zip

unzip llvm-project.zip

5、运行脚本

bash ninja_build_llvm.sh

或

bash make_build_llvm.sh

5、其他:

Android补丁仓库

git clone https://android.googlesource.com/toolchain/llvm_android

已编译工具参考，补丁请查看xxx_info.md文件https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+/refs/heads/main

自己打补丁则下载clang源码

git clone https://android.googlesource.com/toolchain/llvm-project

使用
git checkout
切换至提交，如

git checkout f142f8afe21bceb00fb495468aa0b5043e98c419

注：https://github.com/llvm/llvm-project/commits/f142f8afe21bceb00fb495468aa0b5043e98c419






～－－－－－－－－～
分割线




  
