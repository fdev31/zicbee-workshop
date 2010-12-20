Changelog
=========

0.9 "Long way home"
...................

 - automatic ``localhost`` substitution in URLs (can be customised too)
 - shiny new client (wasp), comes with many new features (grep, append, inject, get...)
    - **grep** can be used as parameter for ``move`` and ``delete`` commands. (use after using grep command)
    - ``move`` and ``delete`` also support slices passing (ex.: ``move 1:3``, ``delete 2:10``)
    - ``set`` can now unset a variable :P
 - improve shell completion
    - abbreviations everywhere
    - better completion
 - Support for live streaming, try "play <your favorite mp3 stream>"
 - Change process title if ``setproctitle`` is available
 - autoshuffle mode (can be disabled of course)
 - new "random" command, plays some artist or album randomly
 - stfu won't have unexpected results, it *kills* the player_host
 - visual notification for player (can be disabled, unset "notify" variable)
 - satisfying duplicates detection [WIP]
 - more flexible commands (handles short commands)
 - allow easy player backends integration (packages splitting via entry-points)
    - there is two available backends so far (mplayer and vlc)
    - see Developers section
 - minimal www interface (for low power machines, don't expect too much)
    - use /basic on any server with a player, it's quite rought now
 - Integrate automatic playlists with ``auto`` special tag
    - minimalist last.fm support (no account needed, only works with "artist" keyword)
    - modulable tolerance giving a digit (ex: ``auto: 15``)
    - "``artist: wax tailor or artist: birdy nam nam auto:``" automatically generates a playlist of similar artists (no value=10)
 - Split project for clarity
 - stored playlists (including position)
    - related wasp commands: load, save, append, inject
    - inc. playlist resume
    - you can alternatively use "pls:" option in play:
        - use "``#``" to act on current playlist
        - use "``pls: <playlist name>``" to WRITE a playlist
        - prefix playlist name with "``>``" to append results to playlist
        - prefix playlist name with "``+``" to insert results into playlist just after the current song
 - cleaner javascript/cookies/sessions (prepare theme support)
 - Tons of bugfixes! (among others, the parser is rewritten, with minor syntax changes)
 - known bugs: volume command is not very functional yet

0.8 "Road to usability"
.......................

 - add support for FLAC
 - interactive shell support with completion and history
    - see "zicdb shell" or "zicbee" commands
 - integrate/complete tagging & scoring support
 - add support for multiple DBs at once
    - (ie. have separate databases for your mp3 player & your local drive)
    - see "use" command for usage
 - complete admin commands (see "set" command)

0.7 "First shot"
................

 - add play, pause, next, prev, list
 - add cleaner configuration:: more unified (prepare themes handling)
    - ensure default host is well given

0.7-rc1 (first public release)
..............................

 - site launch
 - fixes egg/root installation (temporary file created)

