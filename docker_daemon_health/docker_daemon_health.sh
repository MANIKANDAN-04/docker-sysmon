#!/bin/bash

# Docker Daemon Health Check Script

echo "==============================="
echo "🩺 Docker Daemon Health Report"
echo "Generated at: $(date)"
echo "==============================="

# Helper section header
section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# Check Docker daemon/service
section "📡 Docker Daemon Service Status"
if systemctl is-active --quiet docker; then
  echo "✅ Docker service is active and running."
else
  echo "❌ Docker service is NOT running!"
  systemctl status docker --no-pager
fi

# Version Info
section "🔧 Docker Version"
docker version

# System Info
section "🖥️ Docker System Info"
docker info

# Disk Usage
section "💾 Docker Disk Usage"
docker system df

# Connectivity Test
section "🌐 Docker Daemon Connectivity Test"
if docker info &> /dev/null; then
  echo "✅ Docker CLI can communicate with the Docker daemon."
else
  echo "❌ Docker CLI CANNOT communicate with the Docker daemon."
fi

# Container Summary
section "📦 Container Summary"
echo "Running:   $(docker ps -q | wc -l)"
echo "Stopped:   $(docker ps -a -q -f status=exited | wc -l)"
echo "Total:     $(docker ps -a -q | wc -l)"

# Optional: Recent Docker Errors (last 1 hour)
section "🚨 Recent Docker Events (Last 1 Hour)"
docker events --since 1h --until "$(date --iso-8601=seconds)" --filter type=container --filter event=die --filter event=oom 2>/dev/null | tail -n 20

echo
echo "✅ Docker daemon health check complete."
