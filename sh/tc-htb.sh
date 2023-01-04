#!/usr/bin/env sh

DEV=$1
BW=$2

tc qdisc del dev $DEV root
tc qdisc add dev $DEV root handle 1: htb default 11
tc class add dev $DEV parent 1: classid 1:11 htb rate $BW ceil $BW

echo "set $DEV: rate $BW"
