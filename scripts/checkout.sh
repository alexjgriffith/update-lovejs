#!/bin/bash
## Turn this into a makefile at some point
BRANCH=$1
LOVE_VERSION=$2
EMCC_VERSION=$3



## these checkouts should be replaced with patches
cd megasource/
git checkout $branch
if [ ! -f libs/love ]; then ln -s ../love/ libs/ ; fi
cd ../love/
git checkout $branch

cd ../love.js/
git checkout $branch

./build_lovejs.sh ../../../megasource/ ../emsdk/
