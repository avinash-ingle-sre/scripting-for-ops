#!/bin/bash
set -euo pipefail

REPORT_FILE="./incident_report_$(date +%Y%m%d_%H%M%S).txt"

echo "--- AUTOMATED INCIDENT REPORT ---" > "$REPORT_FILE"
echo "Generated at: $(date)" >> "$REPORT_FILE"
echo "---------------------------------" >> "$REPORT_FILE"

# १. सिस्टम रिसोर्सेस
echo "[System Stats]" >> "$REPORT_FILE"
uptime >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"
df -h / >> "$REPORT_FILE"

# २. नेटवर्क चेक
echo -e "\n[Network Stats]" >> "$REPORT_FILE"
ss -tunl | grep LISTEN >> "$REPORT_FILE"

# ३. शेवटचे ५ गंभीर एरर्स (logs मधून)
echo -e "\n[Recent Critical Errors]" >> "$REPORT_FILE"
tail -n 20 ops.log | grep -iE "error|alert|critical|fail" >> "$REPORT_FILE" || echo "No errors found." >> "$REPORT_FILE"

echo "✅ Report generated: $REPORT_FILE"
