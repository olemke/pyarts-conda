mkdir -p build
cd build

if [[ $(uname) == "Darwin" ]]; then
    export MACOSX_DEPLOYMENT_TARGET=13.5
    export CMAKE_ARGS="${CMAKE_ARGS} -DCMAKE_OSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET}"
fi

cmake -G Ninja ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=${PREFIX} -DPython3_EXECUTABLE=${PREFIX}/bin/python3 $SRC_DIR

# Need to set this so executables that generate source code
# during build time (gen_auto_py) can find libGL
# export LD_LIBRARY_PATH=${BUILD_PREFIX}/${HOST}/sysroot/usr/lib

cmake --build . -j${CPU_COUNT} --target pyarts

cd python
${PREFIX}/bin/python3 -m pip install .
