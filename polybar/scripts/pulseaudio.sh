#!/bin/env sh
# This scripts constantly prints pulseaudio status
# to stdout with an adequate format for use with
# the custom/script polybar module.

# Prints the default sink name.
print_default_sink_name() {
    pacmd stat | awk -F": " '/^Default sink name: /{print $2}'
}

# Pritns the default sink id.
print_default_sink_id() {
    pactl list short sinks | grep $(print_default_sink_name) | awk '{print $1}'
}

# print_format shows the current status of the default sink.
sink=$(print_default_sink_id)
print_format() {
    # Checks that the current sink exists.
    if pactl list short sinks | grep -q "$sink"; then
	local muted=$(pamixer --sink $sink --get-mute)
	local volume=$(pamixer --sink $sink --get-volume)

	# Sets icon.
	local icon=
	if [ "$muted" = "true" ]; then
	    icon=%{F#666866}%{F-}
	elif [ "$volume" -le 33 ]; then
	    icon=
	elif [ "$volume" -le 66 ]; then
	    icon=
	else
	    icon=
	fi

	# Prints output.
	echo "$icon $volume%"
    fi
}

# Prints and updates status.
print_format
pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "'\(new\|remove\)' on sink"; then
	sink=$(print_default_sink_id)
	print_format
    elif echo "$event" | grep -q "on sink #$sink"; then
	print_format
    fi
done
