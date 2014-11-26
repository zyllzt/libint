#!/bin/sh

set -e

if [ "$CXX" = "g++" ]; then
    export CC=/usr/bin/gcc-$GCC_VERSION
    export CXX=/usr/bin/g++-$GCC_VERSION
    export OPENMPFLAGS=-fopenmp
else
    export OPENMPFLAGS=-openmp
fi

./autogen.sh
./configure CXXFLAGS='-std=c++11 $OPENMPFLAGS' LDFLAGS=$OPENMPFLAGS CPPFLAGS='-I/usr/include/eigen3' --with-max-am=2,2 --with-eri-max-am=2,1 --with-eri3-max-am=3,2 --enable-eri=1 --enable-eri3=1
make -j2
make check