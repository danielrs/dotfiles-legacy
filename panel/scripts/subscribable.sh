#! /bin/bash

# This script provides an interface for making scripts that has "status", and reports it to other script
# subscribed to it. All of these subscribe functinality is implemented through named pipes.

# The script needs 2 symbols to be defined to work:
# 1. FIFO: the location of the named pipe
# 2. get_status: a function that returns some output, this output is send to the pipe

if [ -z "$FIFO" ] || [ $(declare -F get_status > /dev/null; echo $?) -ne 0 ]; then
	echo "FIFO and get_status must be defined!"
	exit
fi

status_changed() {
	if [ -p "$FIFO" ]; then
		get_status > "$FIFO"
	fi
}

subscribe() {

	# trap "rm -f \"$FIFO\"" EXIT

	if [ -p "$FIFO" ]; then
		rm "$FIFO"
	fi
	mkfifo "$FIFO"

	# Trigger a status change
	status_changed &

	# Reading loop
	local MAX_TRIES=3
	local tries=0
	while true; do
		if [ $tries -ge $MAX_TRIES ]; then break; fi
		if read line < "$FIFO"; then
			tries=0
			if [[ "$line" == 'quit' ]]; then
				break;
			fi
			echo $line
		else
			tries=$((tries + 1))
		fi
	done
}

if [ ! -z "$1" ]; then
	case $1 in
		-c)
			status_changed
			;;
		--changed)
			status_changed
			;;
		-s)
			subscribe
			;;
		--subscribe)
			subscribe
			;;
		*)
			printf 'Agument not recognized!\n'
			;;
	esac
else
	get_status
fi
