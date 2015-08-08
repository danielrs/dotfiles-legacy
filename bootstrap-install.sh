#! /bin/bash
# See: https://ngzhian.wordpress.com/2013/01/11/what-i-learned-about-fonts/
# for information about font

cwd=$(pwd)

for d in */; do
	# Go into directory
	cd "$d"
	# Run the install commands
	if [ -x bootstrap-install ]; then
		echo "> Installing $d"
		./bootstrap-install
	fi
	# Return
	cd ../
done
