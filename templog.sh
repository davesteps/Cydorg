#!/bin/bash

sleep 10
rm /home/pi/mydogbytes/temp.log

while true
do
	t=$(temper) 
	echo $t	>> /home/pi/mydogbytes/temp.log
	echo $t > /home/pi/mydogbytes/temp.current
	sleep 5
done
