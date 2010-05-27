#!/bin/sh
# Create your radio ! (just need to install icecast2 and gstreamer before...)
# ONLY WORKS WITH PulseAudio
# Stream soundcard output to an icecast server (tested with ubuntu-karmic and debian-testing using icecast2)

# some config:

# icecast password
pw=hackme
# soundcard, try "paman" package to figure out WTF this is
sink=alsa_output.pci-0000_00_1b.0.analog-stereo
# icecast server
server=127.0.0.1
# vorbis quality, from -0.1 to 1.0
q=0.3

gst-launch-0.10 pulsesrc device=${sink}.monitor ! audioconvert ! vorbisenc quality=$q managed=true ! oggmux ! shout2send mount=/stream.ogg port=8000 password=$pw ip=$server
