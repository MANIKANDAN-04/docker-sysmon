# 📋 Docker Container Logs Collector

Keeping track of logs is essential when managing Dockerized applications. Whether you're debugging a failing service or auditing behavior in production, container logs are a primary source of truth.

This script simplifies the task of retrieving recent logs from **all currently running containers** in one go — with clear labels and output formatting.

---

## 📌 What Is This Script?

`docker_container_logs.sh` is a lightweight Bash tool that:

- Scans all **running Docker containers**
- Retrieves and displays the **last 50 log lines** from each
- Labels output per container for readability

---

## 🎯 Why Collect Container Logs?

- Diagnose runtime issues in microservices and app containers  
- Monitor service behavior and application output  
- Consolidate logs without needing centralized logging tools  
- Useful for debugging, audits, and quick reviews  

---

## 🔍 What This Script Reports

| Section            | Description                                    |
|--------------------|------------------------------------------------|
| Container ID/Name  | Identifies which container each log belongs to |
| Log Output         | Shows the last 50 lines from `docker logs`     |

---

## 🧠 How It Works

- Uses `docker ps -q` to get a list of running containers
- For each container:
  - Resolves its name with `docker inspect`
  - Prints a labeled section with the last 50 logs via `docker logs --tail 50`

---

## 📈 Why It’s Useful

- Enables quick reviews of multiple services in one script run  
- Avoids manual log retrieval or switching between container terminals  
- Lightweight and works across all environments with Docker CLI  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_container_logs.sh
```

### 2. Run the script:

```bash
./docker_container_logs.sh
```

> You may need `sudo` if your user doesn't have Docker group permissions.

---

## 📄 Notes

- Only running containers are included.  
- Logs are truncated to the most recent 50 lines for brevity. Adjust with `--tail` if needed.

---

## 📸 Sample Image
