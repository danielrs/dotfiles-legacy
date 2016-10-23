#!/bin/bash

source ~/.config/panel/panelrc

while read -r line; do

	now_playing="%{F$COLOR_LAYOUT_FG}%{B$COLOR_LAYOUT_BG} \u266B $(display "${line:4}") %{B-}%{F-}"
	status=$(echo ${line:4} | cut -d ':' -f1)
	artist=$(echo ${line:4} | cut -d ':' -f2)
	album=$(echo ${line:4} | cut -d ':' -f3)
	title=$(echo ${line:4} | cut -d ':' -f4)
	year=$(echo ${line:4} | cut -d ':' -f5)

	if [[ "$status" == 'not_running' ]] || [ -z "$status" ]; then
		now_playing="%{F$COLOR_NOTIFICATION_FG} CMUS is not running. %{F-}"
	else
		if [ "$status" == "paused" ]; then
			now_playing="%{F$COLOR_NOTIFICATION_FG} $ICON_MUSIC_PAUSED Paused %{F-}"
		else
			now_playing="%{F$COLOR_NOTIFICATION_FG} $ICON_MUSIC_PLAYING $(display "$artist - $title") %{F-}"
		fi
	fi

	printf '%b\n' "${now_playing}"

done < <(cmus-status --subscribe)
