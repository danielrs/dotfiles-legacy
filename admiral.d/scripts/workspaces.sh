#!/bin/bash

source ~/.config/panel/panelrc

if ! type bspc &> /dev/null; then
	echo "bspc not found"
	exit 1
fi

total_monitors=$(bspc query -M | wc -l)

while read -r line; do
	case $line in
		W*)
			IFS=':'
			set -- ${line:1}
			while [ $# -gt 0 ]; do
				item=$1
				name=${item:1}
				case $item in
					m*)
						# monitor
						if [ $total_monitors -gt 1 ] ; then
							echo -n "%{F$COLOR_INACTIVE_MONITOR_FG}%{B$COLOR_INACTIVE_MONITOR_BG} ${name} %{B-}%{F-}  "
						fi
						;;
					M*)
						# focused monitor
						if [ $total_monitors -gt 1 ] ; then
							echo -n "%{F$COLOR_ACTIVE_MONITOR_FG}%{B$COLOR_ACTIVE_MONITOR_BG} ${name} %{B-}%{F-}  "
						fi
						;;
					f*)
						# free desktop
						echo -n "%{F$COLOR_FREE_FG}%{B$COLOR_FREE_BG} ${name} %{B-}%{F-}"
						;;
					F*)
						# focused free desktop
						echo -n "%{F$COLOR_FOCUSED_FREE_FG}%{B$COLOR_FOCUSED_FREE_BG}%{U$COLOR_FOREGROUND} ${name} %{B-}%{F-}"
						;;
					o*)
						# occupied desktop
						echo -n "%{F$COLOR_OCCUPIED_FG}%{B$COLOR_OCCUPIED_BG} ${name} %{B-}%{F-}"
						;;
					O*)
						# focused occupied desktop
						echo -n "%{F$COLOR_FOCUSED_OCCUPIED_FG}%{B$COLOR_FOCUSED_OCCUPIED_BG}%{U$COLOR_FOREGROUND} ${name} %{B-}%{F-}"
						;;
					u*)
						# urgent desktop
						echo -n "%{F$COLOR_URGENT_FG}%{B$COLOR_URGENT_BG} ${name} %{B-}%{F-}"
						;;
					U*)
						# focused urgent desktop
						echo -n "%{F$COLOR_FOCUSED_URGENT_FG}%{B$COLOR_FOCUSED_URGENT_BG}%{U$COLOR_FOREGROUND} ${name} %{B-}%{F-}"
						;;
				esac
				shift
			done
	esac
	echo
done < <(bspc subscribe report)