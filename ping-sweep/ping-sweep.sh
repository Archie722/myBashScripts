#! /bin/bash

echo 'Enter the /24 network address you would like to ping-sweep'
read userinput
# Get the first three octects of the IP address the user inputs
networkaddress=$(echo $userinput | cut -d '.' -f 1,2,3)
# Ping all IP addresses in the network and show the ones that reply
for i in {1..254}; do (ping -c 1 $networkaddress.$i | grep "bytes from" | cut -d ' ' -f 4 | cut -d ':' -f 1 &); done