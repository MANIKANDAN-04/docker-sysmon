# 🐳 docker-sysmon

A lightweight and modular Bash-based toolkit for monitoring the health, performance, and security of Docker environments. Designed for DevOps engineers, SREs, and sysadmins who want instant visibility into their container infrastructure without heavy dependencies.

---

## 📁 Folder Structure

```bash
docker-sysmon/
├── docker_cleanup_report/
│ └── docker_cleanup_report.sh
├── docker_container_logs/
│ └── docker_container_logs.sh
├── docker_container_monitoring/
│ └── docker_container_monitoring.sh
├── docker_daemon_health/
│ └── docker_daemon_health.sh
├── docker_dangling/
│ └── docker_dangling.sh
├── docker_disk_usage/
│ └── docker_disk_usage.sh
├── docker_engine_info/
│ └── docker_engine_info.sh
├── docker_eventsandwarnings/
│ └── docker_eventsandwarnings.sh
├── docker_images_info/
│ └── docker_images_info.sh
├── docker_network_info/
│ └── docker_network_info.sh
├── docker_security_checks/
│ └── docker_security_checks.sh
└── docker_volumes/
└── docker_volumes.sh
```

---

## ⚙️ Script Overview

| Script Name                       | Description                                                             |
|----------------------------------|-------------------------------------------------------------------------|
| `docker_cleanup_report.sh`       | Summarizes unused containers, images, volumes for cleanup.             |
| `docker_container_logs.sh`       | Fetches logs from running containers (with filtering options).         |
| `docker_container_monitoring.sh` | Reports container CPU/memory stats, uptime, and status.                |
| `docker_daemon_health.sh`        | Checks Docker daemon status and systemd integration.                   |
| `docker_dangling.sh`             | Lists dangling images and unused resources.                            |
| `docker_disk_usage.sh`           | Shows Docker-related disk usage (images, volumes, containers).         |
| `docker_engine_info.sh`          | Displays Docker engine version, runtime, and environment settings.     |
| `docker_eventsandwarnings.sh`    | Captures recent Docker events and warning logs.                        |
| `docker_images_info.sh`          | Lists local images with size, creation date, and usage.                |
| `docker_network_info.sh`         | Examines Docker networks, bridge mode, and connected containers.       |
| `docker_security_checks.sh`      | Highlights potential security issues (privileged containers, etc.).    |
| `docker_volumes.sh`              | Lists Docker volumes with usage info and orphaned volumes.             |

---

## 🐧 Requirements

- Docker installed and running
- Bash 4.x+
- User must have permission to run `docker` commands (typically in `docker` group or root)

---

You can also integrate these scripts into cron jobs or monitoring pipelines.

## 🔒 Security Note
These scripts are read-only and safe to run in production environments. Cleanup actions (like in docker_cleanup_report.sh) only generate reports—no automatic deletion is performed unless explicitly modified by you.

## 🛠️ Contributions
Feel free to open issues, suggest enhancements, or contribute improvements via PRs. Let’s build a better way to monitor Docker containers together!
