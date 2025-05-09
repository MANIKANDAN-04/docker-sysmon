#!/bin/bash

# Docker Dangling Resources Report and Cleanup Script

echo "==============================="
echo "🧹 Docker Dangling Resources Report"
echo "Generated at: $(date)"
echo "==============================="

section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Check Docker CLI
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# Dangling Images
section "🖼️ Dangling Images (Unused, Untagged)"
dangling_images=$(docker images -f "dangling=true" -q)
if [ -n "$dangling_images" ]; then
  docker images -f "dangling=true"
else
  echo "✅ No dangling images found."
fi

# Unused Volumes
section "📦 Unused Volumes"
unused_volumes=$(docker volume ls -qf dangling=true)
if [ -n "$unused_volumes" ]; then
  docker volume ls -f dangling=true
else
  echo "✅ No unused volumes found."
fi

# Unused Networks
section "🌐 Unused Docker Networks"
# This excludes the default networks (bridge, host, none)
all_unused_networks=$(docker network ls -q | xargs -r docker network inspect -f '{{.Name}} {{.Containers}}' | grep '{}')
if [ -n "$all_unused_networks" ]; then
  echo "$all_unused_networks" | awk '{print "Unused network: " $1}'
else
  echo "✅ No unused networks found."
fi

echo
echo "✅ Docker dangling check complete."