#!/bin/bash

LOVEJS=../../build/compat-single/love/love.js
TITLE=demo

mkdir -p build
rm -rf build/*

cd src
find -type f | LC_ALL=C sort | env TZ=UTC zip -r -q -9 -X ../build/game.love -@
cd ../
echo -n "\"" > build/game.love.b64
base64 -w 0 build/game.love >> build/game.love.b64
echo -n "\"" >> build/game.love.b64
cat index.html.in | \
    sed "s/{{TITLE}}/${TITLE}/g" | \
    sed "/{{STYLE}}/e cat style.css"  | sed 's/{{STYLE}}//g' | \
    sed "/{{GAME_FILE}}/e cat build/game.love.b64" | sed 's/{{GAME_FILE}}//g' | \
    sed "/{{USER_SCRIPT}}/e cat script.js" | sed 's/{{USER_SCRIPT}}//g' | \
    sed "/{{SCRIPT}}/e cat ${LOVEJS}" | sed 's/{{SCRIPT}}//g' \
        > build/index.html
