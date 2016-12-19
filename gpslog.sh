#!/bin/bash
gpsdata=$( gpspipe -w -n 10 |   grep -m 1 lon )
echo "$gpsdata"

