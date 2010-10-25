#!/bin/sh

DST="/usr/local/bin"
C=$PWD

for exe in wasp zicserve zicdb; do
    rm -f $DST
    ln -s $C/$exe $DST/$exe
done
