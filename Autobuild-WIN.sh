#!/bin/sh

cd libmediation
make

cd ../zlib1-2-11
./autocmake.sh

cd ../
make

