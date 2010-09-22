#!/usr/bin/env python

# Bootstrap
import os
import sys
DB_DIR = os.path.expanduser(os.getenv('ZICDB_PATH') or '~/.zicdb')
exists = os.path.exists
j = os.path.join
my_dir = [p for p in sys.path if exists(j(p, 'bee.egg'))]
my_dir.extend(os.path.split(p)[0] for p in sys.path if exists(j(p, os.path.pardir, 'bee.egg')))
if not(my_dir):
    print "**ERROR** Unable to find bee.egg and associated files"
    sys.exit(1)
elif len(my_dir) > 1:
    print "**WARNING** more than zicbee instances are found !"

my_dir = my_dir[0]
sys.path[0:0] = [j(my_dir, 'bee.egg')]
# /Bootstrap

__version__ = "1.0"
import gtk
import os
import sys
#import pygtk
import socket
socket.setdefaulttimeout(5)

from zicbee_lib.commands import execute
from zicbee_lib.resources import resource_filename


def play_cb(widget, data = None):
    execute('play')


def quit_cb(widget, data = None):
    if data:
        data.set_visible(False)
    gtk.main_quit()


def popup_menu_cb(widget, button, time, data = None):
    if button == 3:
        if data:
            data.show_all()
            data.popup(None, None, None, 3, time)
    pass


def startserver_cb(widget, data=None):
    cmd = '%s -c "from zicbee.core import serve; serve()" &'%sys.executable
    os.system(cmd)


def about_cb(widget, data = None):
    try:
        from zicbee import __version__ as zdb_v
    except ImportError:
        zdb_v = "n/a"
    from zicbee_lib import __version__ as lib_v

    try:
        result = []
        execute("infos", output=result.append)
        song = '\n'.join(result[0])
        gtk.STOCK_NETWORK

    except Exception, e:
        print e
        song = 'Unable to get song informations'

    msg = "Version %s\nzicbee-%s\nzicbee-lib-%s\n-\n%s"%(
        __version__, zdb_v, lib_v, song)

    msgBox = gtk.MessageDialog(parent = None,
        buttons = gtk.BUTTONS_OK, message_format = msg)
    msgBox.run()
    msgBox.destroy()


def next_cb(widget, data=None):
    execute("next")


def prev_cb(widget, data=None):
    execute("prev")


def pause_cb(widget, data=None):
    execute("pause")


statusIcon = gtk.StatusIcon()
menu = gtk.Menu()


def add_menu(icon, *connect):
    item = gtk.ImageMenuItem(icon)
    item.set_property("always-show-image", True)
    item.connect('activate', *connect)
    menu.append(item)

add_menu(gtk.STOCK_MEDIA_PAUSE, pause_cb)
add_menu(gtk.STOCK_MEDIA_NEXT, next_cb)
add_menu(gtk.STOCK_MEDIA_PREVIOUS, prev_cb)
add_menu(gtk.STOCK_ABOUT, about_cb)
add_menu(gtk.STOCK_MEDIA_PLAY, play_cb)
add_menu(gtk.STOCK_CONNECT, startserver_cb)
add_menu(gtk.STOCK_QUIT, quit_cb, statusIcon)

icon = resource_filename('zicbee.ui.notify', 'bee_icon.png')
statusIcon.set_from_file(icon)
statusIcon.set_tooltip("Zicbee")
statusIcon.connect('activate', pause_cb)
statusIcon.connect('popup-menu', popup_menu_cb, menu)
statusIcon.set_visible(True)

gtk.main()
