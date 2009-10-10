#!/bin/sh

orig_dir=$PWD
dist="dist"
packages="simplejson web.py mutagen buzhug dev/zicbee-lib dev/zicbee dev/zicbee-vlc dev/zicbee-mplayer"

TMP=`tempfile`
rm $TMP
mkdir $TMP
OUT=$TMP

for pkg in $packages; do
    fullpath="$dist/$pkg"
    egg=$fullpath.egg
    if [ ! -f $egg ]; then
        if [ ! -d $fullpath ]; then
            easy_install -U -e -b $dist $pkg
        fi
        rm -fr $fullpath/$dist/*.egg
    fi
    (cd $fullpath && rm -fr build && python -c "import setuptools; execfile('setup.py')" bdist_egg )
    mv $fullpath/$dist/*.egg $egg
    unzip -o $egg -d $OUT
done

rm -fr $OUT/share $OUT/EGG-INFO
cp -r dev/EGG-INFO $OUT/
(cd $OUT && zip -9r $orig_dir/bee.zip .)
mv bee.zip bee.egg
rm -fr bee_pack.zip
zip -9r bee_pack.zip bee.egg wasp zicdb
rm -fr $TMP

#printf "#!/bin/sh\nPYTHONPATH=bee.egg python -c 'import zicbee.core;zicbee.core.serve()' \$*\n" > zicserve
#printf "#!/bin/sh\nPYTHONPATH=bee.egg python -c 'import zicbee.core;zicbee.core.startup('\$*')'\n" > zicdb
#printf "#!/bin/sh\nPYTHONPATH=bee.egg python -c 'import zicbee.wasp;zicbee.wasp.startup()' \$*\n" > wasp
#chmod +x zicserve zicdb wasp


#for n in *.egg; do
#    unzip -o $n
#done
#for pkg in $packages; do
#    zip -9r bee_home.zip $pkg
#done
#mv bee_home.zip bee_home.egg
