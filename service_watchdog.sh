#!/bin/bash
set -euo pipefail

SERVICE="ssh" # तू इथे nginx किंवा docker असे बदलू शकतोस
LOG_FILE="./service_status.log"

if systemctl is-active --quiet "$SERVICE"; then
    echo "[$(date)] ✅ $SERVICE is running." >> "$LOG_FILE"
else
    echo "[$(date)] ⚠️ $SERVICE is DOWN! Restarting..." >> "$LOG_FILE"
    sudo systemctl restart "$SERVICE"
fi
