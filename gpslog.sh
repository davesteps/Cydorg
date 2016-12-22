#!/bin/bash

sleep 10
rm /home/pi/Cydorg/gps.log

while true
do
  gpsdata=$( gpspipe -w -n 10 | grep -m 1 lon )
  time=$(echo "$gpsdata" | jq -r '.time')
  lat=$(echo "$gpsdata" | jq -r '.lat')
  lon=$(echo "$gpsdata" | jq -r '.lon')
  alt=$(echo "$gpsdata" | jq -r '.alt')
  speed=$(echo "$gpsdata" | jq -r '.speed')
  echo "$time,$lat,$lon,$alt,$speed" >> /home/pi/Cydorg/gps.log
  echo "$time,$lat,$lon,$alt,$speed" > /home/pi/Cydorg/gps.current
	sleep 3
done
