mkdir build
cd build

cmake -G Ninja -DCMAKE_PREFIX_PATH=%PREFIX% -DPython_EXECUTABLE=%PYTHON% -DNO_OPENMP=1 %SRC_DIR%

cmake --build . --verbose -j%CPU_COUNT% --target pyarts
type %SRC_DIR%\build\src\auto_agenda_operators.cpp

cd python
python -m pip install .
