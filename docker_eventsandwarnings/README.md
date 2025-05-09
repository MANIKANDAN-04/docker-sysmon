# 🚨 Docker Events & Warnings

This script helps system administrators monitor critical Docker activity by collecting recent container-level events and potential warnings from the Docker daemon.

Use this tool to investigate unexpected behavior, crashes, or restarts in your container environment.

---

## 📌 What Is This Script?

`docker_eventsandwarnings.sh` is a lightweight shell utility that reports on:

- Recent Docker container lifecycle events (start, stop, crash, etc.)
- Docker daemon warnings and errors (if available via system logs)

It provides a quick and centralized snapshot of issues and changes in your Docker runtime environment.

---

## 🎯 Why Monitor Docker Events?

- Detect containers that are restarting, failing, or being killed  
- Identify out-of-memory (OOM) events or health check failures  
- Gather early warnings about daemon misconfigurations or issues  
- Support troubleshooting and incident response workflows  

---

## 🔍 What This Script Reports

| Source               | Description                                        |
|----------------------|----------------------------------------------------|
| Docker Events        | Monitors container lifecycle events from Docker    |
| Daemon Warnings      | Shows recent warning/error messages from Docker via `journalctl` (if available) |

---

## 🧠 How It Works

- Uses `docker events` to collect container events from the past hour (or user-defined range)  
- Filters for critical events like `start`, `stop`, `die`, `kill`, `oom`, and `health_status`  
- If available, checks daemon logs using `journalctl` for warnings and errors  

---

## 📈 Why It’s Useful

- Helps detect **instability** in running containers  
- Useful for **debugging issues after a crash or restart**  
- Highlights **potential misconfigurations** in Docker setups  
- Lightweight and suitable for **automated monitoring scripts**  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_eventsandwarnings.sh
```

### 2. Run the script:

```bash
./docker_eventsandwarnings.sh
```

### Optional: Pass a custom time range (e.g., last 30 minutes):

```bash
./docker_eventsandwarnings.sh 30m
```

> Use time strings supported by `docker events --since`, such as `10m`, `2h`, `2024-01-01T00:00:00`.

---

## 📄 Notes

- If `journalctl` is not available (e.g., on non-systemd systems), daemon warnings are skipped  
- Only the **last 100 container events** and **last 50 log lines** are shown for brevity  

---

## 📸 Sample Image
