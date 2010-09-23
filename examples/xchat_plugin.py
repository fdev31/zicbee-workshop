#! /usr/bin/env python
#coding=utf-8

zicbee_command_help_text = """zicbee control. Usage:
/zic show    Prints currently playing on zicbee (not yet)
/zic prev    Change to the previous song
/zic next    Change to the next song
/zic pause   Toggle play/pause mode"""

__module_name__ = "zicbee_xchat"
__module_version__ = "0.1"
__module_description__ = "python module for controlling zicbee from xchat"

import xchat
import urllib
import socket

def _get_ip():
    s = socket.socket()
    s.connect( ('google.com', 80) )
    return s.getsockname()[0]

MY_IP="http://%s:9090"%_get_ip()

def _get_infos():
    info = urllib.urlopen('%s/infos'%MY_IP)
    temp = dict([i.split(':',1) for i in info.readlines()])
    infos_string = '%s | %s | %s | %s'%(temp['uri'].rstrip('\n'),temp['artist'].rstrip('\n'),temp['album'].rstrip('\n'),temp['title'].rstrip('\n'))
    return infos_string

def zic_show(word, word_eol, userdata):
    xchat.command('me is listening to' + _get_infos())
    return xchat.EAT_ALL

def zic_next(word, word_eol, userdata):
    urllib.urlopen('%s/next'%MY_IP)
    return xchat.EAT_ALL

def zic_prev(word, word_eol, userdata):
    urllib.urlopen('%s/prev'%MY_IP)
    return xchat.EAT_ALL

def zic_pause(word, word_eol, userdata):
    urllib.urlopen('%s/pause'%MY_IP)
    return xchat.EAT_ALL

def zicbee_command_cb(word, word_eol, userdata):
    try:
	if word[1].lower() == 'show':
        return zic_show(word[1:], word_eol[1:], userdata)
    if word[1].lower() == 'next':
        return zic_next(word[1:], word_eol[1:], userdata)
    if word[1].lower() == 'prev':
        return zic_prev(word[1:], word_eol[1:], userdata)
    if word[1].lower() == 'pause':
        return zic_pause(word[1:], word_eol[1:], userdata)
    if word[1].lower() == 'help':
        print zicbee_command_help_text
    except IndexError:
	print zicbee_command_help_text
    return xchat.EAT_ALL

xchat.hook_command("zic", zicbee_command_cb, help=zicbee_command_help_text)

xchat.prnt('zicbee_xchat v0.1 loaded... for help type /zic help')
