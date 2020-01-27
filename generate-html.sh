#!/bin/bash

DATE=2020-01-21
DIRECTORY=../$DATE

echo "Generating minutes for $DATE"
# Generate minutes
$NODE_COMMAND scribe-tool/index.js -d $DIRECTORY -m -i

MESSAGE="Add text minutes for $DATE telecon."

git add $DIRECTORY/index.html
git commit $DIRECTORY/index.html index.html -m "$MESSAGE"
git push

