#!/bin/bash

DATE=2020-01-21

if [[ -f "$DATE/irc.log" && ! -f "$DATE/index.html" ]]; then  
    DIRECTORY=$DATE

    echo "Generating minutes for $DATE"
    # Generate minutes
    node scribe-tool/index.js -d $DIRECTORY -m -i
    MESSAGE="Add text minutes for $DATE telecon."

    git add $DIRECTORY/index.html index.html
    git commit $DIRECTORY/index.html index.html -m "$MESSAGE [ci skip]"
    git push origin master
else
    echo "nothing to do"
fi
