#!/bin/bash

cd ~/OP1-Companion

[[ ! -f "./CLIENT_SSID" ]] && echo "default" > ./CLIENT_SSID
[[ ! -f "./CLIENT_TKIP" ]] && echo "default" > ./CLIENT_TKIP

CLIENT_SSID=`cat CLIENT_SSID`
CLIENT_TKIP=`cat CLIENT_TKIP`

#sudo apt update
sudo apt install -y jmtpfs mtp-tools

sudo cp MTP/99-op1companion.rules /lib/udev/rules.d

sudo WIFI/wifi-hostap.sh -a OP1-Companion 0102030405060708 -c "$CLIENT_SSID" "$CLIENT_TKIP"
