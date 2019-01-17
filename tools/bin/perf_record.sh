#!/bin/bash -e

FG_PATH=~/FlameGraph

if [[ $# -lt 2 ]]; then
    echo "wrong args"
    echo "e.g. $0 \"-p 123\" outfile"
    exit 1
fi

cd /tmp

set -v

perf record $1 -e cpu/event=0xa2,umask=0x1,name=resource_stalls_any,period=2000000/ -e cpu/event=0x3c,umask=0x0,name=cpu_clk_unhalted_thread_p,period=2000000/ --call-graph dwarf -F 1000 -- sleep 10
perf script -f > /tmp/out.perf
$FG_PATH/stackcollapse-perf.pl --event-filter=cpu_clk_unhalted_thread_p /tmp/out.perf > /tmp/out.folded.cycles
$FG_PATH/stackcollapse-perf.pl --event-filter=resource_stalls_any /tmp/out.perf > /tmp/out.folded.stalls

cd -

$FG_PATH/difffolded.pl -n /tmp/out.folded.stalls /tmp/out.folded.cycles | $FG_PATH/flamegraph.pl --title "CPI Flame Graph: blue=stalls, red=instructions" --width=900 > $2.svg
