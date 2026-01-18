# 📘 Linux, Middleware & Infrastructure – Comprehensive Notes

## 1️⃣ Linux System Basics

Linux is an **operating system** widely used for servers, cloud, DevOps, and production environments.
Most servers run **Linux-based OS** like Ubuntu, RHEL, Amazon Linux, or Debian.

---

## 2️⃣ Important Linux System Commands

### 🔹 CPU & Memory Information

| Command   | Purpose                                     |
| --------- | ------------------------------------------- |
| `lscpu`   | Shows CPU architecture, cores, threads      |
| `free -h` | Displays RAM usage in human-readable format |
| `uptime`  | Shows how long the system has been running  |

---

### 🔹 Disk & Storage

| Command | Purpose                               |
| ------- | ------------------------------------- |
| `df -h` | Shows disk space usage (HDD/SSD)      |
| `du -h` | Shows disk usage of directories/files |

---

### 🔹 OS & Network Info

| Command               | Purpose                      |
| --------------------- | ---------------------------- |
| `cat /etc/os-release` | Displays OS name and version |
| `hostname -I`         | Shows system IP address      |

---

### 🔹 Process Management

| Command      | Purpose                                          |
| ------------ | ------------------------------------------------ |
| `ps`         | Lists running processes                          |
| `top`        | Real-time process monitoring (like Task Manager) |
| `kill <PID>` | Terminates a process                             |

📌 **Tip:** Press `q` to exit `top`

---

## 3️⃣ Linux File System Basics

| Path    | Meaning                            |
| ------- | ---------------------------------- |
| `/`     | Root directory (top of everything) |
| `/root` | Home directory of root user        |

---

## 4️⃣ Package Management (APT)

Linux uses **package managers** to install and manage software.

### 🔹 APT (Advanced Package Tool)

Used in:

* Ubuntu
* Debian
* Kali Linux

---

### 🔹 Common APT Commands

| Command                | Purpose                  |
| ---------------------- | ------------------------ |
| `apt update`           | Refresh package list     |
| `apt install nginx`    | Install nginx web server |
| `apt list`             | List available packages  |
| `apt list --installed` | List installed software  |

---

### 🔹 Save Installed Packages to File

```bash
apt list --installed > installed.txt
```

* `>` → overwrite file
* `>>` → append to file

---

### 🔹 Search Inside Files (grep)

```bash
grep "nginx" installed.txt
```

Searches for `nginx` inside the file.

---

### 🔹 Pipe (`|`) Concept

```bash
apt list --installed | grep "nginx"
```

📌 **Pipe (`|`) explanation:**

* Output of left command becomes input of right command
* Very powerful in Linux automation

---

## 5️⃣ Middleware & Applications

### 🔹 Middleware Example: **NGINX**

* Acts as **Web Server**
* Also used as **Reverse Proxy**, **Load Balancer**

---

### 🔹 Check Nginx Status (Systemd)

| Command                   | Purpose         |
| ------------------------- | --------------- |
| `systemctl status nginx`  | Check status    |
| `systemctl start nginx`   | Start service   |
| `systemctl stop nginx`    | Stop service    |
| `systemctl restart nginx` | Restart service |

📌 **Homework Concept from PDF:**

* Check if Nginx is running
* Stop Nginx
* Restart Nginx

---

## 6️⃣ Linux Distributions

### 🔹 Ubuntu

* Beginner-friendly
* Widely used in cloud & DevOps
* Website: `ubuntu.com`

### 🔹 Kali Linux

* Security & Penetration Testing OS
* Website: `kali.org`

---

## 7️⃣ Application & Software Ecosystem

### 🔹 Linux Software

* Installed via package manager (`apt`)
* No Play Store like Android

### 🔹 Android (Comparison)

* Uses `.apk` or `.aab` files
* Installed via Play Store

---

## 8️⃣ Temporary Lab vs Real Systems

### 🔹 Online Labs (Example: Killercoda)

* Limited time (e.g., 40 minutes)
* No full control
* Not production-ready

📌 **Key Realization from PDF:**

> “We need our own controlled computer/server.”

---

## 9️⃣ Where Do Servers Come From?

### Option 1: **On-Premises (Datacenter)**

Requires:

* Physical servers
* Security
* Cooling & Power
* Backup
* CCTV
* Permits
* Maintenance team

---

### Option 2: **Cloud Computing**

Providers manage infrastructure.

| Cloud | Console                    |
| ----- | -------------------------- |
| AWS   | `console.aws.amazon.com`   |
| Azure | `portal.azure.com`         |
| GCP   | `console.cloud.google.com` |

---

## 🔐 Cloud Advantages

* High security
* Automated backups
* Global availability
* No hardware management
* Pay-as-you-go

---

## 🔟 Cloud Regions

* AWS → Origin: USA
* Azure & GCP → Available in India

Each region provides:

* Security
* Cooling
* Power
* Compliance
* Monitoring

---

## 🔚 Summary

These notes cover:

* Linux fundamentals
* Core system commands
* Package management
* Middleware (Nginx)
* Process & service control
* On-prem vs Cloud comparison
* DevOps foundational mindset


