#!/bin/bash
set -euo pipefail

LOG_FILE="./security_audit.log"

echo "[$(date)] --- Starting Security Port Audit ---" | tee -a "$LOG_FILE"

# १. 'ss' कमांड वापरून लिसनिंग पोर्ट्स शोधणे (netstat ऐवजी 'ss' आधुनिक आहे)
echo "Scanning for listening ports (TCP/UDP)..." | tee -a "$LOG_FILE"

# आपण इथे फक्त महत्त्वाचे कॉलम्स (Netid, State, Local Address:Port, Process) घेणार आहोत
ss -tunlp | awk 'NR==1 || /LISTEN/ {print $1, $5, $7}' | column -t | tee -a "$LOG_FILE"

# २. उघड्या पोर्ट्सची एकूण संख्या मोजणे
OPEN_PORTS=$(ss -tunl | grep -c LISTEN)
echo "Total Listening Ports: $OPEN_PORTS" | tee -a "$LOG_FILE"

# ३. क्रिटिकल पोर्ट (उदा. 22, 80, 443) चेक करणे
for port in "22" "80" "443"; do
    if ss -tunl | grep -q ":$port "; then
        echo "✅ Port $port is open and monitored." | tee -a "$LOG_FILE"
    else
        echo "⚠️  Note: Port $port is not in use." | tee -a "$LOG_FILE"
    fi
done

echo "[$(date)] --- Audit Completed ---" | tee -a "$LOG_FILE"
