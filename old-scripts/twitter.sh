#!/bin/bash

TWEET=$1
USERNAME= put here
PASSWORD= here put

if [ -z "$1" ]; then
        echo No status update entered. Showing last twenty updates:
        curl --basic --silent --user $USERNAME:$PASSWORD --get http://twitter.com/statuses/friends_timeline.xml | sed --quiet --expression='s/<name>\(.*\)<\/name>/\1/p' --expression='s/<text>\(.*\)<\/text>/\1/p'
        exit
fi
 
curl -s -u $USERNAME:$PASSWORD http://twitter.com/statuses/update.xml -d status="$TWEET" > /dev/null
echo Status updated.

exit
