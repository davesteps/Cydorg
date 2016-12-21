#!/bin/bash

rm /home/pi/Cydorg/gps.log

while true
do
	g=$(gpspipe -w -n 10 |   grep -m 1 lon)
	echo $g >> /home/pi/Cydorg/gps.log
	echo $g > /home/pi/Cydorg/gps.current
	sleep 3
done
