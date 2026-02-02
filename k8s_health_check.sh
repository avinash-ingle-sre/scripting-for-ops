#!/bin/bash
set -euo pipefail

LOG_FILE="./k8s_audit.log"

echo "[$(date)] --- Starting K8s Pod Health Audit ---" | tee -a "$LOG_FILE"

# १. आपण इथे 'kubectl' कमांडचा रिझल्ट 'Mock' करत आहोत (कारण सध्या क्लस्टर नसेल)
# जर खरोखरचा K8s असेल तर: pods_output=$(kubectl get pods)
# आपण डमी डेटा वापरूया:
pods_output="
NAME                     READY   STATUS             RESTARTS   AGE
pune-api-7f8d6           1/1     Running            0          10d
pune-db-v1               1/1     Running            2          30d
payment-gateway-xyz      0/1     CrashLoopBackOff   15         5m
frontend-service-abc     0/1     Pending            0          2m
"

echo "Analyzing Pod Status..." | tee -a "$LOG_FILE"

# २. लॉजिक: जे पॉड्स 'Running' नाहीत त्यांना शोधणे
echo "$pods_output" | awk '$3 != "STATUS" && $3 != "Running" {print "🚨 ALERT: Pod " $1 " is in " $3 " state!"}' | tee -a "$LOG_FILE"

# ३. क्रिटिकल अलर्ट
UNHEALTHY_COUNT=$(echo "$pods_output" | grep -v "Running" | grep -v "STATUS" | wc -l)

if [ "$UNHEALTHY_COUNT" -gt 0 ]; then
    echo "[$(date)] Found $UNHEALTHY_COUNT unhealthy pods. Immediate action required!" | tee -a "$LOG_FILE"
else
    echo "[$(date)] All pods are healthy." | tee -a "$LOG_FILE"
fi
