#!/bin/zsh

# Use this script to activate changes you made to mac.conf
# Use the restore.zsh script to restore the previous file if your new changes didn't work

# Prompt for password
read -s -p "Password for sudo: " password
echo ""

# remove old backup
echo "$password" | sudo touch ~/mac.conf.bak
echo "$password" | sudo rm -f /etc/keyd/mac.conf.bak

# backup current file
echo "$password" | sudo mv /etc/keyd/mac.conf /etc/keyd/mac.conf.bak

# Clean trailing whitespace characters from the new file with vim (keyd doesn't like them)
echo -e ":wq\n" | vim -c 'silent! %s/\s\+$//e' ./mac.conf

# copy over new file
echo "$password" | sudo cp ./mac.conf /etc/keyd/mac.conf

# reload
echo "$password" | sudo systemctl restart keyd