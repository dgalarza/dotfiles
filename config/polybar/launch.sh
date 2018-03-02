#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for monitor in $(xrandr -q | grep " connected" | cut -d " " -f1); do
    polybar ${monitor}&
  done
fi

echo "Bars launched..."
