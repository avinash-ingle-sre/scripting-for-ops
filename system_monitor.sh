#!/bin/bash
set -euo pipefail  # Exit on error, undefined vars, or pipe failures
LOG_FILE="/var/log/ops.log"
echo "[$(date)] Starting task..." | tee -a "$LOG_FILE"
# Your logic here (e.g., system check or cleanup)
echo "[$(date)] Task completed successfully."
