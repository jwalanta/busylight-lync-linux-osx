#!/bin/bash

LYNC_STATUS_FILE='/tmp/jshrestha-lync-status.txt'

cd /home/jshrestha/busylight

# unbind usb device (just in case)
./unbind.sh

# update led for a minute in 5 sec interval
# (busylight automatically turns off after 30 secs)
for i in {1..12}
do
	python busylight.py "`cat $LYNC_STATUS_FILE`"
	sleep 5
done

# delete status file if it hasn't been updated for more than 2 minutes
find /tmp -name jshrestha-lync-status.txt -type f -mmin +2 -delete
