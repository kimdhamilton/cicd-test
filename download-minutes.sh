#!/bin/bash

if [ ! -f "$DATE/irc-raw.log" ]; then
    mkdir -p $DATE
    echo "....Downloading IRC logs for $DATE..."
    curl -# "https://w3c-ccg.s3.digitalbazaar.com/minutes/$DATE-irc.log" > $DATE/irc-raw.log
    
    # commit raw logs
    git add $DATE/irc-raw.log
    MESSAGE="Add raw log for $DATE telecon."
    git commit $DATE/irc-raw.log -m "$MESSAGE [ci skip]"
    git push
else
  echo "nothing to do"
  exit 1
fi
