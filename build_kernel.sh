#!/bin/bash

export ARCH=arm64
mkdir out
export SEC_BUILD_CONF_SIGNER_MODEL_NAME=SM-T867V_NA_VZW_GBL1
export BUILD_CROSS_COMPILE=$(pwd)/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export KERNEL_LLVM_BIN=$(pwd)/toolchain/llvm-arm-toolchain-ship/10.0/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export KERNEL_MAKE_ENV="CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE sm8150_sec_gts6l_usa_single_defconfig

make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
