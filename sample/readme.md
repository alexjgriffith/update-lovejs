- Add script that will update the love.data file without requiring a recompile

- Ran into issue using fennel repl, when the thread starts the browser tab will hang. I'm not sure if the io is blocking

- Found compile settings that work, they work with pthreads too.
``` bash
"--pre-js ${CMAKE_CURRENT_SOURCE_DIR}/src/scripts/test-filesystem.js"
                "--preload-file /home/alexjgriffith/Github/lovejs-update/love.js/game@/home/web_user/love/"
                "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/src/scripts/shell.html"
		"-sFULL_ES2=1" ## we get webgl errors without this
                "-sUSE_SDL=2"
                "-s ALLOW_MEMORY_GROWTH=1" # for dynamic resizing of memory, should not
``` 

## TODO
- Try building to an html file and using embed or preload

Use `serve.py` to test the release version of `love.js`. `serve.py` sets the appropriate headers (see below) to avoid the `sharedArrayBuffer` error.

## Testing Release
Run the following in this directory

``` bash
python serve.py
```

You should be able to see the sample game running if you navagate to `http://localhost:8000` in your browser.

## HTTP Headers that have to be set
```
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```




-> initialize FS
-> load game.love  and store it in FS
-> start love

./build_lovejs.sh ~/Github/lovejs-update/megasource ../emsdk/ 
cd build/release/love/ && python3 ../../../../sample/scripts/serve.py
rm love.* && cd ../../../


./build_lovejs.sh ~/Github/lovejs-update/megasource ../emsdk/ 
cd build/release/love/ && python3 ../../../../sample/scripts/serve.py
rm love.* && cd ../../../



./build_lovejs.sh ~/Github/lovejs-update/megasource ../emsdk/ && cd build/release/love/ && python3 ../../../../sample/scripts/serve.py && rm love.* && cd ../../../


