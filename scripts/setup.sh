#!/bin/bash

git submodule init
git submodule update
cd emsdk
./emsdk install 3.1.68
./emsdk activate 3.1.68
