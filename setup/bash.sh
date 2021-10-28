#!/bin/bash

if [[ $OSTYPE == 'darwin'* ]]; then

	# Make MacOS use brew installed bash as the shell.
	# https://stackoverflow.com/a/23072501
	# First, add the new shell to the list of allowed shells.
	sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
	 # Change to the new shell.
	chsh -s /usr/local/bin/bash

fi
