# 💽 Docker Disk Usage Report

Docker environments can accumulate significant disk usage across images, containers, and volumes. Tracking and auditing this usage helps avoid disk exhaustion and ensures your container infrastructure stays lean and efficient.

This script gives a full breakdown of Docker-related disk usage.

---

## 📌 What Is This Script?

`docker_disk_usage.sh` is a Bash-based report generator that summarizes disk usage by:

- Docker images
- Containers (including stopped ones)
- Volumes (with actual size on disk)
- Overall system usage via `docker system df`

---

## 🎯 Why Monitor Docker Disk Usage?

- Prevents your host system from running out of space unexpectedly  
- Identifies large or orphaned images, containers, and volumes  
- Helps optimize storage in production or CI/CD environments  
- Supports regular system hygiene and container sprawl control  

---

## 🔍 What This Script Reports

| Category           | Description                                           |
|--------------------|-------------------------------------------------------|
| System Summary     | Aggregated disk usage of all Docker components        |
| Docker Images      | Size and details of each image                        |
| Containers         | Size of data per container (running & stopped)        |
| Volumes            | Actual disk space consumed by Docker volumes          |

---

## 🧠 How It Works

- Uses `docker system df` for overall stats  
- Lists all images with size via `docker images`  
- Includes size per container with `docker ps -a --size`  
- For volumes, it inspects mountpoints and uses `du` to calculate space  

All outputs are formatted for easy scanning and system reviews.

---

## 📈 Why It’s Useful

- Great for **disk audits** and **troubleshooting storage issues**  
- Helps you identify stale or oversized resources  
- Useful in **capacity planning** for Docker-based infrastructures  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_disk_usage.sh
```

### 2. Run the script:

```bash
./docker_disk_usage.sh
```

> You may need `sudo` for full volume path access depending on your Docker setup.

---

## 📄 Notes

- Disk usage of volumes is calculated using the `du` utility  
- Actual volume size may vary depending on file system and mounts  
- Volume entries with `N/A` may not be accessible without elevated privileges  

---

## 📸 Sample Image
