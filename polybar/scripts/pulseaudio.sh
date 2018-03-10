#!/bin/env sh
# This scripts constantly prints pulseaudio status
# to stdout with an adequate format for use with
# the custom/script polybar module.

sink=0

print_format() {
    local muted=$(pamixer --sink $sink --get-mute)
    local volume=$(pamixer --sink $sink --get-volume)

    # Sets icon.
    local icon=
    if [ "$muted" = "true" ]; then
	icon=
    elif [ "$volume" -le 33 ]; then
	icon=
    elif [ "$volume" -le 66 ]; then
	icon=
    else
	icon=
    fi

    # Prints output.
    echo "$icon $volume%"
}

print_format

pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "#$sink"; then
	print_format
    fi
done
