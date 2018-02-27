#!/bin/bash

[ "$NDK_ROOT" != "" ] || echo "Need to set NDK_ROOT!"
[ "$ANDROID_CMAKE" != "" ] || echo "Need to set ANDROID_CMAKE!"

rm -rf build && mkdir build && cd build

$ANDROID_CMAKE \
    .. \
    -DCMAKE_TOOLCHAIN_FILE=$NDK_ROOT/build/cmake/android.toolchain.cmake \
    -DANDROID_NDK=$NDK_ROOT \
    -DANDROID_NATIVE_API_LEVEL=19 \
    -DANDROID_ABI=x86 \
    -DANDROID_TOOLCHAIN=clang \
    -DCMAKE_BUILD_TYPE=Release \
&& make

adb push test_segfault /data/local/tmp/test && \
adb shell chmod +x /data/local/tmp/test && \
adb shell "cd /data/local/tmp && ./test && echo Success! || echo Failed! "
