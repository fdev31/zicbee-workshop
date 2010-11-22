===========
User manual
===========

.. toctree::
    :maxdepth: 1

    full_description

For a shorter introduction, see :ref:`Quickstart` page.

.. _install:

Installation instructions
=========================

Getting Python
--------------
Skip this step if you already have a working Python installation (type `python` on a shell and see what happens!).

Zicbee needs Python >=2.5 (not 3+) to run, this software is available on almost any computer:

.. image:: http://www.scilab.org/var/ezwebin_site/storage/images/media/images/download/linux-logo/1791-2-eng-GB/Linux-Logo_medium.png
    :target: http://python.org/ftp/python/2.6.5/Python-2.6.5.tar.bz2

.. image:: http://www.scilab.org/var/ezwebin_site/storage/images/media/images/download/windows-logo/1795-2-eng-GB/Windows-Logo_medium.png
    :target: http://python.org/ftp/python/2.6.5/python-2.6.5.msi

.. image:: http://www.scilab.org/var/ezwebin_site/storage/images/media/images/download/finder-logo/1799-1-eng-GB/Finder-Logo_medium.png
    :target: http://python.org/ftp/python/2.6.5/python-2.6.5-macosx10.3-2010-03-24.dmg

.. image:: http://file-folder-ren.sourceforge.net/art/freeBSD-logo.png
    :target: http://python.org/ftp/python/2.6.5/Python-2.6.5.tar.bz2

You probably already have it if not running Windows.

.. image:: http://www.python.org/community/logos/python-logo.png
    :target: http://python.org/download/


Getting Zicbee
--------------

Pick one of the following methods...

Self contained archive (with all dependencies included)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++

This is the easiest way, click and go (no installation needed).

Download and unzip the latest `packaged release`_ now!

Using the workshop
++++++++++++++++++

If you are curious or want to follow the development version, install `mercurial`_ and start getting the workshop::

    ~/programs/% hg clone http://zicbee.gnux.info/hg/zicbee-workshop/ bee
    ~/programs/% cd bee

.. note::
    If you don't have `mercurial`_ installed, you can `get the workshop ZIP archive here <http://zicbee.gnux.info/hg/zicbee-workshop/archive/default.zip>`_.

Now you should be able to run **manage** program so every source will be
retrieved and a compact distribution will be built::

    ~/programs/bee/% ./manage
    ...


Using Setuptools
++++++++++++++++

Either `setuptools`_ or `distribute`_ is required for that.

Nothing more easy::

    ~% easy_install -U zicbee

Using Pip
+++++++++

As easy as setuptools::

    ~% pip install -U zicbee


.. note::
    "-U" means update in pip and easy_install.


After that, you should have working "zicdb", "wasp" and "zicserve" binaries.
Feel free to run execute with "help" as the only argument!

.. note::
    zicserve is just a convenient way to run "zicdb serve".


Dependencies
------------

The software and all the dependencies are available in pure python without native code requirement,
it should run on any OS.
Wherever many packages answers that requirement, then speed and simplicity of use is evaluated.

-   3.0 > Python >= 2.6
-   or Python 2.5 with:

    -   cjson [json]
    -   or simplejson [json]
    -   or demjson [json]

Knowledges about shell usage and readline is a good point.

-   any shell, preferably with readline enabled
-   webpy >= 0.3
-   buzhug [database]

For playback, according to the backend, you will need either:

-   mplayer(.exe) in your PATH
-   libvlc available on your system
-   gstreamer + pygst bindings

.. note::
    playback support is not the only way to use zicbee to play your music.
    Currently you can generate m3u output that will open in your favorite music player.

Related projects
----------------

  * `zicbee <http://pypi.python.org/pypi/zicbee>`_ (server (zicserve) / admin utilities (zicdb) / lightweight client (wasp))
  * `zicbee-lib <http://pypi.python.org/pypi/zicbee-lib>`_  (base library for zicbee)
  * `zicbee-mplayer <http://pypi.python.org/pypi/zicbee-mplayer>`_ (mplayer bindings, allow zicbee to play music)
  * `zicbee-vlc <http://pypi.python.org/pypi/zicbee-vlc>`_ (vlc bindings, allow zicbee to play music)
  * `zicbee-gst <http://pypi.python.org/pypi/zicbee-gst>`_ (GStreamer bindings, allow zicbee to play music)
  * `zicbee-quodlibet <http://pypi.python.org/pypi/zicbee-quodlibet>`_ (plugin that turns quodlibet into a zicbee client)

First run
=========

Once you installed zicbee on computers with music, run those shell commands on each::

    % zicdb scan <base directory containing music files>


wait a little, depending on your library size ...::

    % zicserve


