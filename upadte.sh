source ${EMSDK}/emsdk_env.sh

## How do I want to integrate this? maybe just a lil scripto?

python3 ../emsdk/upstream/emscripten/tools/file_packager.py love --preload game@/ > game-files.js
