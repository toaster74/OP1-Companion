#!/bin/bash

[[ ! -f "./DATA/CLIENT_SSID" ]] && echo "default" > ./DATA/CLIENT_SSID
[[ ! -f "./DATA/CLIENT_TKIP" ]] && echo "default" > ./DATA/CLIENT_TKIP
CLIENT_SSID=`cat ./DATA/CLIENT_SSID`
CLIENT_TKIP=`cat ./DATA/CLIENT_TKIP`
sudo WIFI/wifi-hostap.sh -a OP1-Companion 0102030405060708 -c "$CLIENT_SSID" "$CLIENT_TKIP"
