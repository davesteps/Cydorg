#!/bin/bash
gpsdata=$( gpspipe -w -n 10 |   grep -m 1 lon )
lat=$( echo "$gpsdata"  | jsawk 'return this.lat' )
lon=$( echo "$gpsdata"  | jsawk 'return this.lon' )
echo "You are here: $lat, $lon - https://maps.google.com/maps?q=$lat,+$lon"