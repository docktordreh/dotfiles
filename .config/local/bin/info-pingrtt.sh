#!/bin/sh

HOST="$(ip route | grep default | head -n 1 | awk '{print $3}')"
HOST="${HOST:-1.1.1.1}"

if ! resp=$(ping -n -c 1 -W 1 $HOST); then
	echo "轢 ping failed"
else

	rtt=$(echo "$resp" | grep '=' | tr '/' ' ' | awk '{print $7}' | cut -d '=' -f 2 | head -1)

	ping=${rtt%.*}
	if [ "$ping" -lt 50 ]; then
		rtt_cl="%{F$(echo $HOME/.config/local/bin/xgetcolor.sh 5 | cut -d '#' -f 2)}ﯱ ""$rtt ms""%{F444444}"
	elif [ "$ping" -lt 150 ]; then
		rtt_cl="%{F$(echo $HOME/.config/local/bin/xgetcolor.sh 3 | cut -d '#' -f 2)}ﯳ ""$rtt ms""%{F444444}"
	else
		rtt_cl="%{F$(echo $HOME/.config/local/bin/xgetcolor.sh 9 | cut -d '#' -f 2)} ""$rtt ms""%{F444444}"
	fi

	echo "$rtt_cl"
fi
