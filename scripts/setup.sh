#!/bin/bash

git submodule init
git submodule update
cd emsdk
./emsdk install 4.0.8
./emsdk activate 4.0.8
