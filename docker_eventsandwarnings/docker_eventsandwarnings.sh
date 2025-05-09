#!/bin/bash

# Docker Events and Warnings Reporter

echo "==============================="
echo "🚨 Docker Events & Warnings"
echo "Generated at: $(date)"
echo "==============================="

# Helper
section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Default timeframe: last 1 hour
TIME_RANGE="${1:-1h}"

# Ensure Docker is installed
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# Docker Events: container-level
section "📦 Recent Docker Container Events (Last $TIME_RANGE)"
docker events --since "$TIME_RANGE" --until "$(date --iso-8601=seconds)" \
  --filter type=container \
  --filter event=start \
  --filter event=stop \
  --filter event=die \
  --filter event=kill \
  --filter event=oom \
  --filter event=health_status \
  2>/dev/null | tail -n 100

# Docker Warnings: Try to capture daemon warnings if journalctl available
if command -v journalctl &> /dev/null; then
  section "⚠️ Docker Daemon Warnings from system logs"
  journalctl -u docker --since="${TIME_RANGE} ago" | grep -i -E "warn|error|fail" | tail -n 50
else
  section "⚠️ Docker Daemon Warnings"
  echo "System does not support journalctl. Skipping daemon log warnings."
fi

echo
echo "✅ Docker events and warnings reporting complete."
