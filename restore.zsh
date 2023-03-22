#!/bin/zsh

# Use this script to restore the previous file if your new changes applied from load_new.zsh didn't work

# Prompt for password
read -s -p "Password for sudo: " password
echo ""

# remove current file
echo "$password" | sudo rm -f /etc/keyd/mac.conf

# restore the backup
echo "$password" | sudo mv /etc/keyd/mac.conf.bak /etc/keyd/mac.conf

# reload
echo "$password" | sudo systemctl restart keyd