#! /bin/bash
# a command just to place all these scripts into a default PATH location
# requires sudo

# really don't want to overwrite files if they already exist and are not versions of our files
alias cp="cp -i -v"


# move the files into place

AIM="/usr/local/bin/"

cp daemon/daemon $AIM
