## Turn this into a makefile at some point
branch=emscripten-update

## these checkouts should be replaced with patches
cd megasource/
git checkout $branch
if [ ! -f libs/love ]; then ln -s ../love/ libs/ ; fi
cd ../love/
git checkout $branch

cd ../lovejs/
git checkout $branch
build_love.js ../megasource/ ../emsdk/
