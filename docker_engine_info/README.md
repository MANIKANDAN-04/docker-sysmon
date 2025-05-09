# ⚙️ Docker Engine Info

Understanding your Docker engine environment is critical for managing containers efficiently and troubleshooting performance or compatibility issues.

This script provides a concise overview of your Docker engine, including version info, system settings, and disk usage statistics.

---

## 📌 What Is This Script?

`docker_engine_info.sh` is a lightweight utility that gathers core information about the Docker installation on your machine. It summarizes:

- Docker version details
- System-level Docker engine information
- Disk usage overview via Docker

---

## 🎯 Why View Docker Engine Info?

- Helps verify Docker installation and configuration  
- Supports troubleshooting compatibility or runtime issues  
- Useful for auditing systems before running containers  
- Ensures you're running the correct Docker version for your application stack  

---

## 🔍 What This Script Reports

| Category         | Description                                 |
|------------------|---------------------------------------------|
| Docker Version   | Client and server version details           |
| System Info      | Configuration, runtime info, storage driver |
| Disk Usage       | High-level overview of Docker space usage   |

---

## 🧠 How It Works

- Uses `docker version` to show client/server versions  
- Uses `docker info` to output engine-level system settings  
- Uses `docker system df` to summarize current Docker disk use  

---

## 📈 Why It’s Useful

- Great for **audits, support tickets, or migrations**  
- Helps identify outdated or misconfigured Docker environments  
- Assists with debugging resource issues in dev/test/prod setups  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_engine_info.sh
```

### 2. Run the script:

```bash
./docker_engine_info.sh
```

> No special permissions needed unless Docker requires `sudo` on your system.

---

## 📄 Notes

- This script **does not modify** anything — it’s read-only and safe to run  
- Works on any Linux system with Docker CLI installed  

---

## 📸 Sample Image
