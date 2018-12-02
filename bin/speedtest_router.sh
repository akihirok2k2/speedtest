#!/bin/bash
## Wanted:  wget https://bootstrap.pypa.io/ez_setup.py -O - | python
##          easy_install speedtest-cli

set -x 

TMPFILE="$(mktemp -d)/speedtest.log"
OUTPUT="/data/git/speedtest/speedtest_router.tsv"
DATE="$(date "+%Y%m%d-%H%M%S")"

/usr/local/bin/speedtest --timeout 60 --simple > $TMPFILE

DOWN_SPEED=$(awk -F: '/Download/{print $2}' $TMPFILE )
UP_SPEED=$(awk -F: '/Upload/{print $2}' $TMPFILE )

[ "$DOWN_SPEED" == "" ] && DOWN_SPEED="NG"
[ "$UP_SPEED" == "" ] && UP_SPEED="NG"

echo -e "$DATE \t $DOWN_SPEED \t $UP_SPEED" >> $OUTPUT

rm -f $TMPFILE
