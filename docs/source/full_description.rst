===================
Package description
===================

ZicBee is a project grouping multiple applications to manage play and handle
music databases.

For now there is a Swiss-army knife tool: **zicdb**, but most users will just
use **zicserve** (server) and **wasp** (shell)

Some plugins for quodlibet has also be developed.

ZicBee is fast, portable (but not very ported...) and flexible.

While the project is stable and usable (there online doc and a nice www gui),
it's mostly interesting for hackers and developers for now.

See features list, it's mostly handy for people with large databases, with
optionally multiple computers.
It can be adapted to handle video too, hacking some bit of code.

Contributors are welcome, it's python :)
The code still needs a bit of refactor, mostly for the player part.


Features
========


Fast!
-----

-   The metadata **scanner** is pretty **fast**, with more than **50
    songs/s** on cheap hardware
-   The www server is **very light** and responsive
-   Things are designed to **support huge playlists**, by using small
    chunks things are quite slowed down but the responsiveness remains good
    -> it won't block the server on huge search patterns


Web server
----------

-   access **your music anywhere** (from your web browser)
-   search
-   download (**get** command & zip download from www)
-   play (mp3 only) via the www interface
-   Set **any zicdb daemon** as player (where the sound will be played)
    (except for pure databases, see "pure" option of "serve" command)
-   Set **any zicdb server db** (where the songs are stored)


Player (embedded in web server)
-------------------------------

-   Designed as **daemon** (linked to web server)
-   **Plays continuously** music of not told to skip current track (no
    interruption on playlist loading)
-   Uses MPlayer for maximum compatibility, more backends will come if
    needed
-   supports **most music formats**
-   virtually runs on **any operating systems**
-   You can have zero of more clients connected (it will still play)


Swiss-army-knife
----------------

-   **m3u** generation via search command
-   tagging
-   scoring
-   **bundle** your database (it will create ONE file you can move to
    another computer and then scan...)
-   You can have **local copy** of your friends databases without having
    their songs
-   You will find things for **duplicates detection** (it's not mature
    yet)


Unified
-------

-   Use the same request for searching, downloading or playing songs;
    some example:

    -   deep purple
    -   artist: sab or artist: björk
    -   artist: (Björk or Sigur)

-   All Python

