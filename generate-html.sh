#!/bin/bash

echo $DATE
if [[ -f "$DATE/irc.log" && ! -f "$DATE/index.html" ]]; then  
    DIRECTORY=$DATE

    echo "Generating minutes for $DATE"
    # Generate minutes
    EMAIL_BODY=$(node scribe-tool/index.js -d $DIRECTORY -m -i -q)
    git add index.html $DIRECTORY/index.html

    echo $EMAIL_BODY

else
    echo "nothing to do"
    exit 1
fi
