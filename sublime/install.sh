#!/bin/sh
#
# Sublime Text 3
#
# This links the ST3 config files

# Sublime Text 3 config symlinks
find $ZSH/sublime/User/* -depth 0 | while read FILE
do
	ln -s "$FILE" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
done
