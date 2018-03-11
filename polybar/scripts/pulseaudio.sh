#!/bin/env sh
# This scripts constantly prints pulseaudio status
# to stdout with an adequate format for use with
# the custom/script polybar module.

#
# Functions for getting the status of pulseaudio sinks.
#

# Prints the default sink name.
print_default_sink_name() {
    pacmd stat | awk -F": " '/^Default sink name: /{print $2}'
}

# Prints the default sink id.
print_default_sink_id() {
    pactl list short sinks | grep $(print_default_sink_name) | awk '{print $1}'
}

# Prints the running sink name that is also the default sink.
print_default_running_sink_name() {
    pactl list short sinks | grep RUNNING | grep $(print_default_sink_name) | awk '{print $2}'
}

# Prints the running sink id that is also the default sink.
print_default_running_sink_id() {
    pactl list short sinks | grep RUNNING | grep $(print_default_sink_name) | awk '{print $1}'
}

# Prints the first running sink name.
print_running_sink_name() {
    pactl list short sinks | grep RUNNING | head -n 1 | awk '{print $2}'
}

# Prints the first running sink id.
print_running_sink_id() {
    pactl list short sinks | grep RUNNING | head -n 1 | awk '{print $1}'
}

#
# Functions for getting and updating the best sink.
#

# Prints the best sink from the list of sinks, ordering is;
# default and running > running > default.
print_best_sink() {
    local default_running_sink=$(print_default_running_sink_id)
    local running_sink=$(print_running_sink_id)

    if [ ! -z "$default_running_sink" ]; then
	echo $default_running_sink
    elif [ ! -z "$running_sink" ]; then
	echo $running_sink
    else
	print_default_sink_id
    fi
}

# Keeps track of and updates the sink in use.
# The current sink id is also saved to SINK_FILE.
SINK_FILE=/tmp/pulseaudio-sink
update_sink() {
    local sink=
    local updated=false

    if [ $# -eq 0 ]; then
	sink=$(print_best_sink)
	updated=true
    elif [ ! -z "$1" ]; then
	if echo "$1" | grep -q "'\(new\|remove\)' on sink"; then
	    sink=$(print_best_sink)
	    updated=true
	elif echo "$event" | grep -q "on source-output"; then
	    sink=$(print_best_sink)
	    updated=true
	fi
    fi

    if [ "$updated" = true ]; then
	echo "$sink" > "$SINK_FILE"
	echo "$sink"
    fi
}

#
# Script actions.
#

volume_down() {
    if [ -f "$SINK_FILE" ]; then
	pamixer --sink $(cat "$SINK_FILE") -d 5
    else
	pamixer -d 5
    fi
}

volume_up() {
    if [ -f "$SINK_FILE" ]; then
	pamixer --sink $(cat "$SINK_FILE") -i 5
    else
	pamixer -i 5
    fi
}

volume_mute() {
    if [ -f "$SINK_FILE" ]; then
	pamixer --sink $(cat "$SINK_FILE") -t
    else
	pamixer -t
    fi
}

# print_format shows the status for the current sink.
sink=$(update_sink)
print_format() {
    # Checks that the current sink exists.
    if pactl list short sinks | awk '{print $1}' | grep -q "^$sink$"; then
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

listen() {
    print_format
    pactl subscribe | while read -r event; do
	new_sink=$(update_sink $event)
	if [ ! -z "$new_sink" ]; then
	    sink=$new_sink
	    print_format
	elif echo "$event" | grep -q "on sink #$sink$"; then
	    print_format
	fi
    done
}

case "$1" in
    --down)
	volume_down
	;;
    --up)
	volume_up
	;;
    --mute)
	volume_mute
	;;
    *)
	listen
	;;
esac
