EMSDK=$1
FOLDER=$2
TARGET=$3

FILE_PACKER=$EMSDK/upstream/emscripten/tools/file_packager.py

## also checkout --from-emcc and link a --preload in love's CMakeLists to an empty folder, or a folder with .keep in it.
## make sure you run make in emscripten

# $FOLDER@/home/web_user/love/
## --use-preload-cache
## --obj-output=game.data --obj-output is only applicable when embedding files
## 
##$FILE_PACKER $TARGET --embed $FOLDER@/home/web_user/love/ --no-node --quiet

$FILE_PACKER $TARGET --embed $FOLDER@/home/web_user/love/ --no-node --quiet --obj-output=FILE.data
