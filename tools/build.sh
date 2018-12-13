export CC=gcc-4.8
export CXX=g++-4.8

# build android demo apk
# bazel build -c opt --cxxopt='--std=c++11' --fat_apk_cpu=x86,x86_64,arm64-v8a,armeabi-v7a \
#     //tensorflow/contrib/lite/examples/android:tflite_demo


########### build tflite shared library ####################################

# build native
bazel build -c opt //tensorflow/contrib/lite:libtflite.so --cxxopt="-std=c++11"

# build armv8
# bazel build -c opt //tensorflow/contrib/lite:libtflite.so \
#   --crosstool_top=//external:android/crosstool \
#   --host_crosstool_top=@bazel_tools//tools/cpp:toolchain \
#   --config=android_arm64 \
#   --cpu=arm64-v8a \
#   --fat_apk_cpu=arm64-v8a \
#   --cxxopt="-std=c++14"
