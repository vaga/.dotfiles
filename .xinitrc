#!/bin/sh
setxkbmap fr
xset -b
xcompmgr -o -c &
exec awesome
