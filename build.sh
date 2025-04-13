#!/usr/bin/env bash
grep -q "set(LLVM_VERSION_MAJOR 20.0.0)" ./src/llvm-project/llvm/CMakeLists.txt || echo "set(LLVM_VERSION_MAJOR 20.0.0)" >> ./src/llvm-project/llvm/CMakeLists.txt
./build-llvm.py --vendor-string="aosp" \
--targets ARM AArch64 \
--projects clang lld \
--build-stage1-only \
--no-update \
-i ./out/aosp-clang-20 \
-D LLVM_PARALLEL_COMPILE_JOBS=7 LLVM_PARALLEL_LINK_JOBS=7 \
--build-type Release \


#./build-binutils.py -B ./src/binutils* --targets arm-linux-gnueabi aarch64-linux-gnu -i ./out/binutls
