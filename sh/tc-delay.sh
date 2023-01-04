#!/usr/bin/env sh

DEV=$1
DELAY=$2

tc qdisc del dev $DEV root
tc qdisc add dev $DEV root handle 1:0 netem delay $DELAY

echo "set $DEV: delay $DELAY"

