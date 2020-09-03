#!/bin/sh

chosen="$(cut -d ';' -f1 "${XDG_DATA_HOME:-$HOME/.config/local/share}/emoji" \
    | dmenu -fn 'Iosevka Nerd Font Mono-12' -nb '#212337' -nf '#b4c2f0' -i -l 30 \
    | sed "s/ .*//")"

[ -z "$chosen" ] && exit 2

[ -n "$1" ] && xdotool type "$chosen" && exit 0

echo "$chosen" | tr -d '\n' | xclip -sel clipboard \
    && notify-send "'$chosen' copied to clipboard"
