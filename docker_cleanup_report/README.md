# 🧹 Docker Cleanup Report

As Docker environments evolve, unused containers, images, volumes, and networks can accumulate, consuming disk space and cluttering your system. This script helps system administrators and DevOps engineers **identify cleanup opportunities** across the Docker stack without actually deleting anything.

---

## 📌 What Is This Script?

`docker_cleanup_report.sh` is a read-only diagnostic script that provides a complete report of:

- Disk space used by Docker images, containers, and volumes  
- Stopped containers  
- Dangling (unused) images  
- Unused volumes  
- Orphaned user-defined networks  

This is ideal for reviewing cleanup opportunities before running actual deletion commands.

---

## 🎯 Why Monitor Docker Clutter?

Monitoring unused Docker resources helps:

- Reclaim wasted disk space  
- Avoid performance degradation on CI/CD machines or developer systems  
- Prevent Docker daemon issues due to too many unused resources  
- Keep environments clean and easier to manage  

---

## 🔍 What This Script Checks

| Resource                | Description                                                             |
|------------------------|-------------------------------------------------------------------------|
| System Disk Usage      | Summary of image, container, volume, and build cache usage              |
| Stopped Containers     | Lists containers that are no longer running                             |
| Dangling Images        | Identifies unused images not linked to any container                    |
| Unused Volumes         | Shows volumes not attached to any container                             |
| Orphaned Networks      | Detects custom networks with no containers connected                    |

---

## 🧠 How It Works

- Uses `docker system df` to display an overview of Docker disk usage.  
- Filters stopped containers using `docker ps -a` with status `exited`.  
- Detects dangling images via `docker images -f dangling=true`.  
- Finds unused volumes using `docker volume ls -f dangling=true`.  
- Inspects all custom networks and checks if they are connected to any container.  

The output is separated into clear sections for readability.

---

## 📈 Why It’s Useful

- Safe way to **review what can be cleaned** without risk  
- Great for **maintenance tasks** on shared Docker hosts  
- Provides visibility for **disk audits** and **resource monitoring**  
- Works in both development and production Docker environments  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_cleanup_report.sh
```

### 2. Run the script:

```bash
./docker_cleanup_report.sh
```

> No changes are made to your system. It’s a report-only script.

---

## 📄 Notes

- Requires Docker CLI and appropriate user permissions.  
- For automated cleanup, consider pairing with `docker system prune`, but **review reports first** to avoid unintended deletions.  

---

## 📸 Sample Image

![docker_cleanup_report](https://github.com/user-attachments/assets/6cae3ca1-1533-4d46-bee8-1682ad617bdf)
