#!/bin/bash

[ "$NDK_ROOT" != "" ] || echo "Need to set NDK_ROOT!"

ARCH=x86 # Comment to build arm

if [ "$ARCH" == "x86" ]; then
	SYSROOT=$NDK_ROOT/platforms/android-19/arch-x86
	GCC_TOOLCHAIN=$NDK_ROOT/toolchains/x86-4.9/prebuilt/linux-x86_64
	TARGET=i686-none-linux-android
else
	SYSROOT=$NDK_ROOT/platforms/android-19/arch-arm
	GCC_TOOLCHAIN=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
	TARGET=armv7-none-linux-androideabi
fi

CXX=$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++

CXX_OPTIONS="--sysroot=$SYSROOT -target $TARGET -O0 -std=c++14"
LD_OPTIONS="--sysroot=$SYSROOT -target $TARGET -gcc-toolchain $GCC_TOOLCHAIN -pie"

$CXX $CXX_OPTIONS -c main.cpp -o main.o && \
$CXX $LD_OPTIONS -o test main.o && \
adb push test /data/local/tmp/test && \
adb shell chmod +x /data/local/tmp/test && \
adb shell "cd /data/local/tmp && ./test && echo Success! || echo Failed! "
