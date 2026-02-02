#!/bin/bash
set -euo pipefail

LOG_FILE="./janitor.log"
CPU_THRESHOLD=80

echo "[$(date)] --- Starting Janitor Services ---" | tee -a "$LOG_FILE"

# १. हाय CPU प्रोसेसेस शोधणे
echo "Checking for high CPU processes (Above $CPU_THRESHOLD%)..." | tee -a "$LOG_FILE"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | awk -v threshold="$CPU_THRESHOLD" '$4 > threshold {print "Alert: PID " $1 " is using " $4 "% CPU"}' | tee -a "$LOG_FILE"

# २. /tmp मधील ७ दिवसांपेक्षा जुन्या फाईल्स साफ करणे
echo "Cleaning up /tmp directory..." | tee -a "$LOG_FILE"
find /tmp -type f -mtime +7 -delete

echo "[$(date)] --- Janitor Cleanup Completed ---" | tee -a "$LOG_FILE"
