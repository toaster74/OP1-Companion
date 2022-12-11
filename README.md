# OP1-Companion
OP1 Companion on a Raspberry Pi Zero W for the "missing functionalitites"(TM)

# Quickstart
  - clone the repository into directory `~/OP1-Companion`
  - `cd OP1-Companion`
  - create `CLIENT_SSID` with client SSID of your wifi connection
  - create `CLIENT_TKIP` with the password of your wifi connection
  - run `./runme.sh`
  - restart 

# CREDITS
### HostAP and WiFi Client
 - Inspiration for the HostAP and Wifi-Client script at https://gist.github.com/lukicdarkoo/6b92d182d37d0a10400060d8344f86e4 which has been optimized by https://github.com/lukicdarkoo/rpi-wifi; but failed. This issue helped me: https://github.com/lukicdarkoo/rpi-wifi/issues/32
 - RaspAP on http://raspap.com; https://docs.raspap.com/ap-sta/#installation
```
curl -sL https://install.raspap.com | bash -s -- -y --openvpn 0 --adblock 0
# admin / secret
```
