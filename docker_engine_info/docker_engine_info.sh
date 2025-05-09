#!/bin/bash

# Docker Engine Info Script

echo "==============================="
echo "⚙️ Docker Engine Info"
echo "Generated at: $(date)"
echo "==============================="

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

# Version Info
section "🔧 Docker Version"
docker version

# Engine/System Info
section "🖥️ Docker System Info"
docker info

# Disk Usage
section "💾 Docker Disk Usage Overview"
docker system df

echo
echo "✅ Docker engine info script complete."
