#!/bin/bash

[[ ! -f "./CLIENT_SSID" ]] && echo "default" > ./CLIENT_SSID
[[ ! -f "./CLIENT_TKIP" ]] && echo "default" > ./CLIENT_TKIP
CLIENT_SSID=`cat CLIENT_SSID`
CLIENT_TKIP=`cat CLIENT_TKIP`
sudo WIFI/wifi-hostap.sh -a OP1-Companion 0102030405060708 -c "$CLIENT_SSID" "$CLIENT_TKIP"
