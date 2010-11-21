.. _quickstart:

===============
User quickstart
===============

To know more, visit `the website <http://zicbee.gnux.info/>`_.

Install
=======

For installation instructions, refer to :ref:`the manual <install>`.

Features
========

* Still **fast** even on big playlists and libraries (OK with 30k entries on a netbook)
* **Nice syntax** for queries, accessible to any user, *search* and *play* takes the same parameters so you just replace the command name when you are happy with the output
* Daemon/Network oriented (not unlike mpd)
    * Access songs on remote computers
    * Close the client, songs will continue playing
    * Open as many clients as you want at any moment
    * You can mix songs from several computers on the same playlist
* Pure **Python** (it should run on any computer, mac, etc...)
* **HTTP everywhere** (you can use the web browser on your phone to control the playback or do a query on your library, try "http://host:9090/basic" HTTP address for minimal embedded devices support)
* Always growing set of features:
    * nice playlist handling
    * real shuffle (not random)
    * last fm support (auto-generation of playlist based on small request)
    * song downloading
    * blind test mode (very minimalistic btw, see *guess* command)
    * duplicates detection (alpha quality)

    And much more... try *help* parameter to get an idea ! :)

Getting started
===============

Start the server (you may want to do this uppon your session startup)::

 zicserve

Scan your songs (you can reproduce this step several times)::

 zicdb scan <a directory with many songs>

Connect to the www interface::

 firefox http://localhost:9090/

Read help::

 zicdb help

Fire up the client::

 wasp

Example session
===============

search artist containing "black" in their name::

  wasp search artist: black

show all configuration variables::

  wasp set

changes the host to take songs from::

  wasp set db_host 192.168.0.40

tells zicbee to play song on THIS computer::

  wasp set player_host localhost

search again (on the new db_host)::

  wasp search artist: black

play black sabbath's music ::

  wasp play artist: black sab

skip current song::

  wasp next

Shows the next entries in the playlist::

  wasp show

Play "IAM" music, case sensitive and exact match::

  wasp play artist: =IAM

Play an auto-generated playlist based on some artists::

  wasp play auto: artist: =IAM or artist: =Archive

Find some song "grepping" some pattern, then move it just after the currently playing song (only works on interactive shell)::

  wasp> grep lune
  wasp> move grep

I think you *must* read it at least once::

  wasp help

 You can also just run "wasp", and you will get into an interactive shell with completion.



