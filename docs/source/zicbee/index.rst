ZicBee application (zicdb, wasp[, zicserve])
********************************************

.. _zicbee:

Package containing:
 * `wasp` client (contained in :mod:`zicbee.wasp`)
 * `zicdb` admin utility (scan, search, serve [with optional built-in player])
 * `zicserve` alias for ``zicdb serve`` command (listens HTTP on port ``9090``)

.. automodule:: zicbee
   :members:

.. data:: zicbee.__version__

    This is the current version of :mod:`zicbee`

.. automodule:: zicbee.ui
   :members:

.. automodule:: zicbee.core
   :members:

.. automodule:: zicbee.core.parser
   :members:

Wasp
====

Don't hesitate to read the code of the module, it's quite simple.
Just start using it and his own ``help`` command.
It's basically offering interactive shell and easy command line access for zicbee servers and players.
The code consists in a CLI wrapping zicbee-lib, that's why this thin layer is shipped with zicbee.

.. automodule:: zicbee.wasp
   :members:

.. autofunction:: zicbee.wasp.startup


.. automodule:: zicbee.wasp.core
   :members:

Database (backend)
==================

.. autoclass:: zicbee.db.dbe.Database
   :members:

.. TODO

HTTP
====

The DB and optionally Player are available via those two classes, all the ``REQ_`` methods are served.

Database (access)
+++++++++++++++++

This class is available via the http prefix **/db** on any ``zicdb serve`` instance.


.. autoclass:: zicbee.core.httpdb.web_db_index
   :members:


Player
++++++

This class is available directly (without a prefix) on ``zicdb serve`` instances supporting player functions.

.. autoclass:: zicbee.core.httpdb.web_db_index
   :members:


Players (optional)
==================

Player middleware
+++++++++++++++++

.. autoclass:: zicbee.core.player.PlayerCtl
   :members:

.. autoclass:: zicbee.core.playlist.Playlist
   :members:
   :inherited-members:

Connect to your favorite player
+++++++++++++++++++++++++++++++

.. _zicbee.player:

Any zicbee compatible player should register a class with the ``zicbee.player`` namespace in ``setup`` function, ex.::

        entry_points = """
        [zicbee.player]
        my_super_player = MyProjectModuleName:PlayerClassIExport
        """

Here is the API, the gst backend implements it directly:

.. autoclass:: zicbee_gst.Player
   :members:


.. toctree::
   :maxdepth: 2

