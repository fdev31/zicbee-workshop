.. _zicbee:

ZicBee application (zicdb, wasp[, zicserve])
********************************************

Package containing:
 * `zicdb` admin utility (scan, search, serve [with optional built-in player])
 * `zicserve` alias for ``zicdb serve`` command (listens HTTP on port ``9090``)

See also :ref:`wasp`.

.. automodule:: zicbee
   :members:

.. data:: zicbee.__version__

    This is the current version of :mod:`zicbee`

.. automodule:: zicbee.ui
   :members:

.. automodule:: zicbee.core
   :members:

API
===
.. toctree::
 :maxdepth: 2

 database
 core
 utils
 ui



Connect to your favorite player
+++++++++++++++++++++++++++++++

.. _zicbee.player:

Any zicbee compatible player should register a class with the :mod:``zicbee.core.player`` namespace in ``setup`` function, ex.::

        entry_points = """
        [zicbee.player]
        my_super_player = MyProjectModuleName:PlayerClassIExport
        """

Here is the API, the gst backend implements it directly:

.. automodule:: zicbee_gst
   :members:
   :undoc-members:

.. autoclass:: zicbee_gst.core.Player
   :members:
   :undoc-members:


