# 🩺 Docker Daemon Health Check

Ensuring the **Docker daemon** is healthy and responsive is essential for running containerized applications. This script performs a full diagnostic of your Docker environment — from service status to resource usage and connectivity.

It's a handy tool for sysadmins and DevOps engineers to troubleshoot or audit Docker setups across development, staging, or production environments.

---

## 📌 What Is This Script?

`docker_daemon_health.sh` is a Bash-based diagnostic utility that:

- Verifies if the Docker service is installed and active  
- Checks Docker CLI–daemon communication  
- Displays system-wide Docker info and version  
- Summarizes container state counts  
- Shows disk usage from Docker artifacts  
- Lists recent critical Docker events (e.g., container crashes)

---

## 🎯 Why Monitor Docker Daemon Health?

- Detect Docker startup or configuration issues  
- Validate Docker CLI–daemon connectivity  
- Get insight into system-wide container state  
- Quickly view recent critical events for debugging  
- Ensure containerized environments are stable and responsive  

---

## 🔍 What This Script Checks

| Section                     | Description                                                   |
|-----------------------------|---------------------------------------------------------------|
| Docker Service Status       | Confirms if the Docker daemon is running via `systemctl`      |
| Docker Version              | Shows client and server version info                          |
| Docker Info                 | Displays detailed system and daemon configuration             |
| Disk Usage                  | Lists Docker's current storage usage                          |
| Connectivity                | Verifies Docker CLI–daemon communication                     |
| Container Summary           | Counts running, stopped, and total containers                 |
| Recent Docker Events        | Displays container crashes (`die`, `oom`) from last hour      |

---

## 🧠 How It Works

- Uses standard Docker CLI commands (`docker info`, `docker system df`, etc.)
- Includes systemd checks with `systemctl` for service status
- Summarizes container state counts via filters
- Optionally shows recent crash logs using `docker events`

---

## 📈 Why It’s Useful

- Ideal for **automated health checks** or post-incident reviews  
- Saves time when validating Docker configuration  
- Provides a **single, readable snapshot** of the Docker environment  
- Helps troubleshoot issues with disk usage, container crashes, or daemon errors  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_daemon_health.sh
```

### 2. Run the script:

```bash
./docker_daemon_health.sh
```

> Use `sudo` if your user lacks Docker group access or systemd privileges.

---

## 📄 Notes

- Works on systems with `systemd` and the Docker CLI installed  
- Filters Docker events to only recent crashes or out-of-memory events  
- Output is neatly labeled for readability and logging  

---

## 📸 Sample Image
