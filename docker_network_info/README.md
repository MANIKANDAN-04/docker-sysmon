# 🌐 Docker Network Info

This script provides a comprehensive overview of Docker networks configured on your system, including default and custom networks, container attachments, and subnet/gateway details.

Use this to inspect connectivity, audit configurations, and clean up unused networks.

---

## 📌 What Is This Script?

`docker_network_info.sh` is a diagnostic tool that:

- Lists all Docker networks
- Separates default vs. custom user-defined networks
- Shows unused (dangling) networks
- Displays which containers are connected to which network
- Reveals subnet and gateway configuration per network

---

## 🔍 What This Script Reports

| Section                        | Description                                                    |
|-------------------------------|----------------------------------------------------------------|
| All Docker Networks            | List of all network names, IDs, drivers, and scopes            |
| Network Classification         | Splits into default and custom networks                        |
| Unused (Dangling) Networks     | Lists networks with no attached containers                     |
| Connected Containers per Net   | Lists containers connected to each network                     |
| Network Subnet & Gateway Info  | Shows subnet and gateway addresses for all networks            |

---

## 🧠 How It Works

- Uses `docker network ls`, `docker network inspect`, and format filters  
- Differentiates built-in networks (`bridge`, `host`, `none`)  
- Displays container connectivity for diagnostics and debugging  
- Summarizes gateway/subnet configurations per network  

---

## 🛠️ How to Use

### 1. Make it executable:

```bash
chmod +x docker_network_info.sh
```

### 2. Run it:

```bash
./docker_network_info.sh
```

---

## 📈 Why This Is Useful

- Ensures **networks are configured as expected**
- Detects **orphaned or dangling networks**
- Helps verify **network isolation** and **container grouping**
- Aids in **troubleshooting connectivity issues**

---

## 📸 Sample Image
