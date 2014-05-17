#!/bin/sh

#####################################################
# dnsmasq                                           #
#####################################################

# Copy the config
cp config/dnsmasq.conf /usr/local/etc/dnsmasq.conf
# Load on boot
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

#####################################################
# MySQL                                             #
#####################################################

unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
mysql.server start
mysql_secure_installation
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

#####################################################
# Apache                                            #
#####################################################

sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist
sudo apachectl start
