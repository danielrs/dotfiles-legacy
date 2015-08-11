#! /bin/bash

cwd=$(pwd)

for d in */; do
	# Go into directory
	cd "$d"
	# If the directory contains any executable add it to path
	if [ -d bin ]; then
		PATH=$PATH:$cwd/$d/bin
	fi
	# Run the login commands
	if [ -x bootstrap-login ]; then
		. ./bootstrap-login
	fi
	# Return
	cd ../
done
