#!/bin/bash

## 3.1.68 is the sweet spot, same version of SDL
## 3.1.74 works (the version of SDL is newer than the one supported by Love11.5)
## had issues with 4.0.8, using SDL_free with regular malloc rather than SDL_malloc
## 5.0.3 - more issues with SDL_free ...

emsdk_version=5.0.6 ## 4.0.0 # 3.1.68 #5.0.4

git submodule init
git submodule update

## Checkout the target branch of the love project
cd love
git checkout js-lua-interface
cd ../make setup && make compile && cp /home/alexjgriffith/Github/lovejs-update/build/compat-single/love/love.js ~/.cache/lovejs/love115-compat-single-beta1/

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
