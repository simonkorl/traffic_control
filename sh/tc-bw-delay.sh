#!/usr/bin/env sh

DEV=$1
DELAY=$2
BW=$3
BURST=$4
LATENCY=$5

tc qdisc del dev $DEV root
tc qdisc add dev $DEV root handle 1:0 netem delay $DELAY
tc qdisc add dev $DEV parent 1:1 handle 10: tbf rate $BW burst $BURST latency $LATENCY

echo "set $DEV: delay $DELAY, bw $BW, burst $BURST, latency $LATENCY"
