#!/bin/sh

cd libmediation
make

cd freetype2-10-0
make

cd ../zlib1-2-11
make

cd ..
make

