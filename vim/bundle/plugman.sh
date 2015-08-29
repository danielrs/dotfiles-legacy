update() {
	for d in */ ; do
		cd $d
		git pull origin master
		cd ../
	done
}

install() {
	while read line; do
		first_char=${line:0:1}
		if [ "$first_char" == '#' ]; then
			continue
		fi
		git clone $line
	done < plugins.txt
}

case $1 in
	-u)
		update
		;;
	--update)
		update
		;;
	-i)
		install
		;;
	--install)
		install
		;;
	*)
		printf "Argument not recognized!\n"
		;;
esac
