#!/bin/bash

workspaces="$(i3-msg -t get_workspaces | jq -r ".[] | .name")"
positions="$(cat "$HOME/.config/i3/config" | grep "output")"
currents="$(i3-msg -t get_outputs | jq -r ".[]|select(.current_workspace != null)|.current_workspace")"

move_workspace()
{
    
    if [[ -z "$2" ]]; then
	exit 1
    fi
    i3-msg workspace "$1"
    i3-msg move workspace to output "$2"
}

select_output()
{
    line=$(echo "$positions" | grep "workspace \"$1\" output")
    output=$(echo "$line" | cut -d' ' -f 4)
    echo "$output"
}

while [[ "${#workspaces}" -gt "0" ]]; do
    wksp=$(echo "$workspaces" | sed -n "1p")
    output=$(select_output $wksp)
    surpress=$(move_workspace "$wksp" "$output")
    workspaces="$(echo "$workspaces" | grep -v "^$wksp\$")"
done

while [[ "${#currents}" -gt "0" ]]; do
    cur=$(echo "$currents" | sed -n "1p")
    i3-msg workspace "$cur"
    currents="$(echo "$currents" | grep -v "^$cur\$")"
done
