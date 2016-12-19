#!/bin/bash
gpspipe -w -n 10 |   grep -m 1 lon > gps.log