now the server is looping, you can access the music of this computer remotely
(or not ;))

If you installed zicbee-mplayer (or vlc or gst), then you can use this device
to play music too. If you want to use your own player with zicbee, just
:ref:`search` the database and request some playlist (m3u) output !

Open your web browser, point `http://localhost:9090/` and you should see
some graphics.

To know all the commands, try **zicdb help** command. Note that there is a
shortcut for **zicdb serve**, you can just type :ref:`zicserve <zicserve>`.


Self documentation
------------------

Help youself::

    % wasp help
    % zicdb help

.. _pattern:

Pattern
=======

Pattern is everywhere, used in www interface, in many shell commands (search,
play, etc...). You could replace pattern with query since it's most about it.

Syntax summary::

    field: value [ [or|and] field2: value2 ]...

If you don't want the default "average" search, you may want to precede the value with **=**.
For length, you can use **<**, **>**, **<=**, **>=** too.

If field name starts with a capital, the search is case-sensitive

Possible fields:

-   id (compact style)
-   genre
-   artist
-   album
-   title
-   track
-   score
-   tags
-   length
-   auto <special: auto-expand artists according to last.fm statistics)
-   pls <special: save/update a playlist>


Commented Examples
------------------



find songs from "shakira" and of more than 3 min::

    % wasp search artist: =shakira length: > 3*60

play songs with "the rolling" or "black" in artist name and of more than 3 min::

    % wasp play artist: the rolling length: > 3*60 or artist: black

find songs with "shak" in artist name and of more than 3 min and with "moon" on the title::

    % wasp search artist: shak length: > 3*60 and title: mo

find songs tagged "jazz" and with titles containing "moon"::

    % wasp search tags: jazz title: moon

find songs with a score higher than 2::

    % wasp search score: >2

a quite dumb search ;) (the selected songs will have a score of 3, less than 2 min and tagged as "rock")::

    % wasp search score: >2 score: <= 3 tags: rock length: <= 120


Commands reference
==================

Most commands will read `db_host` and `player_host` variables (see :ref:`set` command).


Common to zicbee and wasp
-------------------------


help
++++

List all available commands (with associated help if available)

.. _set:

set
+++

Without argument, lists the variables
If two arguments are passed, just set the value

List of "set" variables
.......................


fork ( yes,no )
    tells if the server should fork or not


enable_history ( yes, no )
    enable commands history in wasp


web_skin ( default )
    skin name (only one now)


players* ( off,gst,mplayer,vlc )
    player backend preference*

download_dir ( /tmp )
    download directory for :ref:`get` mainly


socket_timeout ( 30 )
    sets the default socket timeout (increase the value if you have timeout
    problems)

default_search ( off, "any valid search pattern" )
    sets the default :ref:`pattern` used in "play" command when no parameter is
    specified

allow_remote_admin ( yes,no )
    allow usage of :ref:`kill` and :ref:`stfu` from any host

streaming_file ( /tmp/zsong )
    temporary file used in player

history_size ( 50 )
    size of commandline history


custom_extensions* ( mpg, mp2 )
    adds support for officially unsupported extensions to :ref:`scan` command \*

player_host\* ( localhost:9090 )
    the host you want to play music on\*

db_host ( localhost:9090 )
    the host you want to take music from

notify ( yes,no )
    add desktop notification support to advert song changes

default_port ( 9090 )
    port used by default if not specififed

debug ( off,on )
    enables debuging mode

autoshuffle ( yes,no )
    automatically runs "shuffle" command when a playlist is fully loaded

loop ( yes,no )
    runs player in loop, infinitely, if **autoshuffle** is enabled, then re-
    shuffle the playlist before each loop

.. note::
    \* Multi values can be passed, using a coma (","), but **NO SPACES**.
    Note: "on" and "yes" are equivalent value, same for "off" and "no".


zicdb specific
--------------

Note that "``command::argument1[=foo][:argument2...]``" parameters syntax is only supported
by zicdb.

.. _serve:
.. _zicserve:

serve[::pure]
+++++++++++++

Runs a user-accessible www server on port 9090

pure
    don't allow player functionality access

You can alternatively use the **zicserve** alias.

.. _scan:

scan [directory|archive]...
+++++++++++++++++++++++++++

Scan directories/archive for files and add them to the database


search[::format] "pattern"
++++++++++++++++++++++++++

Search for songs in DB using a :ref:`pattern`, display results (output on stdout).

format
    specifies the output format (for now: m3u or null or default)

.. warning::
   Do not mangle with :ref:`search` command of the client, this one is called on :ref:`zicdb` and only works locally.
   If you want m3u output using wasp, take a look at the :ref:`m3u` command.


list
++++

