#!/usr/bin/env bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_volume {

  amixer -D default get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1

}

function is_mute {
  
  amixer -D default get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null

}

function send_notification {

  iconSound="/usr/share/icons/elementary-xfce/notifications/48/audio-volume-"
  iconMuted="/usr/share/icons/elementary-xfce/notifications/48/audio-volume-muted.svg"
  
  if is_mute ; then
  
    notify-send -i $iconMuted -u low "mute" -t 500
  
  else
    
    volume=$(get_volume)
    
    if [[ "$volume" -gt 66 ]]; then
      iconSound=$iconSound"high.svg"
    elif [[ "$volume" -gt 33 ]]; then
      iconSound=$iconSound"medium.svg"
    else
      iconSound=$iconSound"low.svg"
    fi
    
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq --separator="─" 0 "$((volume / 5))" | sed 's/[0-9]//g')
    # Send the notification
    notify-send -i $iconSound -u low "    $bar $volume" -t 500
    /.scripts/audioNotification.sh -v
  
  fi
}

case $1 in
  up)
    # set the volume on (if it was muted)
    amixer -D default set Master on > /dev/null
    # up the volume (+ 5%)
    amixer -D default sset Master 5%+ > /dev/null
    send_notification
    ;;
  down)
    amixer -D default set Master on > /dev/null
    amixer -D default sset Master 5%- > /dev/null
    send_notification
    ;;
  mute)
    # toggle mute
    amixer -D default set Master 1+ toggle > /dev/null
    send_notification
    ;;
esac