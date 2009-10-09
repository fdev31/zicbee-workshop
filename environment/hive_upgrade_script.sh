#!/bin/sh

UPGRADE_NAME=$0
PACKAGES="zicbee-lib zicbee-vlc zicbee-mplayer zicbee"
CLEAN=true
HOST="http://zicbee.gnux.info/hg/index.cgi"

die () {
    echo "DIED on $1."
    exit 1
}

clone() {
    hg clone $*
    if [ ! $? ]; then
        echo "pulling..."
        hg -R $1 pull
    fi
}

dn=`dirname $0`
if [ $dn = '.' ]; then
    env_path=$PWD
else
    env_path=$dn
fi

cd $env_path || die "cd $env_path"

if [ $# -eq 1 ]; then
    SRC=$1
    SUFFIX=''
else
    SRC=''
    SUFFIX="archive/tip.zip"
fi

MODE=''
if [ $SRC ]; then
    if [ $SRC = "help" ]; then
        cat <<END
Possible parameters:
 develop             : "easy_install develop" every package in dev
 dev                 : clone or pull upstream and then, equivalent to "develop"
 work                : Upgrade hive using the "dev" directory (default for clones)
 <path to directory> : Upgrade hive using specified path containing clones of sources

END
        exit
    elif [ -d $SRC ]; then
        MODE=''
    else
        MODE=$SRC
        SRC="dev"
    fi

else
    SRC="http://zicbee.gnux.info/hg/index.cgi"
fi

echo $MODE
echo $SRC

echo "Removing traces of existing zicbee..."
rm -fr usr/lib/python*/site-package/zicbee*

if [ "$MODE" = "dev" ]; then
    mkdir dev || echo "using existing dev directory"
    (cd dev && for pkg in $PACKAGES; do clone $HOST/$PKG/ $PKG ;done )
fi

URLS=''
for pkg in $PACKAGES; do
    URLS="$URLS $SRC/$pkg/$SUFFIX"
done
OPTIONS=""

if [ "$MODE" = "dev" ] || [ "$MODE" = "develop" ]; then
    OPTIONS="$OPTIONS develop"
fi

for url in $URLS; do
    sudo easy_install -U "$url" $OPTIONS || die "install $url"
done

./run_tests.sh
