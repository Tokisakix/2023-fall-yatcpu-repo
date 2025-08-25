rmdir /Q /S build
cmake -DCMAKE_TOOLCHAIN_FILE="./toolchain.cl.cmake" -G"NMake Makefiles" -B build .
cmake --build build