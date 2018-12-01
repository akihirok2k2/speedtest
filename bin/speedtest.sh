#!/bin/bash
## Wanted: easy_install speedtest-cli

set -x 

TMPFILE="$(mktemp -d)/speedtest.log"
OUTPUT="/data/git/speedtest/speedtest.tsv"
DATE="$(date "+%Y%m%d-%H%m%S")"

##  6766) JAIST(ino-lab) (Nomi, Japan) [279.62 km]
speedtest --server 6766 --timeout 60 --simple > $TMPFILE

if [ -f "$TMPFILE" ] ;then
  DOWN_SPEED=$(awk -F: '/Download/{print $2}' $TMPFILE )  
  UP_SPEED=$(awk -F: '/Upload/{print $2}' $TMPFILE )  
else 
  DOWN_SPEED="NG"
  UP_SPEED="NG"
fi

echo -e "$DATE \t $DOWN_SPEED \t $UP_SPEED " >> $OUTPUT

rm -f $TMPFILE
