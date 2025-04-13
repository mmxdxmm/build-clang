#!/usr/bin/env bash
grep -q "set(LLVM_VERSION_MAJOR 20.0.0)" ./src/llvm-project/llvm/CMakeLists.txt || echo "set(LLVM_VERSION_MAJOR 20.0.0)" >> ./src/llvm-project/llvm/CMakeLists.txt
./build-llvm.py --vendor-string Pdx --targets ARM AArch64 --projects clang lld --build-stage1-only --no-update -i ./out/clang


#./build-binutils.py -B ./src/binutils* --targets arm-linux-gnueabi aarch64-linux-gnu -i ./out/binutls
