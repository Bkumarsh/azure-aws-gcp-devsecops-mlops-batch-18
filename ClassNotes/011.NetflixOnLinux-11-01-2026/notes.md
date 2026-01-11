# Linux & DevOps Comprehensive Notes (Class #1101)

---

## Class Agenda

1. Absolute and Relative Paths in Linux
2. Package Managers in Linux (APT, YUM, DNF, APK)
3. Deploying and Running StreamFlix (Netflix-like app) on Linux
4. Important System Commands
5. LinkedIn & Career Guidance

---

## 1. Absolute Path vs Relative Path

### What is a Path?

A **path** tells Linux where a file or folder exists in the directory structure.

### Root Directory

* Root is represented by `/`
* Everything in Linux starts from `/`

Example directories:

```
/
├── bin
├── home
├── var
│   └── www
│       └── html
```

---

### Absolute Path

**Definition:**

* Path that always starts from the root `/`
* Independent of current working directory

**Example:**

```bash
cd /bin
cd /var/www/html
```

**Key Points:**

* Always starts with `/`
* Clear and fixed location
* Commonly used for system-level operations

---

### Relative Path

**Definition:**

* Path that starts from the **current directory**
* Does NOT start with `/`

**Example:**

```bash
cd ../munna
```

**Key Points:**

* Depends on where you currently are
* Very common in automation and scripts
* Easier to reuse across environments

**Important:**

> 🔥 In automation, **relative paths** are preferred.

---

## 2. Package Managers in Linux

### What is a Package Manager?

A tool that helps you:

* Install software
* Update software
* Remove software
* Manage dependencies

### Real-life Examples

| Platform | Package Manager |
| -------- | --------------- |
| Android  | Play Store      |
| Apple    | App Store       |
| Ubuntu   | apt             |
| RedHat   | yum             |
| CentOS   | dnf             |
| Alpine   | apk             |

---

### APT – Advanced Package Tool (Ubuntu)

#### Common APT Commands

```bash
apt list                     # List all available software
apt search nginx             # Search a software
apt install nginx            # Install a software
apt list --installed         # List installed software
apt update                   # Fetch latest package versions
```

---

## 3. Installing Nginx (Web Server)

### What is Nginx?

* Middleware / Web Server
* Used to serve web applications

### Nginx Default Web Directory

```bash
/var/www/html
```

### Browser Access

```
http://192.168.1.21
```

---

## 4. Deploying StreamFlix (Netflix-like App)

### Requirements

1. **Application Code**

   * GitHub Repository:

     ```
     https://github.com/devopsinsiders/StreamFlix
     ```

2. **Free Linux Machine**

   * KillerCoda Linux Machine

3. **Web Server**

   * Nginx

---

### Steps to Deploy StreamFlix

#### Step 1: Go to Home Directory

```bash
cd /home/ubuntu
```

#### Step 2: Clone the Repository

```bash
git clone https://github.com/devopsinsiders/StreamFlix.git
```

#### Step 3: Copy Code to Nginx Directory

```bash
cp -r /home/ubuntu/StreamFlix/* /var/www/html
```

#### Step 4: Access Application

Open browser and hit:

```
http://192.168.1.21
```

---

### StreamFlix Project Structure

```
StreamFlix/
├── README.md
├── index.html
├── assets/
├── avatar.png
├── favicon.ico
├── manifest.json
├── robots.txt
```

---

## 5. Important Linux Directories

| Directory     | Purpose               |
| ------------- | --------------------- |
| /home         | User home directories |
| /var          | Variable data         |
| /var/www/html | Web server root       |
| /bin          | Essential binaries    |

---

## 6. System Commands (Assignment)

### tail

Shows last lines of a file

```bash
tail file.txt
```

### head

Shows first lines of a file

```bash
head file.txt
```

### top

Shows real-time system processes

```bash
top
```

---

## 7. LinkedIn & Career Guidance

### Job Platforms

1. LinkedIn
2. Naukri.com
3. Others:

   * upplers.com
   * turing.com
   * glg
   * upwork
   * freelancer

---

### Who is on LinkedIn?

* Technical HR
* Hiring Manager
* Project Manager
* Resource Manager
* TPM
* Practice Head
* Industry Principals

---

### LinkedIn Strategy

* **"Jo dikhta hai, wahi bikta hai"**
* Be visible
* Post consistently
* Share learning & projects

### Old vs New LinkedIn Account

* If comfortable → Continue old account
* If fear/doubt from old connections →

  * Block problematic people
  * OR create fresh DevOps/MLOps-focused account
  * Hibernate old account

---

## Final Takeaway

* Linux basics are the foundation of DevOps
* Package managers simplify software installation
* Real projects like StreamFlix build confidence
* LinkedIn presence is as important as technical skills

🔥 **Learn daily. Build projects. Show your work.**
