# 📦 Docker Container Monitoring

Managing Docker containers in production environments requires visibility into each container's resource usage, configuration, and runtime state. This script helps DevOps engineers and system administrators **audit active Docker containers** and view their detailed runtime status — all in one go.

---

## 📌 What Is This Script?

`docker_container_monitoring.sh` is a diagnostic tool that generates a **comprehensive snapshot of all running Docker containers**, including:

- Metadata (name, ID, image, uptime, status)
- Network info and port mappings
- Mount points and attached volumes
- Live CPU and memory usage stats

It’s useful for health checks, debugging, audits, or resource planning.

---

## 🎯 Why Monitor Running Containers?

Monitoring running containers helps:

- Troubleshoot slow or unresponsive containers  
- Detect misconfigured volumes or port bindings  
- Measure real-time resource usage across services  
- Validate running containers post-deployment  

---

## 🔍 What This Script Reports

| Category               | Details                                                             |
|------------------------|---------------------------------------------------------------------|
| Basic Info             | Container name, ID, image used, status, uptime, restarts            |
| Port Mappings          | Published container ports and host bindings                         |
| Mounts                 | Attached volumes or bind mounts                                     |
| Network Settings       | Network names and container IP addresses                            |
| Resource Snapshot      | CPU usage, memory usage, network I/O, block I/O, and PID count       |

---

## 🧠 How It Works

- Collects a list of running containers via `docker ps -q`
- Uses `docker inspect` for metadata and configuration details
- Gathers live stats with `docker stats --no-stream` for each container
- Groups each container's data under a labeled section for readability

---

## 📈 Why It’s Useful

- Offers **real-time visibility** into container performance  
- Ensures containers are running with **expected configurations**  
- Supports audits, **incident response**, and operational troubleshooting  
- No external dependencies — just the Docker CLI  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_container_monitoring.sh
```

### 2. Run the script:

```bash
./docker_container_monitoring.sh
```

> Requires Docker CLI access and appropriate user permissions. Works best with `sudo` if needed.

---

## 📄 Notes

- Script checks only **running** containers. For stopped containers, use inspection commands separately.
- `docker stats` provides a moment-in-time snapshot (not continuous monitoring).

---

## 📸 Sample Image
