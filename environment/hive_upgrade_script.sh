#!/bin/sh

CLEAN=true
HOST="http://zicbee.gnux.info/hg/index.cgi"

die () {
    echo "DIED on $1."
    exit 1
}
clone() {
    hg clone $*
    if [ ! $? ]; then
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
. ./bin/activate # source the environment

if [ $# -eq 1 ]; then
    SRC=$1
else
    SRC=
fi

rm -fr usr/lib/python*/site-package/zicbee*

SUFFIX=''
MODE='std'
if [ $SRC ]; then
    if [ $SRC = "dev" ]; then
        MODE='dev'
        mkdir dev
        cd dev
        clone $HOST/zicbee-lib/ zicbee-lib
        clone $HOST/zicbee-mplayer/ zicbee-mplayer
        clone $HOST/zicbee/ zicbee
        clone $HOST/zicbee-vlc/ zicbee-vlc
        SRC="dev"
        cd ..
    fi
else
    SUFFIX='archive/tip.zip'
fi
URLS="$SRC/zicbee-lib/$SUFFIX $SRC/zicbee/$SUFFIX $SRC/zicbee-mplayer/$SUFFIX $SRC/zicbee-vlc/$SUFFIX"

for url in $URLS; do
    if [ $MODE = "dev" ]; then
        ./bin/easy_install -U "$url" develop || die "install $url"
    else
        ./bin/easy_install -U "$url" || die "install $url"
    fi
done

#echo "Doing some basic tests..."
#
#wasp help || die "Can't run wasp!"
#zicdb help || die "Can't run zicdb!"
#zicdb set fork yes|| die "Can't run zicdb!"
#zicserve || die "Can't run zicserve!"
#wasp kill

