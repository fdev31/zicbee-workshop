.. _zicbee_core:

Zicbee core
===========

HTTP
++++

The DB and optionally Player are available via those two classes, all the ``REQ_`` methods are served.

Database (access)
-----------------


This class is available via the http prefix **/db** on any ``zicdb serve`` instance.

.. automodule:: zicbee.core.httpdb
   :undoc-members:
   :members:

See also :class:`Database`

Player
------

This class is available directly (without a prefix) on ``zicdb serve`` instances supporting player functions.


.. automodule:: zicbee.core.httpplayer
   :members:
   :undoc-members:

Players (optional)
++++++++++++++++++

Player middleware
-----------------

.. autoclass:: zicbee.core.player.PlayerCtl
   :members:

.. autoclass:: zicbee.core.playlist.Playlist
   :members:
   :inherited-members:

