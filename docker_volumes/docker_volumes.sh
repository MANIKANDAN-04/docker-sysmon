#!/bin/bash

# Docker Volumes Inspection Script

echo "==============================="
echo "🗃️ Docker Volumes Report"
echo "Generated at: $(date)"
echo "==============================="

section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Check if Docker is available
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# Ensure jq is available
if ! command -v jq &> /dev/null; then
  echo "❌ 'jq' is required for JSON parsing. Please install it."
  exit 1
fi

# Variables for summary
total_volumes=0
dangling_count=0
used_count=0
total_size_bytes=0

# List all Docker volumes
section "📋 List of All Docker Volumes"
volumes=$(docker volume ls -q)
total_volumes=$(echo "$volumes" | wc -l)
echo "$volumes"

# Detailed info per volume
section "🔍 Detailed Volume Information"
if [ -z "$volumes" ]; then
  echo "No volumes found."
else
  for vol in $volumes; do
    echo "Volume: $vol"
    docker volume inspect "$vol" | jq -r '.[0] | "  Driver: \(.Driver)\n  Mountpoint: \(.Mountpoint)\n  Created At: \(.CreatedAt)"'
    
    mountpoint=$(docker volume inspect -f '{{.Mountpoint}}' "$vol")
    if [ -d "$mountpoint" ]; then
      size=$(du -sb "$mountpoint" 2>/dev/null | cut -f1)
      size_human=$(du -sh "$mountpoint" 2>/dev/null | cut -f1)
      echo "  Size: $size_human"
      total_size_bytes=$((total_size_bytes + size))
    else
      echo "  Size: Not accessible"
    fi

    echo
  done
fi

# Containers using volumes
section "🔗 Containers Using Volumes"
for vol in $volumes; do
  used_by=$(docker ps -a --filter volume="$vol" --format '{{.Names}}')
  echo "Volume: $vol"
  if [ -n "$used_by" ]; then
    echo "$used_by" | sed 's/^/  - /'
    used_count=$((used_count + 1))
  else
    echo "  (No containers currently using this volume)"
  fi
  echo
done

# Dangling (unused) volumes
section "🗑️ Unused (Dangling) Volumes"
dangling=$(docker volume ls -qf dangling=true)
if [ -z "$dangling" ]; then
  echo "No dangling volumes found."
else
  echo "$dangling"
  dangling_count=$(echo "$dangling" | wc -l)
fi

# Total volume usage
section "💾 Total Volume Disk Usage"
printf "Approximate total: %.2f MB\n" "$(echo "$total_size_bytes / 1024 / 1024" | bc -l)"

# Final Summary
section "📊 Volume Summary"
echo "Total Volumes:        $total_volumes"
echo "Used by Containers:   $used_count"
echo "Dangling Volumes:     $dangling_count"
printf "Total Disk Usage:     %.2f MB\n" "$(echo "$total_size_bytes / 1024 / 1024" | bc -l)"

echo
echo "✅ Docker volumes report complete."
