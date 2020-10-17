#!/bin/bash


monitors="$(xrandr | grep " connected " | cut -d' ' -f1)"
count=$(echo "$monitors" | wc -l)

iteration=1

while [[  "$iteration" -le "$count" ]]; do
	selection="$(echo "$monitors" | sed -n "${iteration}p")"
	xrandr --output "$selection" --brightness "$1"
        iteration=$((iteration+1))
done
