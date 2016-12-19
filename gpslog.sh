#!/bin/bash

while true
do
	gpspipe -w -n 10 |   grep -m 1 lon | cat > /home/pi/Cydorg/gps.log
	sleep 5
done
