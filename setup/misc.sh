#!/bin/bash
# plist files
# Use this tool to view plist files in the terminal: plutil -p filename
if [[ $OSTYPE == 'darwin'* ]]; then
	ln -s ~/bin/dotfiles/jumpcut/net.sf.Jumpcut.plist ~/Library/Preferences/net.sf.Jumpcut.plist
fi
