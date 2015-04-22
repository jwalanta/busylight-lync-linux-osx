#!/bin/bash

# get lync status every five seconds and send it to jshrestha.tinyprints.com
# this will be run using cron every minute

OLDSTATUS=''
NEWSTATUS=''

# running 12 times to spread over a minute
for i in {1..12}
do

	NEWSTATUS=`osascript /Users/jshrestha/bin/lyncstatus.scpt`

	if [ "$OLDSTATUS" != "$NEWSTATUS" ]
	then
		echo "Sending new status: " $NEWSTATUS
		ssh jshrestha.tinyprints.com "echo $NEWSTATUS > /tmp/jshrestha-lync-status.txt"
	fi

	OLDSTATUS="$NEWSTATUS"
	
	sleep 5

done

