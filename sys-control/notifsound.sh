#!/bin/bash -
#===============================================================================
#
#          FILE: toggle_notifsound.sh
#
#         USAGE: ./toggle_notifsound.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: valentin_lechner@dismail.de 
#  ORGANIZATION: 
#       CREATED: 21.02.2019 15:30:02
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

audio_notiffile="/.scripts/.scriptinfo/audio_notif"

datei_da(){
	if [ -f "$audio_notiffile" ]; then
		source "$audio_notiffile"
	else
		mkdir -p /.scripts/.scriptinfo
		touch "$audio_notiffile"
	fi
}

write_audionotif_tofile(){
	echo "notification_sound=""$notification_sound" > "$audio_notiffile"
}

variable_initialisiert(){
	# variable set?
	if [ -z ${notification_sound+x} ]; then
		notification_sound=0
	fi
}

invert_state(){
	if [ "$notification_sound" -eq 0 ]; then
		notification_sound=1
	else
		notification_sound=0
	fi
}


set_state(){
	datei_da
	variable_initialisiert
	invert_state
	write_audionotif_tofile
}

get_state(){
	datei_da
	variable_initialisiert
	source "$audio_notiffile"
	echo "$notification_sound"
}
while getopts "gs" o; do
	case "$o" in 
		g) get_state ;;
		s | * ) set_state ;;
	esac
done
