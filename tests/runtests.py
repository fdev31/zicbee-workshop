#!/usr/bin/env python
import os
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

# test
for tester in testers:
    prefix = "%s:"%tester.__class__.__name__
    if hasattr(tester, 'setUp'):
        try:
            tester.setUp()
        except Exception, e:
            print "Set up error on %s %s"%(prefix, e)

    for sym in dir(tester):
        if sym.startswith('test_'):
            try:
                getattr(tester, sym)()
                r = True
            except Exception, e:
                r = e
                traceback.print_exc()
            finally:
                results[prefix+sym] = r

    if hasattr(tester, 'tearDown'):
        try:
            tester.tearDown()
        except Exception, e:
            print "Tear down error on %s %s"%(prefix, e)

# summary
for name, res in sorted(results.iteritems()):
    print "%s: %s"%(name, "OK" if res is True else res)

