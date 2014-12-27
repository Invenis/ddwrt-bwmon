#!/bin/sh
MAP_FILE=/opt/bwmon/www/mac-names.js
STATIC_FILE=/opt/bwmon/static-leasses

echo "var MAC_NAMES = {" > $MAP_FILE

if [ -e $STATIC_FILE ]
then
	while read line           
	do
		echo "$line," >> $MAP_FILE           
	done <$STATIC_FILE
fi

awk '{printf "\x27%s\x27: \x27%s\x27,\n", $2, $4}' /tmp/dnsmasq.leases >> $MAP_FILE
echo "};" >> $MAP_FILE