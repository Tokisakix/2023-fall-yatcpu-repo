rmdir /Q /S build
cmake -DCMAKE_TOOLCHAIN_FILE="./toolchain.riscv-gnu.cmake" -G"Unix Makefiles" -B build .
cmake --build build