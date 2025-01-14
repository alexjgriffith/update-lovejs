LOVE_VERSION=$1
LOVEJS_VERSION=$2
mkdir -p release/
rm release/*
for file in $(ls build);
do
    echo -e "building love$LOVE_VERSION-$file-$LOVEJS_VERSION.zip"
    ## rm build/$file/love/love*.zip
    ls build/$file/love/love* | grep -v ".zip" | env TZ=UTC zip -j -r -q -9 -X build/$file/love/love$LOVE_VERSION-$file-$LOVEJS_VERSION.zip -@
    mv build/$file/love/love$LOVE_VERSION-$file-$LOVEJS_VERSION.zip release/
done
