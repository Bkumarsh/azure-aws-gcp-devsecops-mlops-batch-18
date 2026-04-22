# 📘 DevOps Insiders – Terraform Deep Dive Notes (Batch 18)

---

# 🔹 Resource ID (Important Concept)

* Every resource in Azure has a **unique identifier**
* This is called **Resource ID**

### 🧾 Example:

```
/subscriptions/{id}/resourceGroups/{rg-name}
```

👉 Example from notes:

```
/subscriptions/1075ec7a-b17a-4f37-bf3f-9d68c4506dc1/resourceGroups/madamo_ki_madam...
```

📌 Key Point:

* No two resources share the same Resource ID
* Used internally by Azure for tracking and management

---

# ⚙️ Terraform Working (Internal Flow)

## 🔁 Step-by-Step Execution

### 1️⃣ Terraform checks current directory

* Dekhta hai → kis folder me run ho raha hai

### 2️⃣ Looks for `.tf` files

* Agar `.tf` file mili → usko open karta hai

### 3️⃣ Reads configuration

* All blocks (`terraform`, `provider`, `resource`) identify karta hai

### 4️⃣ Provider detection

* Provider block dhundhta hai

### 5️⃣ Provider download

* Terraform Registry se download karta hai
* Store karta hai:

```
.terraform/
```

### 6️⃣ Version locking

* Ek lock file banata hai:

```
.terraform.lock.hcl
```

📌 Purpose:

* Same provider version maintain karna (consistency)

---

# 🔌 Terraform Components

## 🔹 Terraform CLI

* `terraform.exe` → main engine

## 🔹 Provider Plugin

* Example:

  * `azurerm.exe` → Azure provider

## 🔹 Cloud Interaction Flow

```
Terraform → Provider → Azure Resource Manager → Azure Resources
```

---

# 🌍 Azure Interaction Flow

* Terraform directly Azure se baat nahi karta
* Yeh **Azure Resource Manager (ARM)** ke through communicate karta hai

---

# 📜 Terraform Configuration (HCL)

## 🔹 Written in HCL Language

* Block-based structure
* Each block contains **arguments**

### Example:

```hcl
provider "azurerm" {
  features {}
}
```

📌 Note:

* Block ke andar jo values hoti hain → **arguments**

---

# 🏗️ Basic File Structure

### Example file:

```
dhondhu.tf
```

Contains:

* terraform block
* provider block
* resource block

---

# 🧪 Terraform Commands (Lifecycle)

---

## 🔹 1. `terraform init`

👉 Sabse important command

### What it does:

* `.tf` files scan karta hai
* Provider identify karta hai
* Registry se provider download karta hai
* `.terraform` folder create karta hai
* `.lock` file generate karta hai

---

## 🔹 2. `terraform fmt`

👉 Code formatting

* Code ko clean aur readable banata hai
* “Sundarta badhata hai” 😄

---

## 🔹 3. `terraform validate`

👉 Syntax check

* HCL code correct hai ya nahi check karta hai
* No infrastructure change

---

## 🔹 4. `terraform plan`

👉 Execution preview

* Batata hai:

  * kya create hoga
  * kya update hoga
  * kya delete hoga

📌 No actual changes yet

---

## 🔹 5. `terraform apply`

👉 Actual execution

* Infrastructure create/update karta hai
* Azure me real resources ban jate hain

---

# 📦 Example: Resource Group Creation

```hcl
resource "azurerm_resource_group" "dhondhu" {
  name     = "example-rg"
  location = "West Europe"
}
```

---

# 🧠 Terraform State Management (MOST IMPORTANT)

## 🔥 Why Terraform is Powerful?

👉 Because of **State Management**

---

## 🔹 What is Terraform State?

* File:

```
terraform.tfstate
```

* Stores:

  * Created resources ka data
  * Mapping between:

    * Terraform config
    * Real cloud resources

---

## 🔹 Role of State File

* Terraform ka **“dimaag” 🧠**
* Yeh decide karta hai:

  * kya already bana hua hai
  * kya banana hai
  * kya delete karna hai

---

## 🔹 Without State:

❌ Terraform kuch nahi kar paayega properly
❌ Duplicate resources ban sakte hain

---

# ⚠️ Important Concept

👉 “Kahi na kahi jod-ghataav ho raha hai”

Meaning:

* Terraform continuously compare karta hai:

```
Desired State (Code)
        vs
Current State (Real Infra)
```

---

# 📊 Full Terraform Workflow

```
Write Code (.tf)
      ↓
terraform init
      ↓
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
      ↓
terraform.tfstate update
```

---

# 📝 Homework (From Notes)

### ❓ Q1: Total kitne type ke blocks hote hain?

👉 Answer:

* Terraform block
* Provider block
* Resource block
* (Plus: Data block, Variable block, Output block in advanced)

---

### ❓ Q2: Terraform ka dimaag kya hai?

👉 Answer:

* `terraform.tfstate` file

---

# 🚀 Final Key Takeaways

* Terraform works by scanning `.tf` files
* Providers act as connectors
* `.terraform` folder stores plugins
* `.lock` file ensures version consistency
* `terraform plan` is preview, `apply` is execution
* **State file is the brain of Terraform**
