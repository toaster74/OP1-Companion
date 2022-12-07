#!/bin/bash

sudo apt-get install -y bridge-utils hostapd
cat <<EOF > /tmp/99-op1companion.conf
net.ipv4.ip_forward=1
EOF
sudo cp /tmp/99-op1companion.conf /etc/sysctl.d

cat <<EOF > /tmp/interfaces
auto lo
iface lo inet loopback

# Disable eth0 / wlan0 config, handled by bridge
auto eth0
iface eth0 inet manual

allow-hotplug wlan0
iface wlan0 inet manual

# Create a bridge with static IP
auto br0
iface br0 inet dhcp
  bridge_ports eth0
EOF
sudo cp /tmp/interfaces /etc/network/

cat <<EOF > /tmp/hostapd.conf
# First part is about configuring the access point and is copied from reference 1
interface=wlan0
driver=nl80211
hw_mode=g
channel=6
ieee80211n=1
wmm_enabled=1
ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
# This part is about setting SSID and WPA2 password
ssid=wifi_ssid
wpa_passphrase=wifi_password
# This line ask hostapd to add wlan0 to the bridge br0
bridge=br0
EOF
sudo cp /tmp/hostapd.conf /etc/hostapd/hostapd.conf

sudo sed -iorig 's+#DAEMON_CONF=""+DAEMON_CONF="/etc/hostapd/hostapd.conf"+g' /etc/default/hostapd
