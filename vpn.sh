#!/bin/bash

#connect using warp, then check if an ip has been assigned for you 
warp-cli connect
if [ "$?" = "0" ]
then
IP=$(curl -s ifconfig.co)
echo "Assigned IP = $IP"
else
echo "Error connecting to warp"
exit
fi

#connect using openVPN, and then check connection if you have an ip now “keep this process in the background"
sudo openvpn /home/shady/Downloads/ShadyTarek.ovpn

#second check, ping 10.10.10.10 -c 3 
ping -c 3 10.10.10.10
if [ "$?" = "0" ]
then
echo "openvpn connection successful"
else
echo "Error with openvpn connection"
fi

#Disconnect from warp
warp-cli disconnect

