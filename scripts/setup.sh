#!/bin/bash

git submodule init
git submodule update

## Checkout the target branch of the love project
cd love
git checkout js-lua-interface
cd ../

## Checkout the target branch of the megasource project
cd megasource
git checkoout js-lua-interface
cd libs

## Link love into the megasource
ln -s ../../love
cd ../../

## Update emsdk to 3.1.68
cd emsdk
./emsdk install 3.1.68
./emsdk activate 3.1.68
