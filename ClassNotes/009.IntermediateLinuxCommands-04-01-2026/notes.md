## 📘 Linux Basics & Command Line Interface (CLI) – Comprehensive Notes

## 2️⃣ GUI vs CLI (Important Concept)

### GUI (Graphical User Interface)

* Right Click → New Folder
* Double click to open files
* Drag, copy, paste visually

### CLI (Command Line Interface)

* Faster
* Used in **servers, cloud, DevOps**
* No mouse dependency

👉 **Every GUI action has an equivalent CLI command**

---

## 3️⃣ Important Keyboard Shortcuts

| Action           | Shortcut   |
| ---------------- | ---------- |
| Save file        | `Ctrl + S` |
| Exit nano editor | `Ctrl + X` |
| Clear terminal   | `clear`    |

---

## 4️⃣ File & Directory Commands

### 📂 `pwd` – Present Working Directory

Shows **current location** in the system.

```bash
pwd
```

---

### 📁 `ls` – List Files & Folders

Shows contents of current directory.

```bash
ls
```

---

### 📁 `mkdir` – Create Folder

```bash
mkdir MyWorld
```

📌 GUI Equivalent: Right Click → New Folder

---

### 📂 `cd` – Change Directory

Move inside a folder.

```bash
cd MyWorld
```

---

## 5️⃣ File Creation & Editing

### 📄 `touch` – Create File

```bash
touch hello.txt
```

📌 GUI Equivalent: Right Click → New File

---

### ✏️ `nano` – File Editor

Used to **edit files from terminal**.

```bash
nano hello.txt
```

* Save → `Ctrl + S`
* Exit → `Ctrl + X`

📌 Nano is a **lightweight Linux text editor**

---

### 📖 `cat` – View File Content

```bash
cat hello.txt
```

📌 Used only to **view**, not edit.

---

## 6️⃣ Copy, Move & Delete Commands

---

### 📄 `cp` – Copy Files

#### Help Command

```bash
cp --help
```

#### Usage Format

```bash
cp SOURCE DEST
```

#### Example

```bash
cp rinki_ka_pyaar.txt rinki_backup.txt
```

📌 **Command Formula Rules**

1. `[ ]` → remove
2. `...` → remove
3. **Lowercase** → constant
4. **UPPERCASE** → changeable

---

### 📂 `mv` – Move / Rename Files

#### Help

```bash
mv --help
```

#### Usage

```bash
mv SOURCE DEST
```

#### Example

```bash
mv rinki_ka_pyaar.txt backup_myworld
```

📌 Also used for **renaming files**

---

### ❌ `rm` – Remove Files

```bash
rm file.txt
```

---

### ❌ `rm -rf` – Remove Folder (Dangerous ⚠️)

```bash
rm -rf myfolder
```

📌 **No recovery** – use carefully

---

## 7️⃣ Search Command – `grep`

### 🔍 Search Pattern in File

```bash
grep love file.txt
```

### 🔍 Case-Insensitive Search

```bash
grep -i love file.txt
```

📌 Used heavily in **logs & troubleshooting**

---

### 📝 Homework (Important)

👉 **Find how many times the word `love` appears in a file using `grep`.**

---

## 8️⃣ System & Monitoring Commands

---

### 🧠 `lscpu` – CPU Information

```bash
lscpu
```

---

### 🧠 `free -h` – RAM Usage

```bash
free -h
```

---

### 💾 `df -h` – Disk Space

```bash
df -h
```

---

### 💾 `du -h` – Directory Size

```bash
du -h myfolder
```

---

### 🖥️ OS Information

```bash
cat /etc/os-release
```

---

### 🌐 IP Address

```bash
hostname -I
```

---

### ⏳ System Uptime

```bash
uptime
```

---

## 9️⃣ Process Management

---

### 🔄 `ps` – Running Processes

```bash
ps
```

---

### 📊 `top` – Task Manager (Linux)

```bash
top
```

📌 Similar to **Windows Task Manager**

---

### ❌ `kill` – Stop Process

```bash
kill PID
```

📌 Used when a process hangs

---

## 🔁 Practice Task (Must Do)

1️⃣ Create folder `MyWorld`
2️⃣ Go inside it
3️⃣ Create a file
4️⃣ Write content using `nano`
5️⃣ View content using `cat`
6️⃣ Copy the file
7️⃣ Rename it
8️⃣ Search a word using `grep`

👉 **Practice this on Killercoda**
