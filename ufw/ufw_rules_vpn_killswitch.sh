#! /usr/bin/sh

# Sources
# https://www.reddit.com/r/VPN/comments/2vxrey/is_there_a_way_to_set_up_ubuntu_so_that_it_will/comog21
# https://www.privateinternetaccess.com/forum/index.php?p=/discussion/3188/kill-switch-for-ubuntu#Item_1
# https://www.privateinternetaccess.com/forum/discussion/3188/kill-switch-for-ubuntu

# Deny all traffic by default
sudo ufw default deny outgoing
sudo ufw default deny incoming

# Communicate in local network
sudo ufw allow out to 10.10.20.170/24
sudo ufw allow in to 10.10.20.170/24

# Allow all traffic through VPN
sudo ufw allow out on tun0 from any to any
sudo ufw allow in on tun0 from any to any

# Allow VPN to connect
sudo ufw allow out 1194/udp
sudo ufw allow out 1198/udp

# Allow US East
# Go to https://www.site24x7.com/find-ip-address-of-web-site.html or use nslookup
# Find ip of desired server
# then add rules for each ip:
# sudo ufw allow in from x.x.x.x to any
# sudo ufw allow out from any to x.x.x.x

sudo ufw allow in from 209.222.5.231 to any
sudo ufw allow out from any to 209.222.5.231
