#!/bin/bash

# Outputs the number of connected users

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "+----------------------------------+"
    echo "|   Snazz's Awesome User Counter   |"
    echo "+----------------------------------+"
    echo "| usage:                           |"
    echo "|       mcusers <ip> <port>        |"
    echo "| example:                         |"
    echo "|       mcusers jadon.ath.cx 25565 |"
    echo "+----------------------------------+"
    exit
fi

(echo -e '\xfe'; sleep 1) |telnet -L $1 $2 2>/dev/null |awk -F'\xa7' '$2 {print "users: "$2"/"$3;}'