#!/bin/bash

# Docker Cleanup Report Script
# Requires: Docker CLI

echo "==============================="
echo "🚀 Docker Cleanup Report"
echo "==============================="
echo

# Function to section output
section() {
  echo
  echo "--------------------------------------------------"
  echo "🧹 $1"
  echo "--------------------------------------------------"
}

# Report current usage
section "Docker System Disk Usage"
docker system df

# List stopped containers
section "Stopped Containers"
docker ps -a -f "status=exited" --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"

# List dangling images
section "Dangling Images"
docker images -f "dangling=true"

# List unused volumes
section "Unused Volumes"
docker volume ls -f "dangling=true"

# List unused networks
section "Unused Docker Networks"
all_networks=$(docker network ls --filter type=custom -q)
used_networks=$(docker ps -aq | xargs -r docker inspect --format '{{range .NetworkSettings.Networks}}{{.NetworkID}}{{"\n"}}{{end}}' | sort | uniq)

echo "Networks not attached to any container:"
for net in $all_networks; do
    if ! echo "$used_networks" | grep -q "$net"; then
        docker network inspect --format '{{.Name}} (ID: {{.Id}})' "$net"
    fi
done


echo
echo "📝 Report completed at $(date)"
echo "==============================="
echo "🚀 Thank you for using the Docker Cleanup Report script!"