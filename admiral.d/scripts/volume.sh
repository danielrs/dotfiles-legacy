#!/bin/bash

source ~/.config/panel/panelrc

while read -r line; do

	volume_status=$(echo ${line:3} | cut -d ':' -f1)
	volume_level=$(echo ${line:3} | cut -d ':' -f2)

	if [[ $volume_level -le 0 ]]; then
		volume_icon='\uE04F'
	elif [[ $volume_level -le 50 ]]; then
		volume_icon='\uE04E'
	else
		volume_icon='\uE050'
	fi

	if [ "$volume_status" == 'off' ]; then
		volume_icon='\uE04F'
		volume_color=${COLOR_URGENT_FG}
	else
		volume_color=${COLOR_WARNING_FG}
	fi

	printf '%b\n' "%{B$COLOR_BACKGROUND}%{F$volume_color} $volume_icon $volume_level% %{F-}%{B-}"

done < <(volume-status --subscribe)
