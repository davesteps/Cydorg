#!/bin/bash

sleep 10
rm /home/pi/Cydorg/temp.log

while true
do
	t=$(temper) 
	echo $t	>> /home/pi/Cydorg/temp.log
	echo $t > /home/pi/Cydorg/temp.current
	sleep 5
done
