#!/bin/sh

mkdir zlib
cd zlib
cmake -G "Unix Makefiles" ../
make ${MAKEFLAGS}

