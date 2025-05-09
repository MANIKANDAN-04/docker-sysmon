#!/bin/bash

# Docker Container Logs Collector
# Collects logs from all running containers

echo "==============================="
echo "📋 Docker Container Logs Report"
echo "Generated at: $(date)"
echo "==============================="

# Function for formatting
section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Get list of running containers
containers=$(docker ps -q)

if [ -z "$containers" ]; then
  section "❌ No running containers found."
  exit 0
fi

for container in $containers; do
  name=$(docker inspect --format='{{.Name}}' "$container" | sed 's/^\/\(.*\)/\1/')
  section "🔸 Logs for container: $name ($container)"
  docker logs --tail 50 "$container" 2>&1
done

echo
echo "✅ Log collection complete."
