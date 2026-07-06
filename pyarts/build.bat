mkdir build
cd build

cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%PREFIX% -DPython_EXECUTABLE=%PYTHON% -DNO_OPENMP=1 %SRC_DIR%

cmake --build . -j%CPU_COUNT% --target pyarts

cd python
python -m pip install .
