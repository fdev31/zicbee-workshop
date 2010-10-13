# -*- encoding: utf-8 -*-
from lettuce import *

import sys
import os
sys.path.insert(0, os.path.abspath( os.path.join(os.getcwd(),os.path.pardir, 'bee.egg')) )

from zicbee_lib.parser import parse_string as parsestring, tokens2python, AUTO
import re

E = AssertionError

def secured(fn):
    def _securing(*args, **kw):
        try:
            fn(*args, **kw)
        except Exception, e:
            raise AssertionError(str(e))
    return _securing

def get_tuple_iterable(step):
    computed = (unicode(r) for r in world.tokens)
    ref = ('%(tag)s: %(value)s'%e if e['value'] != '-' else e['tag'] for e in step.hashes)
    req_stop = False
    a = None
    b = None
    while True:
        a = None
        b = None
        try:
            a = computed.next()
        except StopIteration:
            req_stop = True
            try:
                ref.next()
            except StopIteration:
                break # len(ref) == len(computed)
            else:
                raise ValueError("Tested sequence is too short ! (not matched reference: %r)"%b)
        else:
            try:
                b = ref.next()
            except StopIteration:
                raise ValueError("Reference sequence is too short ! (not matched: %r)"%a)

        yield (a, b)

@secured
@step('Parse\s(.*)$')
def parse_tokkens(step, pattern):
    world.tokens = parsestring(pattern)

@secured
@step('The tokens are:?')
def check_values(step, *args):
    for a, b in get_tuple_iterable(step):
        if a != b:
            raise E('Got *%r*, expected *%r*.'%(a,b))

@step('^\s*#.*')
def just_a_comment(step):
    return

@secured
@step('python code is\s(.*)$')
def check_python(step, ref_code):
    gen = tokens2python(world.tokens)
    world.variables = gen[1]
    if gen[0].strip() != ref_code.strip():
        raise AssertionError('Expects: *%r*\nGot: *%r*'%(ref_code, gen[0]))

@secured
@step('variables are:')
def check_vars(step):
    ref = dict((e['name'], e['val']) for e in step.hashes)
    if world.variables != ref:
        raise AssertionError('Variables mismatch, given: %r expected: %r'%(world.variables, ref))

@step('auto is (\w+)')
def check_auto(step, w):
    e = eval(w.strip().title())
    for tok in world.tokens:
        if tok == AUTO:
            v = True
            break
    else:
        v = False

    if e != v:
        raise AssertionError('Expected %r, got %r'%(e, v))

