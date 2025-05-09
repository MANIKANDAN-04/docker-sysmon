# 🧹 Docker Dangling Resources Report

Over time, Docker environments can accumulate **unused images**, **volumes**, and **networks** — commonly referred to as *dangling resources*. These can waste disk space and clutter your Docker environment.

This script identifies such dangling elements so you can review and clean them safely.

---

## 📌 What Is This Script?

`docker_dangling.sh` is a Bash utility that scans for:

- **Dangling images** (untagged, unused images)
- **Unused volumes** (not attached to any containers)
- **Unused Docker networks** (custom networks with no active containers)

It provides a simple, readable report and is safe to run as part of regular maintenance routines.

---

## 🎯 Why Monitor Dangling Resources?

- Prevents disk bloat from unused Docker artifacts  
- Keeps your Docker environment clean and efficient  
- Helps identify resources left behind from CI/CD pipelines or development cycles  
- Useful before performing system upgrades or snapshots  

---

## 🔍 What This Script Reports

| Type             | Description                                        |
|------------------|----------------------------------------------------|
| Dangling Images  | Unused and untagged images that can be pruned      |
| Unused Volumes   | Volumes not mounted to any running/stopped container |
| Unused Networks  | Custom networks with no containers attached        |

---

## 🧠 How It Works

- Uses `docker images -f "dangling=true"` for images  
- Lists volumes with `docker volume ls -f dangling=true`  
- Checks each custom network’s container list to detect unused ones  

All findings are clearly marked and separated for readability.

---

## 📈 Why It’s Useful

- Keeps your container environment lean and manageable  
- Great for **troubleshooting** and **environment audits**  
- Prevents surprise disk usage spikes in long-running Docker hosts  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_dangling.sh
```

### 2. Run the script:

```bash
./docker_dangling.sh
```

> Requires Docker CLI installed and access to Docker daemon (e.g., `sudo` or Docker group membership).

---

## 📄 Notes

- No cleanup is performed automatically — it’s purely a reporting tool  
- Script avoids default networks (`bridge`, `host`, `none`) when checking unused networks  
- Results can be piped to cleanup scripts if desired  

---

## 📸 Sample Image

![docker_dangling](https://github.com/user-attachments/assets/20dc3be8-8404-48a0-8dfe-49767f9bb5a5)
