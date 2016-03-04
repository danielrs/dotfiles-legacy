#! /bin/bash
# See: https://ngzhian.wordpress.com/2013/01/11/what-i-learned-about-fonts/
# for information about font

cwd=$(pwd)

# Colors
GREEN=$'\e[00;32m'
YELLOW=$'\e[01;33m'
NO_COLOR=$'\e[01;0m'

for d in */; do
	# Go into directory
	cd "$d"
	# Run the install commands
	if [ -x bootstrap-install ]; then
		echo "> ${GREEN}Installing ${YELLOW}$d${NO_COLOR}"
		./bootstrap-install
	fi
	# Return
	cd ../
done
