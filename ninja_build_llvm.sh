yes | tar -xvf electron-binutils-2.41.tar.xz
BINUTILS_PATH=$PWD/electron-binutils-2.41/bin

export PATH=/lib/llvm-20/bin:$BINUTILS_PATH:$PATH

#grep -q "set(LLVM_VERSION_MAJOR 20.0.0)" ./llvm/CMakeLists.txt || echo "set(LLVM_VERSION_MAJOR 20.0.0)" >> ./llvm/CMakeLists.txt

cmake -G "Ninja" \
-DCMAKE_BUILD_TYPE=MinSizeRel \
-DCMAKE_INSTALL_PREFIX=./out/clang \
-DCLANG_VENDOR=aosp \
-DLLVM_PARALLEL_COMPILE_JOBS=4 \
-DLLVM_PARALLEL_LINK_JOBS=4 \
-DLLVM_TARGETS_TO_BUILD="ARM;AArch64" \
-DLLVM_ENABLE_PROJECTS="clang;lld;libc;compiler-rt" \
-DCMAKE_CXX_COMPILER=$(which clang++) \
-DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
-DCMAKE_CXX_FLAGS="-Wno-unused-command-line-argument ARCH=arm64 SUBARCH=arm64 O=out LLVM=1 CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- CROSS_COMPILE_COMPAT=arm-linux-gnueabi- CLANG_TRIPLE=aarch64-linux-gnu-" \
-DCMAKE_C_COMPILER=$(which clang) \
-DCMAKE_C_COMPILER_LAUNCHER=ccache \
-DCMAKE_C_FLAGS="-Wno-unused-command-line-argument ARCH=arm64 SUBARCH=arm64 O=out LLVM=1 CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- CROSS_COMPILE_COMPAT=arm-linux-gnueabi- CLANG_TRIPLE=aarch64-linux-gnu-" \
-DLLVM_ENABLE_LIBATOMIC=OFF \
-DLLVM-ENABLE_BOOTSTRAP=OFF \
-DLLVM_DEFAULT_TARGET_TRIPLE=aarch64-linux-gnu \
./llvm-project/llvm

ninja -j8

#选项解析
#export PATH:设置环境变量
#-G:设置构建器，make选"Unix Makefiles"，ninja选"Ninja"
#-DCMAKE_BUILD_TYPE:优化选项，可选MinSizeRel,RelWithDebInfo,Debug,Release
#-DCMAKE_INSTALL_PREFIX:编译完成后的安装目录
#-DCLANG_VENDOR:在工具版本前面添加供应商信息
#-DLLVM_PARALLEL_COMPILE_JOBS:编译线程数
#-DLLVM_PARALLEL_LINK_JOBS:链接阶段线程数
#-DLLVM_TARGETS_TO_BUILD:目标设备
#-DLLVM_ENABLE_PROJECTS:需要编译的工具
#-DCMAKE_CXX_COMPILER:C++编译器
#-DCMAKE_CXX_COMPILER_LAUNCHER:使用ccache缓存加速C++编译
#-DCMAKE_CXX_FLAGS:给C++编译器传递选项
#-DCMAKE_C_COMPILER:C编译器
#-DCMAKE_C_COMPILER_LAUNCHER:使用ccache缓存加速C编译
#-DCMAKE_C_FLAGS:给C编译器传递选项
#-DCMAKE_EXE_LINKER_FLAGS:给连接器传递选项，影响可执行文件链接
#-DCMAKE_SHARED_LINKER_FLAGS:给连接器传递选项，影响共享库链接
#-DCMAKE_MODULE_LINKER_FLAGS:…影响模块链接
#-DLLVM_USE_LINKER:连接器位置，如/bin/ld
#-CMAKE_LINKER:连接器位置
#-DLLVM_ENABLE_LIBATOMIC:开启/关闭latomic检测
#-DLLVM-ENABLE_BOOTSTRAP:开启/关闭多阶段构建，开启多阶段构建，会先编译clang，再用编译的clang构建其他项目
#-DLLVM_DEFAULT_TARGET_TRIPLE:检查编译选项
#./llvm-project/llvm:CMakeLists.txt的位置