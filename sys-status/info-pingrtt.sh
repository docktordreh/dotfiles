#!/bin/bash

HOST=9.9.9.9

if ! resp=$(ping -n -c 1 -W 1 $HOST); then
    echo "轢 ping failed"
else
    
    rtt=$(echo "$resp" | grep '=' | tr '/' ' ' | awk '{print $7}' | cut -d '=' -f 2 | head -1)
    
    ping=${rtt%.*}
    if [[ "$ping" -lt 50 ]]; then
    	rtt_cl="%{F3cb703}ﯱ ""$rtt ms""%{F444444}"
    elif [[ "$ping" -lt 150 ]]; then
        rtt_cl="%{Ff9dd04}ﯳ ""$rtt ms""%{F444444}"
   else
        rtt_cl="%{Fd60606} ""$rtt ms""%{F444444}"
    fi

    echo "$rtt_cl"
fi
