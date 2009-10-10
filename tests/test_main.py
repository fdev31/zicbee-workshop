#!/usr/bin/env python
import os
import shutil
import threading
from time import sleep
from zicbee_lib.commands import execute, commands
cwd = os.getcwd()

class ServerThread(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self.setDaemon(True)

    def run(self):
        from zicbee_lib.config import config
        f = config.fork
        config.fork = 'no'
        from zicbee.core import serve
        serve()
        config.fork = f

    def stop(self):
        pass
#        execute('kill')

class TestHighLevel(object):

    REF_MEDIA = 'cocos2d_oh_yeah.mp3'

    tmp_name = "unittest_songs"

    def execute(self, command, append=False, copy=False):
        l = self.l
        if not append:
            l[:] = []
        if copy:
            l = list(l)
        execute(command, output=l.extend)
        return l

    def tearDown(self):
        self.server.stop()
        shutil.rmtree(self.tmp_name)

    def setUp(self):
        self.l = list()
        self.server = ServerThread()
        try:
            os.mkdir(self.tmp_name)
        except OSError:
            shutil.rmtree(self.tmp_name)
            os.mkdir(self.tmp_name)

        os.chdir(cwd)
        for n in xrange(100, 200):
            shutil.copy(self.REF_MEDIA, os.path.join(self.tmp_name, "audio_%s.mp3"%n))

        for v in commands.itervalues():
            if len(v) == 3 and 'threaded' in v[2]:
                v[2].pop('threaded')

        os.environ['ZDB'] = 'unit_testing'

        self.server.start()

        sleep(5) # wait for zicserve to start up
        os.system('zicdb scan "%s"'%self.tmp_name)
        l = self.execute('search')
        assert len(l) == 100
        self.playlist = [i.split(None, 1)[0] for i in l]

    def test_clear(self):
        self.execute('clear')

    def _test_uris(self, cmd, ref):
        l = self.execute(cmd)
        assert ref == [i.split(None, 2)[1] for i in l]

    def test_version(self):
        l = self.execute('version')
        # try to unformat
        [int(i) for i in l[0].split('-')[0].split('.')]

    def test_playlist(self):
        assert [] == self.execute('show')

        assert [] == self.execute('playlist')

        self.execute('play')
        sleep(2)
        assert [] == self.execute('pause', append=True)
        sleep(1)

        assert len(self.execute('playlist')) == 100

        playlist = self.playlist
        self._test_uris('show 1', playlist[:1])
        self._test_uris('show 10', playlist[:10])
        self._test_uris('show 1:5', playlist[1:6])
        self._test_uris('show 0:5', playlist[:6])
#        self._test_uris('show :5', playlist[:6]) # unsupported
        self._test_uris('show 0:999999', playlist)
        self._test_uris('show 0:', playlist)
        self._test_uris('show -5:', playlist[-5:])
#        self._test_uris('show 5:-2', playlist[5:-1]) # unsupported
#        self._test_uris('show 5:-2', playlist[5:-1]) # unsupported

