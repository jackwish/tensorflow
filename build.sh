export CC=gcc-4.8
export CXX=g++-4.8
bazel build --jobs=24 -c opt -c dbg --strip=never tensorflow/tools/pip_package:build_pip_package
# bazel build --jobs=24 -c opt tensorflow/tools/pip_package:build_pip_package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package pip_pkg/
