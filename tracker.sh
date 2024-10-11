#!/bin/bash

# This script is made, to monitor the internet usage with my mobile hotspot, 
#well it's because I use my mobile hotspot and and it's very inefficient to go see regularly
# how much data I have left or how much I have used!

#configuration 
LOG_FILE="$HOME/internet_usage.log"
PING_ADDRESS="8.8.8.8"
INTERFACE="wlp2s0"
CHECK_INTERVAL=5

#echo "well it is working at least"

# check if vnstat is installed or not?
if ! command -v vnstat &> /dev/null
then
	echo "vnsat is required, but not installed. Please install using following command: "
	echo "sudo apt install vnstat"
	exit
fi

#function to check internet connectivity
check_connectivity() {
	if ping -c $PING_ADDRESS &> /dev/null
	then
		echo "$(date): internet is connected" >> $LOG_FILE
	else
		echo "$(date): Internet is not connected" >> $LOG_FILE
	fi
}


log_usage() {
	echo "$date): logging newtwork usage!"
	vnstat --oneline -i $INTERFACE >> $LOG_FILE
}


while true
do
	echo "In the infinite loop!"
	check_connectivity
	log_usage
	sleep $CHECK_INTERVAL 
done 




































