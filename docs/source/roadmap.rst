=======
Roadmap
=======

**1.4** (diversity)
===================

 - Write many player backends (ex: xine, vlc, gst, pyglet.avbin)
 - Introduce db backends (ex: buzhug, json, whoosh, sqlite)
 - add optional video support (handle capabilities of backend)

**1.3** (stable)
================

**1.2** (db cleanup)
====================
 - write real multi-db support (add hostname to bundles, <dbname>.ini file?)

**1.1** (architecture cleanup)
==============================
 - write some backends detection and loading
 - Much more doc
 - auto-playlists: handle track sorting during decimation

**1.0** (very useable, db schema freeze)
========================================
 - distribution cleanup
 - fill feature gap between www (poor) & text (rich) ui
 - add themes support for www player (and DB ?)
 - good duplicates detection (change the way hash is computed ?)
 - API/db cleanup & documentation
 - playcount
 - lastplayed (date)
 - like/dislike counter "ala facebook"

----

Random ideas
============

  - video support
  - picture support
      - (merge with imgplayer.js ?)
  - add update support from syntax
    - playlist: store a playlist (TODO: without other argument it GETS a playlist...)
    - +score: change the score of the given pattern
    - +tags: add the given keyword(s) to tags
    - example: `artist: Rolling album: stone +tags: rock`
  - separate zicdb into zicdb (database/local maintenance) / zicbee (player/remote control)
  - re-write zicbee in C (the executable, not the project !)
    - have python fallback (use code generation from cmd/requests description?)
  - database operations (difference, merge, substract, etc...)
  - allow alternative databases synchronization (SQL, XML, ...)
  - unify output format (re-architecture output operations)
    - add support for rss/rdf/atom formats as output
  - add file transcoder functions (on a given database)
    - could be available via text and www
  - add more formats to the player on www "live" (flash ? :( )
  - add "size" lookup option, limiting the size of the answer (in s)
    - add advanced "skip" option, to skip a number of entries
    - add advanced "limit" option, to limit the number of entries answered
  - add views support (aka "dynamic playlists", stored also...)
    - example: `artist: Rolling album: stone +view: stones` (still could use "+playlist" to store regular playlists)
  - pluggable audio backend/minimal plugin support:
      - upnp/dlna support
      - audioscrobbler
        - syntax proposition: just "audioscrobbler:" ?
      - podcasts (atom/rss/etc...)
        - example: ```feed: http://blah title: something```
        - add named feeds support (use "myradio" instead of http://....)
      - specific hardware support (ipod...)  <-- give me one if you want it ;P
      - more...
  - automatic (but clever...) autodetection of mountpoints

