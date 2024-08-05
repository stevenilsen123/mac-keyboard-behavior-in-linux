#!/bin/bash

# Function to display the menu
display_menu() {
    echo "Please select your keyboard style:"
    echo "1) MacOS"
    echo "2) Windows"
}

# Function to read the user's choice
read_choice() {
    read -p "Enter the number of your choice: " choice
}

SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Main script
while true; do
    display_menu
    read_choice

    case $choice in
    1)
        conf_file=$SCRIPT_DIR/keyboard_mac.conf
        break
        ;;
    2)
        conf_file=$SCRIPT_DIR/keyboard_win.conf
        break
        ;;
    *)
        echo "Invalid choice, please try again."
        ;;
    esac
done

echo "Proceeding with choice $choice"
mv $conf_file /etc/keyd
echo "$conf_file moved to /etc/keyd"
systemctl restart keyd
echo "Keyd restarted!"
