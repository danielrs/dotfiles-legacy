#!/bin/bash

source ~/.config/panel/panelrc

while read -r line; do

	printf '%b\n' "%{F$COLOR_TITLE_FG}%{B$COLOR_TITLE_BG} %{B$COLOR_TITLE_ICON_BG}%{F$COLOR_TITLE_ICON_FG}$ICON_TITLE%{F-}%{B-} ${line} %{B-}%{F-}"

done < <(xtitle -s -t 100)

