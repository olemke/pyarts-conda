mkdir build
cd build

cmake -G Ninja %CMAKE_ARGS% -DCMAKE_PREFIX_PATH=%PREFIX% -DPython_EXECUTABLE=%PYTHON% -DNO_OPENMP=1 -DENABLE_FORTRAN=0 -DENABLE_GUI=0 -DENABLE_NETCDF=0 %SRC_DIR%

cmake --build . -j%CPU_COUNT% --target pyarts

cd python
python -m pip install .
