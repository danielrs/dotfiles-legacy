#! /bin/bash

source ~/.config/panel/panelrc

clock=$(date "+%a, %b %d, %Y - %H:%M")
printf '%b\n' "%{F$COLOR_STATUS_FG}%{B$COLOR_STATUS_BG} $ICON_CLOCK ${clock} %{B-}%{F-}"
