#!/usr/bin/env bash
#export PATH=$PWD/cmake-4.0.1-linux-aarch64/bin:/lib/llvm-20/bin:$PATH

grep -q "set(LLVM_VERSION_MAJOR 20.0.0)" ./src/llvm-project/llvm/CMakeLists.txt || echo "set(LLVM_VERSION_MAJOR 20.0.0)" >> ./src/llvm-project/llvm/CMakeLists.txt
./build-llvm.py --vendor-string="aosp" \
--targets ARM AArch64 \
--projects clang lld libc compiler-rt \
--build-stage1-only \
--no-update \
-i ./out/clang \
-D LLVM_PARALLEL_COMPILE_JOBS=4 LLVM_PARALLEL_LINK_JOBS=2 \
--build-type Release \


#./build-binutils.py -B ./src/binutils* --targets arm aarch64 -i ./out/binutils
