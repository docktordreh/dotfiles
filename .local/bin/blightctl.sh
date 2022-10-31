#!/usr/bin/env bash

# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_brightness {
  xbacklight -get | cut -d '.' -f 1
}

function send_notification {
  icon="/usr/share/icons/Paper/48x48/notifications/notification-display-brightness-"
  
  brightness=$(get_brightness)
  
  if [[ "$brightness" -gt 66 ]]; then
    icon="${icon}full.svg"
  elif [[ "$brightness" -gt 33 ]]; then
    icon="${icon}medium.svg"
  else
    icon="${icon}low.svg"
  fi
  
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq --separator="─" 0 "$((brightness / 5))" | sed 's/[0-9]//g')
  
  # Send the notification
  notify-send -i $icon -u low "    $bar $brightness%" -t 500
}

case $1 in
  up)
    # increase the backlight by 5%
    xbacklight -inc 5
    echo "Backlight increased by 5% to ""$(get_brightness)""%"
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    xbacklight -dec 5
    echo "Backlight decreased by 5% to ""$(get_brightness)""%"
    send_notification
    ;;
esac
