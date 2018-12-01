#!/bin/bash

set -x 

#TMPFILE="$(mktemp -d)/speedtest.log"
#OUTPUT="/data/git/speedtest/speedtest.tsv"
GITDIR="/data/git/speedtest/"
DATE="$(date "+%Y%m%d")"

[ -d "$GITDIR" ] || exit 1
cd $GITDIR

git add -A
git commit -a -m "Update $DATE"
git push origin master
