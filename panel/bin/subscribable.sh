#! /bin/bash

# This script provides an API for making scripts that has "status", and reports it to other script
# subscribed to it.

# Here's how it works:
# 1. This script assumes the existence of a variable named FIFO
# 2. This script assumes the existence of a function named getStatus
# 3. This script calls them when necessary

if [ -z "$FIFO" ] || [ ! $(functionExists getStatus) -eq 0 ]; then
	echo "FIFO and getStatus must be defined!"
	exit
fi

statusChanged() {
	if [ -p "$FIFO" ]; then
		getStatus > "$FIFO"
	fi
}

subscribe() {

	# trap "rm -f \"$FIFO\"" EXIT

	if [ -p "$FIFO" ]; then
		rm "$FIFO"
	fi
	mkfifo "$FIFO"

	# Trigger a status change
	statusChanged &

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
			statusChanged
			;;
		--changed)
			statusChanged
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
	getStatus
fi
