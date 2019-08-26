#!/bin/sh

cd libmediation
make

cd ../freetype2-10-0
./configure
make

cd ../zlib1-2-11
./autocmake.sh

cd ../
make

