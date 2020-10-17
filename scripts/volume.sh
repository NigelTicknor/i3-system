#!/bin/bash

SINK=$(get_sink.sh)

if [[ -z "$1" ]]; then
	pacmd list-sinks | awk '/^\s+name: /{indefault = $2 == "<'$SINK'>"}/^\s+volume: / && indefault {print $5; exit}' | awk -F"%" '{print $1}'
	exit
fi

VOLUME="$1"

if [[ "$VOLUME" == "up" ]]; then
	VOLUME="+5%"
elif [[ "$VOLUME" == "down" ]]; then
	VOLUME="-5%"
elif [[ "$VOLUME" == "togglemute" ]]; then
	pactl set-sink-mute "$SINK" toggle
	exit
fi

pactl set-sink-volume "$SINK" "$VOLUME"
exit 0
