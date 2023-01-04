#!/usr/bin/env sh

DEV=$1
DELAY=$2
LOSS=$3
RATE=$4
LIMIT=$5

tc qdisc del dev $DEV root
tc qdisc add dev $DEV root netem delay $DELAY loss $LOSS rate $RATE limit $LIMIT

echo "set $DEV: delay $DELAY, loss $LOSS, rate $RATE, limit $LIMIT"

