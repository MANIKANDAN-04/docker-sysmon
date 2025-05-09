# 🗃️ Docker Volumes Report

This script inspects and reports on all Docker volumes present on your system, helping identify usage, size, and potential cleanup targets (like dangling volumes).

---

## 📌 What Is This Script?

`docker_volumes.sh` provides a detailed overview of Docker volumes:

- Volume list and metadata
- Per-volume disk usage
- Volume-to-container usage mapping
- Detection of dangling (unused) volumes
- Total disk usage consumed by volumes

---

## 🔍 What This Script Reports

| Section                          | Description                                                     |
|----------------------------------|-----------------------------------------------------------------|
| List of All Volumes             | Shows all volumes by name (volume ID)                           |
| Detailed Volume Information     | Driver, mountpoint, creation date, and disk usage               |
| Containers Using Volumes        | Lists which containers are using which volumes                  |
| Unused (Dangling) Volumes       | Identifies volumes not attached to any container                |
| Total Volume Disk Usage         | Sums up all volume sizes                                        |
| Summary                         | Totals for volumes, usage, dangling count, and size             |

---

## 🧠 How It Works

- Uses `docker volume ls`, `docker volume inspect`, and `docker ps`
- Calculates disk usage via `du` on each mountpoint
- Parses JSON with `jq` for clarity and structure
- Tracks aggregate volume size in bytes for final summary

---

## 🛠️ How to Use

### 1. Ensure dependencies are installed:

```bash
docker --version
jq --version
```

> `jq` is required for JSON parsing.

### 2. Make it executable:

```bash
chmod +x docker_volumes.sh
```

### 3. Run it:

```bash
./docker_volumes.sh
```

---

## 📈 Why Use This Script?

- Gain visibility into **how much disk space** Docker volumes consume
- Detect **orphaned volumes** no longer in use
- Support **volume hygiene** and cleanup decisions
- Helps identify **persistent data growth**

---

## 🧹 Cleanup Tip

To remove unused volumes:

```bash
docker volume prune
```

> ⚠️ This deletes *all* dangling volumes. Use with caution.

---

## 📸 Sample Image
