# 🔐 Docker Security Checks

This script provides a security audit of your Docker environment. It helps identify potentially insecure configurations, privileged containers, root users, and exposed ports.

Use this to harden your Docker host and container setups.

---

## 📌 What Is This Script?

`docker_security_checks.sh` performs a set of automated security checks on your Docker setup, including:

- Permissions on Docker socket
- Docker daemon process user
- Containers with privileged mode or extra Linux capabilities
- Containers running as root
- AppArmor/SELinux profile usage
- Exposed container ports
- TLS settings on the Docker daemon

---

## 🔍 What This Script Reports

| Section                            | Description                                                            |
|-----------------------------------|------------------------------------------------------------------------|
| Docker Socket Permissions         | Checks file permissions on `/var/run/docker.sock`                     |
| Docker Daemon User                | Lists how the Docker daemon is running (e.g., as root)                |
| Privileged Containers             | Detects containers with `--privileged` mode enabled                   |
| Containers Running as Root        | Flags containers with root or no specified user                       |
| Extra Linux Capabilities          | Displays any `CapAdd` entries set per container                       |
| AppArmor / SELinux Profile        | Shows active AppArmor or SELinux profile usage by container           |
| Exposed Ports                     | Summarizes host-to-container port mappings                            |
| Docker Daemon TLS Settings        | Detects if `--tlsverify` is enabled for secure Docker API access      |

---

## 🧠 How It Works

- Uses `docker inspect`, `docker ps`, and `ps`/`ls` system tools
- Greps for `--tlsverify` to check TLS activation
- Parses container runtime metadata for user and security context
- Detects misconfigurations and insecure practices

---

## 🛠️ How to Use

### 1. Make it executable:

```bash
chmod +x docker_security_checks.sh
```

### 2. Run it:

```bash
./docker_security_checks.sh
```

---

## 🧱 Why This Is Useful

- Helps enforce **least privilege**
- Identifies **insecure defaults**
- Surfaces **misconfigured or overly permissive** containers
- Supports compliance and **security hardening**

---

## ⚠️ Note

This script **does not modify anything**—it is safe to run and purely informational. Use it to guide further security decisions.

---

## 📸 Sample Image
