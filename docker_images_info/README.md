# 🖼️ Docker Images Info

This script provides a detailed report on all Docker images present on your system, including summaries, dangling layers, unused images, and the largest space consumers.

Use it to track down storage hogs, clean up unused layers, or simply audit your image usage.

---

## 📌 What Is This Script?

`docker_images_info.sh` is a diagnostic tool that reports:

- The total number of Docker images on your system
- Dangling (untagged) image layers
- Unused images not tied to any container
- Full listing of all images with key metadata
- The top 10 largest images by size

---

## 🔍 What This Script Reports

| Section                     | Description                                           |
|----------------------------|-------------------------------------------------------|
| Docker Image Summary       | Total count, dangling count, and unique repositories |
| All Docker Images          | Repository, tag, image ID, age, and size             |
| Dangling Images            | Untagged image layers not in use                     |
| Unused Images              | Images not associated with any container             |
| Largest Docker Images      | Top 10 biggest images in storage                     |

---

## 🧠 How It Works

- Uses the `docker images`, `docker ps`, and `docker inspect` commands  
- Filters out images in use by running or stopped containers  
- Formats all results into human-readable tables  
- Highlights large images for optimization  

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x docker_images_info.sh
```

### 2. Run it:

```bash
./docker_images_info.sh
```

---

## 📈 Why This Is Useful

- Helps **identify image bloat** in your system  
- Makes it easier to **clean up unused or outdated images**  
- Useful for **CI/CD pipelines**, **DevOps audits**, and **resource optimization**  
- Tracks **dangling layers** that can be removed to reclaim disk space  

---

## 📸 Sample Image
