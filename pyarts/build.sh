mkdir -p build
cd build

cmake ${CMAKE_ARGS} -DCMAKE_PREFIX_PATH=${PREFIX} -DPython3_EXECUTABLE=${PREFIX}/bin/python3 -DENABLE_FORTRAN=1 -DENABLE_GUI=1 $SRC_DIR

# Need to set this so executables that generate source code
# during build time (gen_auto_py) can find libGL
# export LD_LIBRARY_PATH=${BUILD_PREFIX}/${HOST}/sysroot/usr/lib

cmake --build . -j8 --target pyarts -v

#make -j8 pyarts
#make -j${CPU_COUNT} pyarts

cd python
python3 -m pip install .
