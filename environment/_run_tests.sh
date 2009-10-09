#!/bin/sh
. ./bin/activate
TESTSPATH="../../tests/"
cd $TESTSPATH && nosetests -vx .
