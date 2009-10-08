#!/bin/sh
export PYTHONPATH=enviroments/zicbee_hive*/dev
cd tests
nosetests -Pxv --with-coverage $*
