#!/usr/bin/env sh
get_sound() {
    pactl list sinks | grep '^[[:space:]]Volume:' |tail -n 1 | sed -e 's#.*\([0-9][0-9]\)%.*#\1#'
}
get_muted() {
    pactl list sinks | grep '[[:space:]]Mute:' | tail -n 1 | awk -F ':' '{print $2}' | sed 's#^[ \t]*##'
}

send_notification() {
  icon_def="/usr/share/icons/Paper/48x48/notifications/notification-audio-volume-"
  sound=$(get_sound)
  muted=$(get_muted)
  echo "loaded sound vol $sound"
  icon="${icon_def}low.svg"
  if [ "$sound" -gt 66 ]; then
    icon="${icon_def}high.svg"
  elif [ "$sound" -gt 33 ]; then
    icon="${icon_def}medium.svg"
  fi
  echo "muted $muted"
  if [ "$muted" = "yes" ]; then
      icon="${icon_def}muted.svg"
  fi

  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq --separator="─" 0 "$((sound / 5))" | sed 's/[0-9]//g')

  # Send the notification
  notify-send -i $icon -u low "    $bar $sound%" -t 500
}

sink=0
case $1 in
  up)
    # increase the backlight by 5%
    pactl set-sink-volume  "$sink" +5%
    echo "Sound increased by 5% to ""$(get_sound)""%"
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    pactl set-sink-volume  "$sink" -5%
    echo "Sound decreased by 5% to ""$(get_sound)""%"
    send_notification
    ;;
  mute)
    # decrease the backlight by 5%
    pactl set-sink-mute "$sink" toggle
    echo "Sound mute toggled. Muted: $(get_muted)"
    send_notification
    ;;
esac
