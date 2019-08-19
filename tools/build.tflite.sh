# official guide
# bazel build -c opt //tensorflow/lite/tools/benchmark:benchmark \
#   --crosstool_top=//external:android/crosstool \
#   --host_crosstool_top=@bazel_tools//tools/cpp:toolchain \
#   --config=android_arm64 \
#   --cpu=arm64-v8a \
#   --fat_apk_cpu=arm64-v8a \
#   --cxxopt="-std=c++14"

# ./tensorflow/lite/tools/make/download_dependencies.sh

# build x86
# make -f ./tensorflow/lite/tools/make/Makefile \
#   BUILD_WITH_NNAPI=false \
#   -j8

# # build arm
# make -f ./tensorflow/lite/tools/make/Makefile \
#   CC="aarch64-linux-gnu-gcc-5" \
#   CXX="aarch64-linux-gnu-g++-5" \
#   LIBS="-lpthread -lm -ldl" \
#   TARGET=RPI \
#   TARGET_ARCH=armv8a \
#   BUILD_WITH_NNAPI=false \
#   -j8


# rm -rf tensorflow/lite/tools/make/gen/
# make -f ./tensorflow/lite/tools/make/Makefile \
#   -j8
