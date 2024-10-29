gamefile=game.love
size=$(du -b game.love | awk '{print $1}')
cat index.html.in | sed "s/{{{size}}}/$size/g" | sed "s/{{{gamefile}}}/$gamefile/g" > index.html
