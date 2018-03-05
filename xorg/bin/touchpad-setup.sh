#!/bin/bash
# This scripts enables touchpad tap and natural scrolling properties of libinput using
# xinput.
init() {
    local xinput="$(command -v xinput)"
    local gawk="$(command -v gawk)"

    if [ -x "$xinput" -a -x "$gawk" ]; then
	local touchpadId=$($xinput list |
	    grep Touchpad |
	    $gawk 'match($0, /id=([0-9]+)/, a) {print a[1]}')

	if [ ! -z "$touchpadId" ]; then
	    local tappingId=$($xinput list-props $touchpadId |
		grep "libinput Tapping Enabled" |
		$gawk 'match($0, /Enabled \(([0-9]+)\)/, a) {print a[1]}')

	    local naturalScrollingId=$($xinput list-props $touchpadId |
		grep "libinput Natural Scrolling Enabled" |
		$gawk 'match($0, /Enabled \(([0-9]+)\)/, a) {print a[1]}')

	    [ ! -z "$tappingId" ] && $xinput set-prop $touchpadId $tappingId 1
	    [ ! -z "$naturalScrollingId" ] && $xinput set-prop $touchpadId $naturalScrollingId 1
	fi
    else
	echo "one of the required executables is missing (xinput, gawk)"
    fi
}
init
