# 📘 Terraform – Comprehensive Notes

## 1. Terraform Basics

### 🔹 What is Terraform?

Terraform is an **Infrastructure as Code (IaC)** tool used to create and manage cloud resources using `.tf` configuration files.

---

## 2. Terraform Core Components

### 📁 1. `.tf` Files

* These are **configuration files** where infrastructure is defined.
* Example:

```hcl
resource "azurerm_resource_group" "rg1" {
  name     = "rg-mango"
  location = "East US"
}
```

---

### 🔹 2. Blocks in Terraform

#### a) **Provider Block**

* Defines which cloud you are using (Azure, AWS, etc.)

```hcl
provider "azurerm" {
  features {}
}
```

---

#### b) **Resource Block**

* Each resource block = **1 cloud resource**
* Example:

```hcl
resource "azurerm_resource_group" "rg1" {}
resource "azurerm_resource_group" "rg2" {}
```

---

#### c) **Backend Block**

* Used to configure **remote state storage**
* Example:

```hcl
terraform {
  backend "azurerm" {}
}
```

---

## 3. Terraform Workflow

### ⚙️ Step 1: `terraform init`

* Searches `.tf` files in the folder
* Downloads provider (e.g., `azurerm`)
* Creates:

  * `.terraform/` folder
  * `.terraform.lock.hcl` (version locking)

---

### ⚙️ Step 2: `terraform plan`

* Compares:

  * `.tf file (desired state)`
  * `state file (current known state)`
  * `actual cloud (real state)`
* Output:

  * What will be created/updated/deleted

---

### ⚙️ Step 3: `terraform apply`

* Executes the plan
* Creates resources in cloud
* Updates **state file**

---

## 4. Terraform State File

### 📄 What is State File?

* Stores mapping of:

  ```
  Resource in code  →  Resource in cloud
  ```
* Example:

  ```
  azurerm_resource_group.rg1
  azurerm_resource_group.rg2
  ```

---

### 🔹 State File Responsibilities

1. Tracks resources
2. Maintains infrastructure history
3. Helps Terraform detect changes

---

## 5. Terraform Execution Logic

### 🔁 During `terraform apply`

1. Reads `.tf` files
2. Lists all resource blocks
3. Reads state file
4. Checks actual cloud resources
5. Performs actions

---

## 6. Key Concepts

---

### ⚖️ Refresh

```
Refresh = Cloud - State
```

* Syncs Terraform state with actual cloud
* Detects manual changes

---

### 📊 Plan

```
Plan = Desired - Current
```

* Shows:

  * `+` → Add
  * `-` → Destroy
  * `~` → Modify

---

## 7. Scenarios

---

### ✅ Scenario 1: Add New Resource

* Add new block in `.tf`
* Result:

  ```
  Plan: +1 resource
  ```
* Terraform creates resource + updates state

---

### ❌ Scenario 2: Remove Resource Block

* Delete block from `.tf`
* Result:

  ```
  Plan: -1 resource
  ```
* Terraform destroys resource from cloud

---

### ⚠️ Scenario 3: Resource Deleted from Portal

* Resource removed manually from Azure
* Result:

  ```
  Drift detected
  ```
* Terraform:

  * Recreates resource OR
  * Updates state (depending on command)

---

### 🎯 Ideal State

```
Input (.tf) = State = Cloud
→ Zero Drift State
```

---

## 8. Team Collaboration Problem

### ❗ Problem

* Multiple users (Chintu, Mintu, Tinku)
* Each runs Terraform locally
* Different state files → **conflicts**

---

## 9. Remote Backend (Solution)

### 📦 What is Remote Backend?

* Store `.tfstate` in **central storage (Azure Storage Account)**

---

### ✅ Advantages

1. 👥 Multiple users share same state
2. 🔐 Secure storage
3. ♻️ High availability (replication)
4. 🔒 State locking

---

## 10. State Locking

### 🔒 What is State Locking?

* Prevents multiple users from running Terraform at same time

---

### ⚙️ How it Works

* User A runs `terraform apply`
* State file is **locked**
* User B cannot run Terraform until unlock

---

### 🔓 Commands

#### Lock (automatic)

```
terraform apply
```

#### Force Unlock

```
terraform force-unlock LOCK_ID
```

Example:

```
terraform force-unlock 84300268-4be5-d0be-62b2-7736ee74555d
```

---

### 🧠 Azure Specific

* Uses **Blob Storage lease mechanism**
* Force unlock = break lease

---

## 11. Real-World Flow (Team Setup)

1. Code → GitHub
2. State → Azure Storage Account
3. Team runs:

   * `terraform init`
   * `terraform plan`
   * `terraform apply`
4. Locking ensures safe execution

---

## 12. Important Interview Questions

### ❓ Why use Remote Backend?

✔ Multiple users access same state
✔ Prevents conflicts
✔ Secure storage
✔ High availability
✔ State locking

---

### ❓ What happens if state file is corrupted?

* Infrastructure tracking breaks
* Possible solutions:

  * Restore from backup
  * Import resources again
  * Recreate state manually

---

## 13. Key Takeaways

* Terraform works on **Desired vs Current state**
* State file is the **brain of Terraform**
* Remote backend is **mandatory in real projects**
* State locking prevents **race conditions**
* Always aim for:

```
No Drift → Stable Infra
```
