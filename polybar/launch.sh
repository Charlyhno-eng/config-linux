#!/bin/sh
killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 1
done

sleep 2

polybar main &
