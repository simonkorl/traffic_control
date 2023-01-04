#!/usr/bin/env sh

DEV=$1
BW=$2
BURST=$3
LATENCY=$4

tc qdisc del dev $DEV root
tc qdisc add dev $DEV parent 1:1 handle 10: tbf rate $BW burst $BURST latency $LATENCY

echo "set $DEV: delay $DELAY, bw $BW, burst $BURST"
