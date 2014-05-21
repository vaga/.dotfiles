#!/bin/sh

# Set keyboard
setxkbmap us

# Delete the fckin bell
xset -b

# Set number lock
numlockx on

# Add real transparency
xcompmgr &

# Let's gooo !
exec awesome
