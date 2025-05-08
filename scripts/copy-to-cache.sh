LOVE_VERSION=$1
LOVEJS_VERSION=$2

for file in $(ls build);
do
    echo -e "building love$LOVE_VERSION-$file-$LOVEJS_VERSION.zip"
    ## rm build/$file/love/love*.zip
    echo copying to $HOME/.cache/lovejs/love$LOVE_VERSION-$file-$LOVEJS_VERSION/
    mkdir -p $HOME/.cache/lovejs/love$LOVE_VERSION-$file-$LOVEJS_VERSION/
    cp build/$file/love/love*  $HOME/.cache/lovejs/love$LOVE_VERSION-$file-$LOVEJS_VERSION/

done
