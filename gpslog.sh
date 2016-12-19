#!/bin/bash
gpspipe -w -n 10 |   grep -m 1 lon | cat >> gps.log