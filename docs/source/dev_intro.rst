========================
Developpers introduction
========================

Starters
========

First of all, install `Mercurial`_.

The prefered way is to use zicbee-workshop (easier):

::

    hg clone http://zicbee.gnux.info/hg/zicbee-workshop/
    cd zicbee-workshop
    ./manage


try **./manage help** to get usage informations, zicbee related packages are
in **dev** subfolder.

Alternatively, you can clone `ZicBee`_ and/or any related project separately:

::

    # base
    hg clone http://zicbee.gnux.info/hg/zicbee/
    hg clone http://zicbee.gnux.info/hg/zicbee-lib/
    # players (if you intend to use zicbee for playback, via wasp client
    or http interface)
    # only one is needed if working ;)
    hg clone http://zicbee.gnux.info/hg/zicbee-mplayer/
    hg clone http://zicbee.gnux.info/hg/zicbee-vlc/
    hg clone http://zicbee.gnux.info/hg/zicbee-gst/

    # alternative clients

    hg clone http://zicbee.gnux.info/hg/zicbee-quodlibet/

Python entry points
===================


zicbee.player
-------------

Use this entry point to define your own player implementation (backend)
Idealy, only respawn and quit calls are blocking.
To get a simple but working example, take a look to zicbee-mplayer's `Player
class`_.

You should have something like that in your setup.py to declare an entry
point:

{{{#!python
entry_points = """
[zicbee.player]
mplayer = zicbee_mplayer:Player
"""
}}}

Replace "mplayer" with the name of your backend (gstreamer, xine, vlc,
ffmpeg, avbin, etc...) , and eventually "Player" if your implementation class
isn't called like that.

You should point a class defining those methods:

-   set_cache(self, val) Sets the cache value in kilobytes

-   volume(self, val) Sets volume [0-100]

-   seek(self, val) Seeks specified number of seconds (positive or
    negative)

-   pause(self) Toggles pause mode

-   respawn(self) Restarts the player

-   load(self, uri) Loads the specified URI

-   quit(self) De-initialize player and wait for it to shut down

-   position *property* Returns the actual playback position (in seconds)


"out of the box" feature list ===
+++++++++++++++++++++++++++++++++

-   database indexing (easy and fast lookup or m3u generation)
-   local and remote
-   can be scripted with http/json
-   HTTP interface with an ajax player and database browsing/downloading
    (feat. mp3 live preview)
-   base player functions
-   play/pause
-   next/previous
-   playlist handling/easy lookup
-   shuffle
-   download your search lookup (just replace "search" with "get" !)
-   nice to show (short and visible) URL for songs (not just the current
    one, any song in database)
-   quite efficient even with insane databases (needs testers to show
    limits)
-   command line and www


Accessible for junior developers
++++++++++++++++++++++++++++++++

-   theme backends/customisation of default theme
-   player backend creation (gstreamer should be easy, there some bits in
    mercurial archives)
-   add your own command to the player or to the database
-   add your own extension to the language (search, download, etc... are
    bound to the same parser)
-   add your own output types for search (command-line)
-   enhance the www interface (support for more formats on db live
    preview, improve the playlist edition like drag&drop, etc...)

and much more !! :)


Best if known
=============

-   Python :P
-   webpy / http
-   buzhug
-   json / generic (de)serialization techniques


even nicer...
-------------

-   Any multimedia player library
-   gtk/javascript/any UI library
-   setuptools/ packaging techniques


Submitting your changes
=======================

You can use either:

-   my email (fdev31 on gmail)
-   single diff
-   ordered patches archives
-   Hg bundles
-   Hg accessible remote repository


Learn by playing
================


Main pointers (to be completed)
===============================

open player/webplayer.py if you are interested in player (PlayerCtl class for
player backend and webplayer for www linking/frontend).

-> See web_db_index for database www glue (to be moved !)

open core/commands/*init*.py if you are interested in cmdline.

open dbe/dbe.py if you like databases (import/export/scheme/etc... including
song properties).

open ui/{chose your ui: gtk, web, quodlibet}/ if you are more visual.

open core/zutils.py and take a look to *parse_line* calling *_conv_line* if
you are interested in parsers :)

open player/mpgen.py to see how the mplayer wrapper is generated.

.. _Mercurial: http://www.selenic.com/mercurial/wiki/BinaryPackages
.. _ZicBee: http://zicbee.gnux.info/hg/zicbee/
.. _Player class: http://zicbee.gnux.info/hg/zicbee-
    mplayer/file/tip/zicbee_mplayer/__init__.py
