#!/usr/bin/env python
__all__ = ['gen', 'executables']
import os

script_base = """#!/usr/bin/env python
import os
import sys
DB_DIR = os.path.expanduser(os.getenv('ZICDB_PATH') or '~/.zicdb')
exists = os.path.exists
j = os.path.join
my_dir = [p for p in sys.path if exists(j(p, 'bee.egg'))][0]
sys.path[0:0] = (j(my_dir, 'bee.egg'), j(my_dir, 'dev'))
import %(mod)s
%(exe)s()
"""
executables = [
        ('zicserve', 'zicbee.core', 'zicbee.core.serve'),
        ('zicdb', 'zicbee.core', 'zicbee.core.startup'),
        ('wasp', 'zicbee.wasp', 'zicbee.wasp.startup'),
        ]

def _try_chmod(n, m):
    try:
        os.chmod(n, m)
    except OSError:
        pass

def gen():
    for name, mod, starter in executables:
        _try_chmod(name, 0755)
        file(name, 'w').write(script_base%{
            'mod':mod,
            'exe':starter,
            })
        _try_chmod(name, 0755)


if __name__ == '__main__':
    gen()
