export CC=gcc-4.8
export CXX=g++-4.8

BFLAGS_X86_OPT="--copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-msse4.1 --copt=-msse4.2"
BFLAGS_OPT="-c opt ${BFLAGS_X86_OPT}"
BFLAGS_TF2_DISABLE="--config=noaws          \
                    --config=nogcp          \
                    --config=nohdfs         \
                    --config=noignite       \
                    --config=nokafka        \
                    --config=nonccl"
BTARGET_PIP="//tensorflow/tools/pip_package:build_pip_package"
BTARGET_TFLITE_BENCHMARK="//tensorflow/lite/tools/benchmark:all"
BTARGET=${BTARGET_TFLITE_BENCHMARK}

# building
bazel build --jobs=8                \
  ${BFLAGS_OPT}           \
  ${BFLAGS_TF2_DISABLE}   \
  ${BTARGET}

# ./bazel-bin/tensorflow/tools/pip_package/build_pip_package \
#   --nightly_flag \
#   ./pip_pkg
