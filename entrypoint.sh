#!/bin/bash
/config/init.sh
Xvfb -screen 0 1980x1080x24 &
x2goclient --session-conf=/config/sessions --geometry=fullscreen &
x11vnc -xkb -shared -forever &
exec /noVNC/utils/launch.sh
