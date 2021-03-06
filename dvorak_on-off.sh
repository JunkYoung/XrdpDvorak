#!/bin/bash

cd $(dirname $0)

dvorak="/etc/xrdp/dvorak.ini"
us="/etc/xrdp/us.ini"
name="/etc/xrdp/km-0409.ini"

if [ ! -f "$dvorak" ] && [ ! -f "$us" ] && [ -f "$name" ]; then
	sudo cp /etc/xrdp/km-0409.ini /etc/xrdp/km-0409.bak.ini
	sudo cp dvorak.ini /etc/xrdp/dvorak.ini
elif [ ! -f "$dvorak" ] && [ ! -f "$us" ] && [ ! -f "$name" ]; then
	sudo cp /etc/xrdp/km-00000409.ini /etc/xrdp/km-00000409.bak.ini
	sudo cp dvorak.ini /etc/xrdp/dvorak.ini
fi


if [ -f "$dvorak" ] && [ -f "$name" ]; then
	sudo mv /etc/xrdp/km-0409.ini /etc/xrdp/us.ini
	sudo mv /etc/xrdp/dvorak.ini /etc/xrdp/km-0409.ini
	zenity --info --title "Success" --text "us -> dvorak\n\nThis requires reconnect"
elif [ ! -f "$dvorak" ] && [ -f "$name" ]; then
	sudo mv /etc/xrdp/km-0409.ini /etc/xrdp/dvorak.ini
	sudo mv /etc/xrdp/us.ini /etc/xrdp/km-0409.ini
	zenity --info --title "Success" --text "dvorak -> us\n\nThis requires reconnect"
elif [ -f "$dvorak" ] && [ ! -f "$name" ]; then
	sudo mv /etc/xrdp/km-00000409.ini /etc/xrdp/us.ini
	sudo mv /etc/xrdp/dvorak.ini /etc/xrdp/km-00000409.ini
	zenity --info --title "Success" --text "us -> dvorak\n\nThis requires reconnect"
elif [ ! -f "$dvorak" ] && [ ! -f "$name" ]; then
	sudo mv /etc/xrdp/km-00000409.ini /etc/xrdp/dvorak.ini
	sudo mv /etc/xrdp/us.ini /etc/xrdp/km-00000409.ini
	zenity --info --title "Success" --text "dvorak -> us\n\nThis requires reconnect"
fi
