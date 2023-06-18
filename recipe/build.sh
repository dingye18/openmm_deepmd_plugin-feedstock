#!/bin/bash

mkdir build
cd build

# Install the C API library for DeePMD-kit: libdeepmd_c library
# The library is stored in local machine.
wget http://10.20.8.242:8080/4FDj3KbbI1/libdeepmd_c.zip
unzip libdeepmd_c.zip
tar -xf libdeepmd_c.tar.gz -C ${PREFIX}
mv ${PREFIX}/libdeepmd_c/lib/* ${PREFIX}/lib
mv ${PREFIX}/libdeepmd_c/include/* ${PREFIX}/include

rm -rf libdeepmd_c.zip libdeepmd_c.tar.gz
rm -r ${PREFIX}/libdeepmd_c

cmake -DCMAKE_BUILD_TYPE=Release -DOPENMM_DIR=${PREFIX} -DDEEPMD_DIR=${PREFIX} ..
export LD_LIBRARY_PATH=${PREFIX}:${LD_LIBRARY_PATH}

make #-j${NUM_CPUS}
make install
make test
make PythonInstall
