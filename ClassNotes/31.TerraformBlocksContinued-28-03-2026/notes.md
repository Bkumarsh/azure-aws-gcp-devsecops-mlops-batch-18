# 📘 DevOps Insiders – Batch 18 Notes

## 🔹 Class Context

* **Main Classes:** Saturday & Sunday – 8:30 PM IST (Mandatory)
* **Recap Classes:** Sunday – 1 PM to 5 PM
* Technical sessions start around **8:45 PM**

---

# ☁️ Azure Cloud Basics

## 🔹 Azure Hierarchy

Azure resources follow a structured hierarchy:

```
Tenant Root Group
   ↓
Subscription
   ↓
Resource Group
   ↓
Resources
```

### 🔸 Key Components:

* **Tenant Root Group**

  * Top-level container (organization level)
* **Subscription**

  * Billing boundary (example: ₹18000 subscription)
* **Users & Roles**

  * Example:

    * `Global Admin` (full control)
    * `Owner`
    * `Contributor`

---

# 👤 Role-Based Access Example

* **Global Admin** → Full control over tenant
* **Owner** → Full access to subscription
* **Contributor** → Can create/manage resources but limited permissions

---

# 📦 Resource Groups (RG)

## 🔹 What is a Resource Group?

* Logical container for resources in Azure
* Helps in:

  * Organization
  * Access control
  * Lifecycle management

---

## 🔹 Ways to Create Resource Groups

### 1. ClickOps (Manual)

* Using Azure Portal (UI-based)

### 2. Automation

* Using Infrastructure as Code (IaC)

---

# ⚙️ Infrastructure as Code (IaC)

## 🔹 Two Approaches:

### 🟢 Imperative

* Step-by-step instructions
* Example: "First create RG → then VM → then storage"

### 🔵 Declarative (Used by Terraform)

* Define **desired state**
* Example: "I want 50 resources (pizza analogy 🍕)"

---

# 🌍 Terraform Basics

## 🔹 What is Terraform?

* IaC tool used to automate cloud resource provisioning

---

## 🔹 Installation Requirements

* Install:

  * Terraform
  * VS Code
  * Terraform Extension in VS Code

---

# 🔌 Terraform Provider

## 🔹 What is a Provider?

* Acts as a **bridge between Terraform and Cloud**
* (In your notes: “Provider is a dalla” 😄 → meaning mediator)

### Examples:

* Azure → `azurerm`
* AWS → `aws`
* GCP → `google`

---

## 🔹 Important Point

* ❌ No need to run `az login` for provider installation
* Provider is defined in code

---

# 🧾 Terraform Configuration Language (HCL)

## 🔹 HCL Basics

* Terraform uses **HCL (HashiCorp Configuration Language)**
* Code is written using **blocks**

---

## 🔹 Types of Blocks

### 1️⃣ Simple Block

```
block {
  argument
}
```

### 2️⃣ Single Label Block

```
block "label1" {
  argument
}
```

### 3️⃣ Double Label Block

```
block "label1" "label2" {
  argument
}
```

---

## 🔹 Nested Blocks

* Block inside another block

```
parent {
   child {
   }
}
```

---

# 📦 Terraform Core Blocks

## 🔹 1. Terraform Block

Defines required providers

## 🔹 2. Provider Block

Configures cloud provider

## 🔹 3. Resource Block

Defines actual resources

---

# 🏗️ Resource Creation in Terraform

## 🔹 Key Concept

👉 **1 Resource Block = 1 Real Cloud Resource**

---

## 🔹 Example: Azure Resource Group

```
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}
```

---

## 🔹 Breakdown:

* `resource` → Block type
* `"azurerm_resource_group"` → Resource type
* `"example"` → Resource name (logical name in Terraform)
* `name` & `location` → Arguments

---

# 📁 Multiple Resources Example

```
resource "azurerm_resource_group" "rg1" { ... }
resource "azurerm_resource_group" "rg2" { ... }
resource "azurerm_resource_group" "rg3" { ... }
```

👉 Each block creates a separate Resource Group

---

# 📌 Important Notes

* `.tf` → Terraform file extension
* Example file name: `azuredaud.tf`
* Terraform internally uses binaries like:

  * `terraform.exe`
  * `azurerm.exe`, `aws.exe`, `gcp.exe`

---

# 🧠 Key Takeaways

* Azure hierarchy is critical for understanding deployments
* Terraform uses **declarative approach**
* Providers connect Terraform to cloud
* HCL is block-based language
* Each resource block maps to a real cloud resource
