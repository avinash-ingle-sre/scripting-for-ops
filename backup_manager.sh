#!/bin/bash
set -euo pipefail

SOURCE_DIR="/home/ubuntu/my-first-repo"
BACKUP_DIR="/tmp/backups" # तू इथे पेनड्राईव्ह किंवा रिमोट सर्व्हरचा पाथ देऊ शकतोस
LOG_FILE="./backup.log"

mkdir -p "$BACKUP_DIR"

echo "[$(date)] --- Starting Backup ---" | tee -a "$LOG_FILE"

# rsync वापरून बॅकअप घेणे (फक्त बदललेल्या फाईल्स घेते)
rsync -avz --delete "$SOURCE_DIR" "$BACKUP_DIR" | tee -a "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] ✅ Backup successful!" | tee -a "$LOG_FILE"
else
    echo "[$(date)] ❌ Backup failed!" | tee -a "$LOG_FILE"
fi
