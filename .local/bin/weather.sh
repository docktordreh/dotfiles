#!/bin/sh

weatherreport="${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport"
getforecast(){
    curl -sf "wttr.in/Karlsruhe" > "$weatherreport" || exit 1
}

showweather() {
    printf "%s" "$(sed '16q;d' "$weatherreport"  |
          grep -wo "[0-9]*%" |
          sort -rn | sed "s/^/%{F#7987CE}/g;1q" | tr -d '\n')"
    sed '13q;d' "$weatherreport" \
        | grep -o "m\\([-+]\\)*[0-9]\\+" \
        | sort -n -t 'm' -k 2n \
        | sed -e 1b -e '$!d' \
        | tr '\n|m' ' ' \
        | awk '{print "%{F#81A9FE} " $1 "℃","%{F#FEC676}" $2 "℃"}'
}

case $BLOCK_BUTTON in
    1) setsid -f urxvt -e less -Srf "$weatherreport" ;;
    2) getforecast && showweather ;;
    3) notify-send " Weather module" "\- Left click for full forecast.
- Middle click to update forecast.
☔: Chance of rain/snow
: Daily low
: Daily high" ;;
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# The test if our forcecast is updated to the day. If it isn't download a new
# weather report from wttr.in with the above function.
[ "$(stat -c %y "$weatherreport" 2>/dev/null \
    | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] \
    || getforecast

showweather
