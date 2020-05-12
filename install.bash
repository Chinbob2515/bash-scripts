#! /bin/bash
# a command just to place all these scripts into a default PATH location
# requires sudo

if [ "$EUID" -ne 0 ]; then 
	echo "Please run as root"
	exit 1
fi

# moves first argument to our aim
# move <path>
AIM="/usr/local/bin/"
move() {
	# really don't want to overwrite files if they already exist and are not versions of our files
	cp -i -v $1 $AIM
}
alias cp="cp -i -v"


# move the files into place

move daemon/daemon
