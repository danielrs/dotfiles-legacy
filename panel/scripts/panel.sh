#! /bin/bash

. ~/.config/panel/panelrc

if [ $(pgrep -cx panel) -gt 1 ] ; then
	printf '%s\n' "The panel is already running." >&2
	exit 1
fi

trap 'trap - TERM; kill 0' TERM INT QUIT EXIT

bspc config top_padding $PANEL_HEIGHT

admiral | lemonbar -g x$PANEL_HEIGHT -f "$PANEL_FONT_FAMILY" -f "$PANEL_FONT_ICONS" -B "$COLOR_BACKGROUND" -F "$COLOR_FOREGROUND"