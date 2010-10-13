#!/bin/sh
export PYTHONPATH=../bee.egg
for name in parser; do
    lettuce $* $name
done
