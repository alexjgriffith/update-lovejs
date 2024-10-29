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
