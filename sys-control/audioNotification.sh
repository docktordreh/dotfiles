#!/usr/bin/env bash
#===============================================================================
#
#          FILE: audioNotification.sh
#
#         USAGE: ./audioNotification.sh
#
#   DESCRIPTION:
#
#       OPTIONS:
#  REQUIREMENTS:
#          BUGS:
#         NOTES:
#        AUTHOR: valentin_lechner
#  ORGANIZATION:
#       CREATED: 21.02.2019 16:47:21
#      REVISION: 0.5
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
notif_file="$HOME""/.local/bin/notifsound.sh"
notif_type=""

while getopts "bvlm" o; do
	case "$o" in
		b) notif_type="brightness" ;;
		v) notif_type="volume" ;;
		l) notif_type="login" ;;
		m | *) notif_type="message" ;;
	esac
done

if [ "$("$notif_file" -g)" -eq 0 ]; then
	exit
fi
echo "$notif_type"
if [ "$notif_type" = "brightness" ]; then
	sound="/usr/share/sounds/ubuntu/stereo/message.ogg"
elif [ "$notif_type" = "volume" ]; then
	sound="/usr/share/sounds/sonar/stereo/audio-volume-change.oga"
elif [ "$notif_type" = "login" ]; then
	sound="/usr/share/sounds/ubuntu/stereo/desktop-login.ogg"
elif [ "$notif_type" = "message" ]; then
	sound="/usr/share/sounds/ubuntu/stereo/message.ogg"
fi

paplay "$sound"
