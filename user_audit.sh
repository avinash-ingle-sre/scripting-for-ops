#!/bin/bash
set -euo pipefail

LOG_FILE="./user_audit.log"

echo "[$(date)] --- Starting User Audit ---" | tee -a "$LOG_FILE"

# १. किती युजर्स लॉगिन आहेत?
echo "Active users: $(who | wc -l)" | tee -a "$LOG_FILE"

# २. 'sudo' ग्रुपमध्ये कोण कोण आहे?
echo "Users with Sudo access:" | tee -a "$LOG_FILE"
grep '^sudo:.*$' /etc/group | cut -d: -f4 | tee -a "$LOG_FILE"

echo "[$(date)] Audit Completed." | tee -a "$LOG_FILE"
