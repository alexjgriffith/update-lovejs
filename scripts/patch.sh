help="Usage: patch.sh git-directory git-branch|end-hash start-hash filename"

if [ ! "$#" -eq 4 ]; then
    echo $help
    exit 1
fi

TARGET=$1
BRANCH=$2 ## could also be a hash
HASH=$3
FILENAME=$4
cd $TARGET
git checkout $BRANCH
git format-patch $HASH..HEAD --stdout > $FILENAME
