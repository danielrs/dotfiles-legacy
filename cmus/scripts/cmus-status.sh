#! /bin/bash

FIFO=/tmp/cmus-fifo
get_status() {
	local status=$(cmus-remote -Q 2>/dev/null | grep status | head -n 1 | cut -d ' ' -f2-)
	local artist=$(cmus-remote -Q 2>/dev/null | grep artist | head -n 1 | cut -d ' ' -f3-)
	local album=$(cmus-remote -Q 2>/dev/null | grep album | head -n 1 | cut -d ' ' -f3-)
	local title=$(cmus-remote -Q 2>/dev/null | grep title | head -n 1 | cut -d ' ' -f3-)
	local year=$(cmus-remote -Q 2>/dev/null | grep date | head -n 1 | cut -d ' ' -f3-)

	if [[ "$status" == 'exiting' ]] || [ -z "$status" ]; then
		printf 'CMUSnot_running\n'
	else
		printf 'CMUS%s:%s:%s:%s:%s\n' "$status" "$artist" "$album" "$title" "$year"
	fi
}

. ~/.dotfiles/panel/scripts/subscribable.sh
