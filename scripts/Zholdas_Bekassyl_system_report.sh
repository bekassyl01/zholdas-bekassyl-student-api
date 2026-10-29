#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$SCRIPT_DIR/../logs/Zholdas_Bekassyl_system_report.log"
{
echo "===== SYSTEM REPORT ====="
echo "Student: Zholdas Bekassyl"
echo "Date: $(date)"
echo "User: $(whoami)"
echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Kernel: $(uname -r)"
echo "--- CPU ---"
lscpu | grep -E "Model name|^CPU\(s\)"
echo "--- Memory ---"
free -h
echo "--- Disk usage ---"
df -h
echo "--- Available space on / ---"
df -h / | awk 'NR==2 {print $4}'
echo
} | tee -a "$LOG"
