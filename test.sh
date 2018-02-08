#!/bin/bash

NDK_ROOT=/home/fast_drive/android-tools-2gis/android-sdk/ndk-bundle

SYSROOT=$NDK_ROOT/platforms/android-19/arch-x86
CXX=$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++

INCLUDES="-isystem$NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include -isystem$NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/x86/include"

CXX_OPTIONS="-MD -MF -DANDROID -D_UNICODE -DUNICODE -DNDEBUG --sysroot=$SYSROOT -target i686-none-linux-android -fPIE -O0 -std=c++14 "
LD_OPTIONS="--sysroot=$SYSROOT -target i686-none-linux-android -gcc-toolchain $NDK_ROOT/toolchains/x86-4.9/prebuilt/linux-x86_64 -fPIE -pie -O0"



$CXX $CXX_OPTIONS -c main.cpp -o main.o
$CXX $LD_OPTIONS -o test main.o
