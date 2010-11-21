==================
User documentation
==================

.. toctree::
    :maxdepth: 1

    full_description

For a shorter introduction, see :ref:`Quickstart` page.

.. _install:

Installation instructions
=========================

Preferably, download and unzip a `packaged release`_ or get the workshop
repository if you plan to hack the code:

::

    ~/programs/> hg clone http://zicbee.gnux.info/hg/zicbee-workshop/ bee
    ~/programs/> cd bee

.. note::
    If you don't have :ref:`mercurial` installed, you can `get the workshop ZIP archive here <http://zicbee.gnux.info/hg/zicbee-workshop/archive/default.zip>`_.

Now you should be able to run **manage** program so every source will be
retrieved and a compact distribution will be built.

::

    ~/programs/bee/> ./manage
    ...


You can also install it in the standard setuptools way:

::

    easy_install -U zicbee
    or
    pip install -U zicbee


"-U" means update in pip and easy_install.

Either `setuptools`_ or `distribute`_ is required for that.

After that, you should have working "zicdb", "wasp" and "zicserve" binaries.
Feel free to run execute with "help" as the only argument!

Note that zicserve is just a convenient way to run "zicdb serve".


Dependencies:
-------------

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
search the database and request some playlist (m3u) output !

Open your web browser, point `http://localhost:9090/`_ and you should see
some graphics.

To know all the commands, try **zicdb help** command. Note that there is a
shortcut for **zicdb serve**, you can just type **zicserve**. Don't forget to
run **wasp help** for all clients commands (most, in fact).


Self documentation
------------------

::

    % wasp help
    % zicdb help

Pattern/match commands
======================

Pattern is everywhere, used in www interface, in many shell commands (search,
play, etc...).

Syntax summary:

::

    field: value [ [or|and] field2: value2 ]...


for length, value may be preceded by **<** or **>**

if field name starts with a capital, the search is case-sensitive

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

::

    % wasp search artist: =shakira length: > 3*60


> songs from "shakira" and of more than 3 min

::

    % wasp search artist: the rolling length: > 3*60 or artist: black


> songs with "the rolling" or "black" in artist name and of more than 3 min

::

    % wasp search artist: shak length: > 3*60 and title: mo


> songs with "shak" in artist name and of more than 3 min and with "moon" on
the title

::

    % wasp search tags: jazz title: moon


> songs tagged "jazz" and with titles containing "moon"

::

    % wasp search score: >2


> songs with a score higher than 2

::

    % wasp search score: >2 score: <= 3 tags: rock length: <= 120


> a quite dumb search ;) (the selected songs will have a score of 3, less
than 2 min and tagged as "rock")


Commands reference
==================

Most commands will read ::db_host and ::player_host variables (see **set**
command).


Common to zicbee and wasp
-------------------------


help
++++

List all available commands (with associated help if available)


set
+++

Without argument, lists the variables
If two arguments are passed, just set the value


List of "set" variables
.......................


fork ( yes,no )
::::::::::::::::


tells if the server should fork or not


enable_history ( yes, no )
::::::::::::::::::::::::::


enable commands history in wasp


web_skin ( default )
::::::::::::::::::::


skin name (only one now)


players* ( off,gst,mplayer,vlc )
::::::::::::::::::::::::::::::::


player backend preference*


download_dir ( /tmp )
:::::::::::::::::::::


download directory for **get** command mainly


socket_timeout ( 30 )
:::::::::::::::::::::


sets the default socket timeout (increase the value if you have timeout
problems)


default_search ( off, "any valid search pattern" )
::::::::::::::::::::::::::::::::::::::::::::::::::


sets the default pattern used in "play" command when no parameter is
specified


allow_remote_admin ( yes,no )
:::::::::::::::::::::::::::::


allow usage of **kill** and **stfu** from any host


streaming_file ( /tmp/zsong )
:::::::::::::::::::::::::::::


temporary file used in player


history_size ( 50 )
:::::::::::::::::::


size of commandline history |


custom_extensions* ( mpg, mp2 )
:::::::::::::::::::::::::::::::


adds support for officially unsupported extensions to **scan** command*


player_host* ( localhost:9090 )
:::::::::::::::::::::::::::::::


the host you want to play music on*


db_host ( localhost:9090 )
::::::::::::::::::::::::::


the host you want to take music from


notify ( yes,no )
:::::::::::::::::


add desktop notification support to advert song changes


default_port ( 9090 )
:::::::::::::::::::::


port used by default if not specififed


debug ( off,on )
::::::::::::::::


