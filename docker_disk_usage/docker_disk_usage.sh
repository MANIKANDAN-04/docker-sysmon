#!/bin/bash

# Docker Disk Usage Reporter

echo "==============================="
echo "💽 Docker Disk Usage Report"
echo "Generated at: $(date)"
echo "==============================="

section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Ensure Docker is available
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# Full system summary
section "📊 Overall Docker System Disk Usage"
docker system df

# Images
section "🖼️ Docker Images Disk Usage"
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}"

# Containers
section "📦 Docker Containers Disk Usage"
docker ps -a --size --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Size}}"

# Volumes
section "🗂️ Docker Volumes Disk Usage"
volume_list=$(docker volume ls -q)
if [ -n "$volume_list" ]; then
  for volume in $volume_list; do
    mountpoint=$(docker volume inspect "$volume" -f '{{.Mountpoint}}')
    usage=$(du -sh "$mountpoint" 2>/dev/null | awk '{print $1}')
    echo "$volume: ${usage:-N/A}"
  done
else
  echo "No volumes found."
fi

echo
echo "✅ Docker disk usage reporting complete."
