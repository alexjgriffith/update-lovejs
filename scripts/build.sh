#!/bin/bash

MEGASOURCE=$1
EMSDK=$2

mkdir -p build/release build/release-single build/compat build/compat-single

source ${EMSDK}/emsdk_env.sh

(
  cd build/release
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  emmake make -j 8
)

(
  cd build/release-single
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DLOVEJS_SINGLE=ON
  emmake make -j 8 
)

(
  cd build/compat
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release -DLOVEJS_COMPAT=1 -DSEXPORT_ALL=1 -DSMAIN_MODULE=1 -DSERROR_ON_UNDEFINED_SYMBOLS=0 -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  emmake make -j 8
) 

(
  cd build/compat-single
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release -DLOVEJS_COMPAT=1 -DSEXPORT_ALL=1 -DSMAIN_MODULE=1 -DSERROR_ON_UNDEFINED_SYMBOLS=0 -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DLOVEJS_SINGLE=ON
  emmake make -j 8
) 
