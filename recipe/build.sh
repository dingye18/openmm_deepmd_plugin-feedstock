#!/bin/bash

mkdir build
cd build

wget https://transfer.sh/YECNo3/libdeepmd_c.zip
unzip libdeepmd_c.zip
tar -xf libdeepmd_c.tar.gz -C ${PREFIX}

cmake -DCMAKE_BUILD_TYPE=Release -DOPENMM_DIR=${PREFIX} -DDEEPMD_DIR=${PREFIX}/libdeepmd_c ..
export LD_LIBRARY_PATH=${PREFIX}:${PREFIX}/libdeepmd_c/lib:${LD_LIBRARY_PATH}

make #-j${NUM_CPUS}
make install
make test
make PythonInstall
