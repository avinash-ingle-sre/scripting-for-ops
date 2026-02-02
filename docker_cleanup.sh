#!/bin/bash
set -euo pipefail

LOG_FILE="./docker_cleanup.log"

echo "[$(date)] --- Starting Docker Cleanup ---" | tee -a "$LOG_FILE"

# १. क्लीनअप पूर्वीची डिस्क स्पेस पाहणे
echo "Disk space before cleanup:" >> "$LOG_FILE"
docker system df >> "$LOG_FILE"

# २. अन-यूज्ड इमेजेस, कंटेनर्स आणि नेटवर्क्स डिलीट करणे
echo "Pruning unused docker resources..." | tee -a "$LOG_FILE"
docker system prune -f

# ३. किती कचरा साफ झाला ते पाहणे
echo "Disk space after cleanup:" >> "$LOG_FILE"
docker system df >> "$LOG_FILE"

echo "[$(date)] Docker Cleanup Completed." | tee -a "$LOG_FILE"
