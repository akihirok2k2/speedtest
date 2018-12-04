#!/bin/bash

set -x 
GITDIR="/data/git/speedtest/"
DATE="$(date "+%Y%m%d")"

[ -d "$GITDIR" ] || exit 1
cd $GITDIR

git add -A
git commit -a -m "Update $DATE to Direct"
git push origin feat/direct
