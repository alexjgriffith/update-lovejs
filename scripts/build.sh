#!/bin/bash

MEGASOURCE=$1
EMSDK=$2

base=1
lua54=1

source ${EMSDK}/emsdk_env.sh

if [[ $base = 1 ]]
then
    mkdir -p build/release build/release-single build/compat build/compat-single
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
fi

      ## Lua 5.4 build
if [[ $lua54 = 1 ]]
then
      
mkdir -p build/release-lua54 build/release-single-lua54 build/compat-lua54 build/compat-single-lua54

(
  cd build/release-lua54
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DLUA_54=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  emmake make -j 8
)

(
  cd build/release-single-lua54
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DLUA_54=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DLOVEJS_SINGLE=ON
  emmake make -j 8 
)

(
  cd build/compat-lua54
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DLUA_54=1 -DCMAKE_BUILD_TYPE=Release -DLOVEJS_COMPAT=1 -DSEXPORT_ALL=1 -DSMAIN_MODULE=1 -DSERROR_ON_UNDEFINED_SYMBOLS=0 -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  emmake make -j 8
) 

(
  cd build/compat-single-lua54
  emcmake cmake ${MEGASOURCE} -DLOVE_JIT=0 -DLUA_54=1 -DCMAKE_BUILD_TYPE=Release -DLOVEJS_COMPAT=1 -DSEXPORT_ALL=1 -DSMAIN_MODULE=1 -DSERROR_ON_UNDEFINED_SYMBOLS=0 -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DLOVEJS_SINGLE=ON
  emmake make -j 8
) 
fi
