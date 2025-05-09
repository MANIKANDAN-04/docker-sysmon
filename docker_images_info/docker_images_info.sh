#!/bin/bash

# Docker Images Information Script

echo "==============================="
echo "🖼️ Docker Images Info"
echo "Generated at: $(date)"
echo "==============================="

section() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Check Docker installation
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed or not in PATH."
  exit 1
fi

# Summary
section "📊 Docker Image Summary"
total=$(docker images -q | wc -l)
dangling=$(docker images -f "dangling=true" -q | wc -l)
unique_repos=$(docker images --format '{{.Repository}}' | sort | uniq | wc -l)

echo "Total images:        $total"
echo "Dangling images:     $dangling"
echo "Unique repositories: $unique_repos"

# Full image listing
section "🧾 All Docker Images"
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}" | sort

# Dangling images (not tagged and not referenced by containers)
section "🗑️ Dangling Images (Unused Layers)"
dangling_images=$(docker images -f "dangling=true" -q)
if [ -n "$dangling_images" ]; then
  docker images -f "dangling=true" --format "table {{.ID}}\t{{.CreatedSince}}\t{{.Size}}"
else
  echo "No dangling images found."
fi

# Unused images (not associated with any container)
section "📦 Unused Images (Not in Use by Any Container)"
unused_images=$(docker image ls --filter "dangling=false" -q | while read -r img; do
  in_use=$(docker ps -a --filter "ancestor=$img" -q)
  if [ -z "$in_use" ]; then
    echo "$img"
  fi
done)

if [ -n "$unused_images" ]; then
  for id in $unused_images; do
    docker image inspect "$id" --format "{{.RepoTags}} - Created: {{.Created}} - Size: {{.Size}}" | sed 's/\[//;s/\]//'
  done
else
  echo "No unused images found."
fi

# Optional: Largest images
section "🐘 Largest Docker Images"
docker images --format '{{.Repository}}:{{.Tag}} {{.Size}}' | sort -hr -k2 | head -n 10

echo
echo "✅ Docker image information collection complete."
