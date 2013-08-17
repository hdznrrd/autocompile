#!/bin/sh


PID=0

MONITOR="(cpp|h|Makefile|vert|frag)"
MONITOR_EXCLUDE="swp"
APPLICATION=./ogl


while [ 1 ]; do
	sleep 1
	COMPILE=0
	if [ ! -e "$APPLICATION" ]; then
		COMPILE=1
		echo "+++ no application yet"
	else
		COMPILE=$(find . -newer $APPLICATION |egrep -i "$MONITOR" |egrep -v "$MONITOR_EXCLUDE"| wc -l)
		echo "+++ found $COMPILE modified files!"
	fi
	
	if [ $COMPILE != "0" ]; then
		echo -e "Building... "
		make clean >/dev/null
		make all >/dev/null
		
		if [ $? = 0 ]; then
			echo "successful."
			if [ $PID != 0 ]; then
				kill -9 $PID
			fi

			$APPLICATION &
			PID=$!
		else
			echo "failed."
		fi
	fi
done
