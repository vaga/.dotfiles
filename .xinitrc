#!/bin/sh

# Set keyboard
setxkbmap fr

# Delete the fckin bell
xset -b

# Set number lock
numlockx &

# Add real transparency
xcompmgr -o -c &

# Start URxvt daemon
urxvtd -q -o -f &

# Let's gooo !
exec awesome
