#!/bin/bash

while true
do
	#gpspipe -w -n 10 |   grep -m 1 lon > /home/pi/Cydorg/gps.log
	temper > /home/pi/Cydorg/temp.log
	sleep 5
done
