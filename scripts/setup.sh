#!/bin/bash

## 3.1.68 is the sweet spot, same version of SDL
## 3.1.74 works (the version of SDL is newer than the one supported by Love11.5)
## had issues with 4.0.8

emsdk_version=4.0.0 # 3.1.68 #5.0.4

git submodule init
git submodule update

## Checkout the target branch of the love project
cd love
git checkout js-lua-interface
cd ../

## Checkout the target branch of the megasource project
cd megasource
git checkout js-lua-interface
cd libs

## Link love into the megasource
ln -s ../../love
cd ../../

## Update emsdk to 3.1.68
cd emsdk
git pull
git checkout main
./emsdk install $emsdk_version
./emsdk activate $emsdk_version