List available Databases. See also :ref:`use modifier and ZDB environment variable <use>`.


reset
+++++

Erases the Database (every previous scan is lost!)


.. _bundle:

bundle "filename"
+++++++++++++++++

Create a bundle (compressed archive) of the current database


.. _use:

use
+++

Not a command by itself, used to specify active database (default: songs)

.. note::
    you can alternatively set the "ZDB" environment variable instead

Example:

starts serving lisa's database::

    % zicdb use lisa serve



destroy usb_drive database::

    % zicdb use usb_drive reset



backups the "ipod" database into "ipod_database_backup.zdb" file in current directory::

    % zicdb use ipod bundle ipod_database_backup.zdb


.. warning::
    using more than one database will most probably lead to song
    conflicts and won't be usable
    consider this feature very experimental, use only if you know what you are
    doing.


wasp specific
-------------

.. _get:

get
+++

Downloads the previous :ref:`search` result in :ref:`download_dir <set>`

.. warning:: this only works on the interactive shell (within "wasp")
    It won't work if called from the commandline


Examples:
.........


Download songs from the artist "les ogres"::

    % wasp
    Playing on http://localhost:9090 songs from http://localhost:9090/db
    Wasp 0.7.2!
    Wasp> search artist: les ogres
    Wasp> get
    [ download informations ]

.. _show:

show [number of items|slice]
++++++++++++++++++++++++++++

Shows the playlist content

show the 4 elements from the current one::

    wasp show 4

show elements from 1 to 15::

    show 1:15 will 

.. note::
    show :10
        is equivalent to show 0:10
    show 20:
        will show elements from 20 to end

.. warning::
    show -5:
        syntax is not really supported but still "works" (shows the
        last 5 elements, but indexes are incorrect)


playlist
++++++++

Display the whole playlist (naïve version of :ref:`show`)

.. _play:

play "pattern"
++++++++++++++

Set playlist to specified request (according to the :ref:`pattern`) and start playing if previously stopped

:ref:`pattern`:
same as :ref:`search` command with 2 more fields:

pls
    output playlist name
playlist
    input playlist name

.. note::
    - "#" is the special name for the current playlist
    - names can be prefixed with > to append to playlist
    - or + to insert just after the current song
    - no prefix means replace

Not using any playlist field is equivalent to "pls: #"

Note a special sugar is provided when copy/paste'ing a zicbee uri::

    % play http://myfriend.mydomain.com:9090/db/get/song.mp3?id=34g


Will be interpreted as ``play id: 34g pls: +#`` on myfriend.mydomain.com
host.


More examples:
..............

play the doors::

    % wasp play artist: doors



store in playlist "boucherie" songs with "bouchers" in artist::

    % wasp play artist: bouchers pls: boucherie



append to playlist "boucherie" songs with "pigalle" in artist::

    % wasp play artist: pigalle pls: +boucherie



play songs stored in playlist "boucherie"::

    % wasp play playlist: boucherie



save the current playlist to playlist "sogood"::

    % wasp play pls: sogood playlist: #



.. _search:

search "pattern"
++++++++++++++++

Search for a :ref:`pattern`, display results
Results are also stored for commands like :ref:`get`

.. _random:

random "what"
+++++++++++++

Chooses a random thing (artist by default, can be "album" as well)
then plays it

.. _m3u:

m3u
+++

Prints the current playlist in m3u format

.. _grep:

grep "arbitrary string"
+++++++++++++++++++++++

Only shows playlist elements containing the specified string
Result is stored for commands like "move" or "delete"

.. _move:

move "what" "where"
+++++++++++++++++++

Moves song at position "what" to "where"
If "where" is not given, defaults to the song next current one.
"what" can be special keyword "grep", will move previously grep'ped songs

.. _infos:

infos
+++++

Display informations about player status

.. _shuffle:

shuffle
+++++++

Shuffles the current playlist

.. _stfu:

stfu
++++

Shuts the current player host down

.. _kill:

kill
++++

Shuts the current db host down

.. _next:
.. _prev:

next
++++

Zap current song


prev
++++

Move backward in playlist

.. _guess:

guess
+++++

Tells if the given name matches with the current song


Problems
========

If you find any problem with installation, don't hesitate to post an Issue or
contact me directly fdev31 AT gmail DOT com or fill the `Bugtracker`_.

.. _packaged release: http://zicbee.gnux.info/files/
.. _setuptools: http://peak.telecommunity.com/dist/ez_setup.py
.. _distribute: http://python-distribute.org/distribute_setup.py
.. _Bugtracker: http://zicbee.gnux.info/bugtraq
.. _Mercurial: http://www.selenic.com/mercurial/wiki/BinaryPackages

