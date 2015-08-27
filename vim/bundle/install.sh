# !/bin/bash

while read line; do
	first_char=${line:0:1}
	if [ "$first_char" == '#' ]; then
		continue
	fi
	git clone $line
done < plugins.txt
