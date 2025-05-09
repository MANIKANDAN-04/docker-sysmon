#!/bin/bash

# Docker Security Checks Script

echo "==============================="
echo "🔐 Docker Security Checks"
echo "Generated at: $(date)"
echo "==============================="

section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Check Docker availability
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# Check Docker socket permissions
section "🔒 Docker Socket Permissions"
ls -l /var/run/docker.sock

# Check if Docker daemon is running as root
section "👑 Docker Daemon User"
ps -ef | grep dockerd | grep -v grep

# List containers with privileged access
section "⚠️ Privileged Containers"
docker ps --format '{{.ID}} {{.Names}}' | while read -r id name; do
  if docker inspect "$id" | grep -q '"Privileged": true'; then
    echo "Container $name ($id) is running in PRIVILEGED mode!"
  fi
done

# Containers running as root user
section "👤 Containers Running as Root"
docker ps -q | while read -r cid; do
  user=$(docker inspect --format '{{.Config.User}}' "$cid")
  if [ -z "$user" ] || [ "$user" = "0" ] || [ "$user" = "root" ]; then
    echo "Container $(docker inspect --format '{{.Name}}' "$cid") is running as root!"
  fi
done

# Containers with extra capabilities
section "🔧 Extra Linux Capabilities (if any)"
docker ps -q | while read -r cid; do
  caps=$(docker inspect --format '{{json .HostConfig.CapAdd}}' "$cid")
  if [ "$caps" != "null" ]; then
    echo "Container $(docker inspect --format '{{.Name}}' "$cid") has extra capabilities: $caps"
  fi
done

# AppArmor / SELinux profile check
section "🛡️ AppArmor / SELinux Profile Usage"
docker ps -q | while read -r cid; do
  profile=$(docker inspect --format '{{.AppArmorProfile}}' "$cid")
  echo "Container $(docker inspect --format '{{.Name}}' "$cid") uses AppArmor profile: $profile"
done

# Exposed ports
section "🌐 Exposed Ports"
docker ps --format "table {{.Names}}\t{{.Ports}}"

# Daemon TLS settings (if applicable)
section "🔐 Docker Daemon TLS Settings"
if ps aux | grep dockerd | grep -q '\--tlsverify'; then
  echo "✅ Docker daemon TLS is ENABLED (using --tlsverify)"
else
  echo "❌ Docker daemon TLS is NOT enabled"
fi

echo
echo "✅ Docker security audit complete."
