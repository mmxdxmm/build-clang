#!/usr/bin/env bash
export PATH=$PWD/android-ndk-r28/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

grep -q "set(LLVM_VERSION_MAJOR 20.0.0)" ./src/llvm-project/llvm/CMakeLists.txt || echo "set(LLVM_VERSION_MAJOR 20.0.0)" >> ./src/llvm-project/llvm/CMakeLists.txt
./build-llvm.py --vendor-string="aosp" \
--targets ARM AArch64 \
--projects clang lld libc compiler-rt \
--build-stage1-only \
--no-update \
-i ./out/clang \
-D LLVM_PARALLEL_COMPILE_JOBS=7 LLVM_PARALLEL_LINK_JOBS=6 \
--build-type Release \


#./build-binutils.py -B ./src/binutils* --targets arm aarch64 -i ./out/binutils
