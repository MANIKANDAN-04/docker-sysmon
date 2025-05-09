#!/bin/bash

# Docker Container Full Info Reporter

echo "==============================="
echo "📦 Docker Container Full Info"
echo "Generated at: $(date)"
echo "==============================="

containers=$(docker ps -q)

if [ -z "$containers" ]; then
  echo "❌ No running containers found."
  exit 0
fi

for container in $containers; do
  name=$(docker inspect --format='{{.Name}}' "$container" | sed 's/^\/\(.*\)/\1/')
  echo
  echo "--------------------------------------------------"
  echo "🔹 Container: $name ($container)"
  echo "--------------------------------------------------"

  # Basic Info
  echo "📛 Name: $name"
  echo "🔹 ID: $container"
  echo "🖼️  Image: $(docker inspect --format='{{.Config.Image}}' "$container")"
  echo "📅 Created: $(docker inspect --format='{{.Created}}' "$container")"
  echo "⏱️  Uptime: $(docker inspect --format='{{.State.StartedAt}}' "$container")"
  echo "⚙️  Status: $(docker inspect --format='{{.State.Status}}' "$container")"
  echo "🔁 Restart Count: $(docker inspect --format='{{.RestartCount}}' "$container")"

  # Ports
  echo "🌐 Port Mappings:"
  docker port "$container"

  # Mounts
  echo "📂 Mounts/Volumes:"
  docker inspect --format='{{range .Mounts}}{{.Source}} => {{.Destination}}{{"\n"}}{{end}}' "$container"

  # Network Settings
  echo "🌍 Networks:"
  docker inspect --format='{{range $k,$v := .NetworkSettings.Networks}}{{$k}} => IP: {{$v.IPAddress}}{{"\n"}}{{end}}' "$container"

  # Resource Usage (CPU, Mem, etc.)
  echo "📊 Resource Usage (1s snapshot):"
  docker stats "$container" --no-stream --format "   CPU: {{.CPUPerc}} | MEM: {{.MemUsage}} | NET: {{.NetIO}} | BLOCK: {{.BlockIO}} | PIDs: {{.PIDs}}"

done

echo
echo "✅ Container info collection complete."
