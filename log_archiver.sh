#!/bin/bash
set -euo pipefail

ARCHIVE_DIR="./archive"
LOG_FILE="./archiver.log"

# १. अर्काइव्ह फोल्डर नसेल तर बनवणे
mkdir -p "$ARCHIVE_DIR"

echo "[$(date)] --- Starting Log Archiving ---" | tee -a "$LOG_FILE"

# २. ३ दिवसांपेक्षा जुन्या .log फाईल्स अर्काइव्हला हलवणे
find . -name "*.log" -mtime +3 -exec mv {} "$ARCHIVE_DIR" \;

# ३. हलवलेल्या फाईल्स झिप (Compress) करणे जेणेकरून जागा वाचेल
if [ "$(ls -A $ARCHIVE_DIR)" ]; then
    tar -czf "$ARCHIVE_DIR/logs_$(date +%Y%m%d).tar.gz" "$ARCHIVE_DIR"/*.log
    rm "$ARCHIVE_DIR"/*.log
    echo "[$(date)] ✅ Logs archived and compressed successfully." | tee -a "$LOG_FILE"
else
    echo "[$(date)] No old logs found to archive." | tee -a "$LOG_FILE"
fi