enables debuging mode


autoshuffle ( yes,no )
::::::::::::::::::::::


automatically runs "shuffle" command when a playlist is fully loaded


loop ( yes,no )
:::::::::::::::


runs player in loop, infinitely, if **autoshuffle** is enabled, then re-
shuffle the playlist before each loop

{*} Multi values can be passed, using a coma (","), but **NO SPACES**.
Note: "on" and "yes" are equivalent value, same for "off" and "no".


zicdb specific
--------------

Note that "command::argument1[=foo][:argument2...]" syntax is only supported
by zicdb.


serve[::pure]
+++++++++++++

Runs a user-accessible www server on port 9090

pure:
don't allow player functionality access

You can alternatively use the "zicserve" alias.


scan [directory|archive]...
+++++++++++++++++++++++++++

Scan directories/archive for files and add them to the database


search[::format] "match command"
++++++++++++++++++++++++++++++++

Search for songs, display results (output on stdout).

format:
specifies the output format (for now: m3u or null or default)


list
++++

List available Databases.


reset
+++++

Erases the Database (every previous scan is lost!)


bundle "filename"
+++++++++++++++++

Create a bundle (compressed archive) of the database


use
+++

Not a command by itself, used to specify active database (default: songs)
Exemple:

::

    % zicdb use lisa serve


> starts serving lisa's database

::

    % zicdb use usb_drive reset


> destroy usb_drive database

::

    % zicdb use ipod bundle ipod_database_backup.zdb


> backups the "ipod" database into "ipod_database_backup.zdb" file in current
directory

**WARNING:** using more than one database will most probably lead to song
conflicts and won't be usable
consider this feature very experimental, use only if you know what you are
doing.

**NOTE:** you can alternatively use the "ZDB" environment variable instead


wasp specific
-------------


get "match command"
+++++++++++++++++++

Downloads the previous **search** result in ``download_dir``


Examples:
.........

::

    % wasp get artist: black
    % zicdb search::out=m3u artist: black

show [number of items|slice]
++++++++++++++++++++++++++++

Shows the playlist

-   show 4 will show the 4 elements from the current one
-   show 1:15 will show elements from 1 to 15
-   show :10 is equivalent to show 0:10
-   show 20: will show elements from 20 to end
-   show -5: syntax is not really supported but still "works" (shows the
    last 5 elements, but indexes are incorrect)


playlist
++++++++

Display the whole playlist


play "match command"
++++++++++++++++++++

Set playlist to specified request and start playing if previously stopped

match command:
same as 'search' command with 2 more fields:
pls: output playlist name
playlist: input playlist name

- "#" is the special name for the current playlist
- names can be prefixed with > to append to playlist
- or + to insert just after the current song
- no prefix means replace

Not using any playlist field is equivalent to "pls: #"

Note a special sugar is provided when copy/paste'ing a zicbee uri.

::

    % play http://myfriend.mydomain.com:9090/db/get/song.mp3?id=34g


Will be interpreted as ``play id: 34g pls: +#`` on myfriend.mydomain.com
host.


More examples:
..............

::

    % wasp play artist: doors


> play the doors

::

    % wasp play artist: bouchers pls: boucherie


> store in playlist "boucherie" songs with "bouchers" in artist

::

    % wasp play artist: pigalle pls: +boucherie


> append to playlist "boucherie" songs with "pigalle" in artist

::

    % wasp play playlist: boucherie


> play songs stored in playlist "boucherie"

::

    % wasp play pls: sogood playlist: #


> save the current playlist to playlist "sogood"


search "match command"
++++++++++++++++++++++

Search for a patter, display results
Results are also stored for commands like "get"


random "what"
+++++++++++++

Chooses a random thing (artist by default, can be "album" as well)
then plays it


m3u
+++

Prints the current playlist in m3u format


grep "arbitrary string"
+++++++++++++++++++++++

Only shows playlist elements containing the specified string
Result is stored for commands like "move" or "delete"


move "what" "where"
+++++++++++++++++++

Moves song at position "what" to "where"
If "where" is not given, defaults to the song next current one.
"what" can be special keyword "grep", will move previously grep'ped songs


infos
+++++

Display informations about player status


shuffle
+++++++

Shuffles the current playlist


next
++++

Zap current song


prev
++++

Move backward in playlist


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
.. _http://localhost:9090/: http://localhost:9090/
.. _Bugtracker: http://zicbee.gnux.info/bugtraq
.. _Mercurial: http://www.selenic.com/mercurial/wiki/BinaryPackages