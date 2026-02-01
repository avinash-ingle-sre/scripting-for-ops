#!/bin/bash
# SRE Script: Disk Usage Monitor
THRESHOLD=80

echo "Scanning partitions for usage above ${THRESHOLD}%..."

df -h | awk -v limit="$THRESHOLD" 'NR > 1 { 
    usage=$5; 
    gsub("%","",usage); 
    if(usage > limit) {
        print "CRITICAL: Partition " $1 " is at " $5
    } 
}'
