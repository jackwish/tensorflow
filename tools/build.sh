# export CC=gcc-4.8
# export CXX=g++-4.8

BFLAGS_X86_OPT="--copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-msse4.1 --copt=-msse4.2"
BFLAGS_OPT="-c opt ${BFLAGS_X86_OPT}"
BFLAGS_GCC="--cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0""
BFLAGS_TF2_DISABLE="--config=noaws          \
                    --config=nogcp          \
                    --config=nohdfs         \
                    --config=nonccl         \
                    --config=noignite       \
                    --config=nokafka"
BTARGET_PIP="//tensorflow/tools/pip_package:build_pip_package"
BTARGET_TFLITE_BENCHMARK="//tensorflow/lite/tools/benchmark:all"
BTARGET=${BTARGET_PIP}
BTARGET=${BTARGET_TFLITE_BENCHMARK}
# BTARGET="//tensorflow/lite/toco:all"
# BTARGET="//tensorflow/lite/python:tflite_convert"
# BTARGET="//tensorflow/lite/kernels:abs_test"

# building
  # ${BFLAGS_OPT}           \
# bazel build --jobs=11     \
#   ${BFLAGS_GCC}           \
#   ${BFLAGS_TF2_DISABLE}   \
#   ${BTARGET}

# bazel build --jobs=11 ${BFLAGS_GCC} ${BFLAGS_OPT} ${BFLAGS_TF2_DISABLE} //tensorflow/lite/kernels:abs_test
# bazel-bin/tensorflow/lite/kernels/abs_test
bazel build --jobs=11 ${BFLAGS_GCC} ${BFLAGS_OPT} ${BFLAGS_TF2_DISABLE} //tensorflow/lite/python:tflite_convert
# bazel build --jobs=11 ${BFLAGS_GCC} ${BFLAGS_OPT} ${BFLAGS_TF2_DISABLE} ${BTARGET_TFLITE_BENCHMARK}
# bazel build --jobs=11 ${BFLAGS_GCC} ${BFLAGS_OPT} ${BFLAGS_TF2_DISABLE} //tensorflow/lite/toco/tflite:operator_test
# bazel-bin/tensorflow/lite/toco/tflite/operator_test


# bazel build --jobs=11 ${BFLAGS_GCC} ${BFLAGS_OPT} ${BTARGET_PIP}
# ./bazel-bin/tensorflow/tools/pip_package/build_pip_package \
#   ./pip_pkg
# pip install -U pip_pkg/tensorflow-1.14.0-cp36-cp36m-linux_x86_64.whl
#   # --nightly_flag \

# bazel build --jobs=11 ${BFLAGS_GCC} ${BFLAGS_OPT} ${BFLAGS_TF2_DISABLE} tensorflow/python/tools:inspect_checkpoint
