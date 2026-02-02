# LATEST 02-02-2026 


# 🚀 DevOps & SRE Automation Toolkit

A comprehensive collection of 15 automation scripts developed for system monitoring, cloud infrastructure management, and site reliability engineering (SRE).

## 🛠️ Toolkit Highlights

### 🟢 Easy Level (Foundational)
- **System Monitor:** Disk usage alerts and log cleanup.
- **RAM Monitor:** Real-time memory tracking using Python `psutil`.
- **Service Watchdog:** Self-healing script to auto-restart critical services.
- **Env Checker:** Validates required environment variables before deployment.
- **User Audit:** Security auditing of sudo users and active sessions.

### 🟡 Medium Level (Infrastructure)
- **Docker Janitor:** Automatic cleanup of dangling images and containers.
- **Log Analyzer:** Python-based parser for 404/500 errors in access logs.
- **Backup Manager:** Incremental backups using `rsync` with delta-transfer.
- **Log Archiver:** Compression and rotation of old log files.
- **API Health Checker:** Connectivity status monitor for multiple endpoints.

### 🔴 Hard Level (Advanced SRE)
- **K8s Pod Auditor:** Detection of CrashLoopBackOff and Pending pods.
- **SSL Expiry Checker:** Proactive monitoring of SSL certificate validity.
- **Config Validator:** YAML syntax and schema validation for IaC.
- **Security Auditor:** Automated port scanning and listening service audit.
- **Auto-Doctor:** One-click incident report generation for troubleshooting.

## 📈 Impact & Best Practices
- **Time Saved:** Automated daily redundant tasks saving ~5 hours/week.
- **Cost Optimization:** Reclaimed disk space and identified underutilized resources.
- **Reliability:** Implemented `set -euo pipefail` for robust error handling.







# Scripting for Ops 🚀
A collection of essential SRE and DevOps automation scripts designed for system monitoring, log analysis, and incident response.

## 🛠 Included Scripts

| Script | Purpose | Use Case |
| :--- | :--- | :--- |
| `system_monitor.sh` | General health check | Log start/end of maintenance tasks with timestamps. |
| `disk_check.sh` | Disk pressure alert | Monitor partition usage and alert if above 80%. |
| `pre-commit` | Git Guardrail | Automatically validates Shell/Python syntax before committing. |

## 🚀 Getting Started

### Prerequisites
- Ubuntu/Linux environment
- Git configured
- Python3 (for syntax validation)

### Installation
1. Clone the repo:
   ```bash
   git clone [https://github.com/avinash-ingle-sre/scripting-for-ops.git](https://github.com/avinash-ingle-sre/scripting-for-ops.git)


# My First Repository

<<<<<<< HEAD
Learning Git basics!

## Contributing
Feel free to contribute!
=======
This repository contains:

## Files
- calculator.py - A simple Python calculator
- app.py - Flask application (from previous labs)

## Usage
Run: python3 calculator.py

## Features
- Addition
- Subtraction
- Multiplication
- Division with zero-check
>>>>>>> origin/feature/docs
