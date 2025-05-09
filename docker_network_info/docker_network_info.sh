#!/bin/bash

# Docker Network Information Script

echo "==============================="
echo "🌐 Docker Network Info"
echo "Generated at: $(date)"
echo "==============================="

section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Ensure Docker is installed
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# List all networks
section "📋 All Docker Networks"
docker network ls --format "table {{.ID}}\t{{.Name}}\t{{.Driver}}\t{{.Scope}}" | sort

# Default vs Custom networks
section "🔧 Network Classification"
echo "Default networks:"
docker network ls --filter name=bridge --filter name=host --filter name=none

echo
echo "Custom user-defined networks:"
docker network ls | grep -vE 'bridge|host|none' | grep -v "NETWORK ID"

# Unused (dangling) networks
section "🗑️ Unused (Dangling) Networks"
dangling=$(docker network ls -f "dangling=true" -q)
if [ -n "$dangling" ]; then
  docker network ls -f "dangling=true"
else
  echo "No unused (dangling) networks found."
fi

# Containers attached to each network
section "🔌 Connected Containers per Network"
for net in $(docker network ls --format '{{.Name}}'); do
  echo "Network: $net"
  docker network inspect "$net" --format='{{range .Containers}}{{.Name}}{{"\n"}}{{end}}' | sed 's/^/  - /' || echo "  (No containers)"
  echo
done

# Network gateway/subnet details
section "🧭 Network Subnet & Gateway Info"
for net in $(docker network ls --format '{{.Name}}'); do
  echo "Network: $net"
  docker network inspect "$net" --format='  Subnet: {{range .IPAM.Config}}{{.Subnet}}{{end}}, Gateway: {{range .IPAM.Config}}{{.Gateway}}{{end}}'
done

echo
echo "✅ Docker network inspection complete."
