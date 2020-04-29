#!/bin/sh

vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
exec /usr/bin/mwm -display localhost:1 &
/bin/bash
