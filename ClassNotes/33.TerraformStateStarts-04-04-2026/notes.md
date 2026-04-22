# 📘 DevOps Insiders – Terraform + Architecture Notes (Batch 18)

---

# 🏗️ Architecture Basics

## 🔹 3-Tier Architecture (Start Learning)

👉 Industry standard architecture:

```text
Client → Web Layer → App Layer → Database Layer
```

### 🔸 Layers:

* **Web Layer (Frontend)**
* **Application Layer (Middleware / Backend logic)**
* **Database Layer**

📌 Important:

* Scalable, secure, production-ready architecture

---

## 🔹 1-Tier Architecture (Basic Deployment)

👉 Everything runs on a single machine

### Examples:

* **Windows** → IIS Server
* **Linux** → Nginx

📌 Used for:

* Learning
* Small apps
* Testing

---

# 💻 Where to Run Your Infra?

## 🔹 Options:

* Personal Laptop
* Killerkoda (practice labs)
* On-Premises servers
* Cloud:

  * Azure
  * AWS
  * GCP

---

# ⚙️ Deployment Approaches

## 🔹 Manual vs Automation

### 🟢 Manual

* Azure Portal
* CLI commands

### 🔵 Automation (Recommended)

* Terraform
* ARM Templates / Bicep

---

## 🔹 Imperative vs Declarative

### Imperative

* Step-by-step instructions
* Example: Azure CLI

### Declarative

* Define desired state
* Example: Terraform

---

# ☁️ Azure CLI Basics

## 🔹 Install Azure CLI

```bash
az --help
az login
```

👉 Used for:

* Authentication
* Manual operations

---

# 📦 Resource Group Creation Methods

* Azure Portal (UI)
* Azure CLI
* Terraform (preferred)

---

# 🌍 Terraform Setup (Step-by-Step)

## 🔹 Initial Setup

1. Install Terraform
2. Install VS Code
3. Install Terraform Extension
4. Create a folder
5. Create `.tf` file (example: `rg.tf`)

---

## 🔹 Provider Setup

* Go to Terraform Registry
* Copy provider code
* Paste in `.tf` file

---

# 🔁 Terraform Workflow (Practical Flow)

## 🔹 Step 1: Navigate to Folder

```bash
cd <folder>
```

---

## 🔹 Step 2: Initialize Terraform

```bash
terraform init
```

### What happens:

* `.tf` files scan karta hai
* Provider identify karta hai
* Download karta hai from registry
* Creates:

  * `.terraform/` folder
  * `terraform.lock.hcl`

📌 Analogy from notes:
👉 “Ghar se niklte hi raste me Sweety ka ghar” 😄
→ Means: Immediately finds provider and downloads it

---

## 🔹 Step 3: Format & Validate

### Format:

```bash
terraform fmt
```

* Code clean & readable banata hai

### Validate:

```bash
terraform validate
```

* Syntax check

---

## 🔹 Step 4: Login to Azure

```bash
az login
```

---

## 🔹 Step 5: Plan

```bash
terraform plan
```

👉 Shows:

* Kya create hoga
* Kya change hoga

📌 No real changes yet

---

## 🔹 Step 6: Apply

```bash
terraform apply
```

👉 Confirmation maangta hai:

* “Pakka?” → Yes → Resource create

---

# 📦 Terraform File Structure

## 🔹 Example: `rg.tf`

```hcl
terraform {
  required_providers {
    azurerm = {}
  }
}

provider "azurerm" {
  features {}
}
```

---

# 🔌 Provider Internals

## 🔹 After `terraform init`:

* `.terraform` folder create hota hai

* Provider binary download hota hai:

  * `azurerm.exe`

* Version lock hota hai:

```text
terraform.lock.hcl
```

---

# 🧱 Terraform = Blocks

👉 Terraform works on **block-based structure**

## 🔹 Types of Blocks:

* `terraform {}`
* `provider {}`
* `resource {}`

📌 Analogy:

* Blocks = Building components 🧱

  * Foundation
  * Walls
  * Flooring

---

# 🏗️ Resource Block (Most Important)

## 🔹 Usage:

👉 Whenever you want to create something in cloud

### Example:

```hcl
resource "azurerm_resource_group" "sona-rg" {
  name     = "sona-rg"
  location = "West Europe"
}
```

---

# 🧠 Terraform Core Concept

## 🔹 Code = Truth

👉 “Code hi Satya hai”

* Jo `.tf` file me likha hai wahi desired state hai

---

# 🔄 Terraform Plan Logic

## 🔹 What happens internally:

1. `.tf` files scan karta hai
2. Resource blocks identify karta hai
3. Compare karta hai:

```text
Code (Desired State)
        vs
State File (Brain)
        vs
Cloud (Actual Infra)
```

---

# 🧠 Terraform State Concept

## 🔹 Key Idea:

```text
Code (.tf) = Desired State
State (.tfstate) = Memory / Brain
Cloud = Reality
```

---

## 🔹 Zero Drift Condition

👉 Perfect scenario:

```text
Code = State = Cloud
```

📌 Called:

* **Zero Drift State**

---

## 🔹 Drift Problem

👉 Jab mismatch hota hai:

* Manual change in Azure
* Terraform unaware

📌 Result:

* Terraform tries to fix it

---

# 📊 Terraform Internal Flow Summary

```text
Write Code (.tf)
        ↓
terraform init
        ↓
Provider download (.terraform)
        ↓
terraform fmt / validate
        ↓
terraform plan
        ↓
Compare (Code vs State vs Cloud)
        ↓
terraform apply
        ↓
Update terraform.tfstate
```

---

# ⚠️ Important Insights from Notes

* Terraform `.tf` file ko scan karta hai
* Provider registry se download hota hai
* `.lock` file version fix karta hai
* Resource block = actual cloud resource
* Terraform continuously compare karta hai state

---

# 📝 Key Takeaways

* Start learning **3-tier architecture**
* Terraform is **declarative automation tool**
* `.tf` file = desired infra
* `.tfstate` = brain
* Provider = bridge
* Plan = preview
* Apply = execution
* Drift detection = core strength