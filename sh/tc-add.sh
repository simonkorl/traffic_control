#!/usr/bin/env sh

DEV=$1
DELAY=$2
LOSS=$3
BW=$4
BURST=$5
LATENCY=$6

tc qdisc del dev $DEV root
tc qdisc add dev $DEV root handle 1:0 netem delay $DELAY loss $LOSS
tc qdisc add dev $DEV parent 1:1 handle 10: tbf rate $BW burst $BURST latency $LATENCY

echo "set $DEV: delay $DELAY, loss $LOSS, bw $BW, burst $BURST, latency $LATENCY"

