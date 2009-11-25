#!/usr/bin/env python
import os
import sys
import traceback

testers = []
results = {}

# list
for fname in os.listdir(os.path.curdir):
    if fname.startswith('test_') and fname.endswith('.py'):
        m = __import__(fname[:-3])
        for sym in dir(m):
            if sym.startswith('Test'):
                testers.append(getattr(m, sym)())

if len(sys.argv) > 1:
    whitelist = [a.replace('.', ':') for a in sys.argv[1:]]
else:
    whitelist = None

# test
for tester in testers:
    prefix = "%s:"%tester.__class__.__name__

    # skip if won't run at all
    if whitelist and not any((prefix+name[5:]).startswith(n) for n in whitelist for name in dir(tester)):
        print "skipping %s..."%prefix
        continue

    if hasattr(tester, 'setUp'):
        try:
            tester.setUp()
        except Exception, e:
            print "Set up error on %s %s"%(prefix, e)

    for sym in dir(tester):
        if sym.startswith('test_'):
            name = prefix+sym[5:]
            try:
                getattr(tester, sym)()
                r = True
            except Exception, e:
                r = e
                traceback.print_exc()
            finally:
                results[name] = r

    if hasattr(tester, 'tearDown'):
        try:
            tester.tearDown()
        except Exception, e:
            print "Tear down error on %s %s"%(prefix, e)

# summary
for name, res in sorted(results.iteritems()):
    print "%s: %s"%(name, "OK" if res is True else res)

