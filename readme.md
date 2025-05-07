The purpose of this repo is to hold lovejs wasm and js artifacts and patches.

## Building LoveJS

Update emsdk

``` bash
make setup
```

Build the comparable single file version (useful for making sure everything is compiling properly)
```
make compile
```


Build all release targets
```
make compile-all
```

## Updating Patches for LoveJS
Follow the steps below to update the love.js love branch and megasource forks. 

1. [ ] Review changes to love.js, love-emscripten and megasource-emscripten
2. [ ] Pull latest love.js onto my fork of love.js
3. [ ] Update 11.5 branch of love-emscripten and love megasource-emscripten to align with love 11.5
4. [ ] Diff the love.js fork of the previous version of love with the mainline previous version of love to get a list of changes, do the same with the megasource
5. [ ] Iterate through those changes but this time in the emscripten 11.5 branch
6. [ ] Create a patch as an artifact for love and megasource 


https://coco.luajit.org/install.html

## Git Patch Basics
Create a patch
``` bash
## git format-patch -<n> <SHA-1> --stdout > <name_of_patch_file>.patch
## If you've packed all your commits into a single commit
git format-patch -1 HEAD --stdout lovejs-11.x.patch
## otherwise
git format-patch <mainlinesha>..<patchedsha> --stdout > foo.patch
```

Apply a patch
``` bash
git apply --verbose file.patch
```

