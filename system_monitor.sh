#!/bin/bash
set -euo pipefail

# १. कॉन्फिगरेशन (Variables)
LOG_FILE="./ops.log"  # /var/log ऐवजी लोकल फाईल वापरली आहे जेणेकरून sudo लागणार नाही
THRESHOLD=80          # ८०% च्या वर डिस्क गेली की अलर्ट

echo "[$(date)] --- Starting System Audit ---" | tee -a "$LOG_FILE"

# २. डिस्क युसेज चेक (Disk Usage Logic)
echo "[$(date)] Checking Disk Usage..." | tee -a "$LOG_FILE"
CURRENT_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "[$(date)] ALERT: Disk space is CRITICAL at ${CURRENT_USAGE}%" | tee -a "$LOG_FILE"
    # इथे भविष्यात तू 'curl' वापरून Slack वर मॅसेज पाठवू शकतोस
else
    echo "[$(date)] Disk space is OK at ${CURRENT_USAGE}%" | tee -a "$LOG_FILE"
fi

# ३. लॉग रोटेशन/क्लीनअप (Cleanup Logic)
echo "[$(date)] Cleaning up temporary files and old logs..." | tee -a "$LOG_FILE"
# ७ दिवसांपेक्षा जुन्या .log फाईल्स शोधून डिलीट करणे (फक्त या डिरेक्टरीतील)
find . -name "*.log" -type f -mtime +7 -exec rm -f {} \;
echo "[$(date)] Old logs cleaned successfully." | tee -a "$LOG_FILE"

echo "[$(date)] --- Task completed successfully ---" | tee -a "$LOG_FILE"1~
