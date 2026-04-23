# Terraform Comprehensive Notes – Dependency, State File, Remote Backend, Azure Pipeline

The diagram explains the journey from **basic Terraform execution** to **production-grade Terraform usage with remote state and dependency handling in Azure**. 

---

# 1. Kahani Ab Tak – What Has Been Learned So Far

Till this stage, the learning journey covers:

* Creating **Azure Resource Group (RG)** using Terraform
* Understanding Terraform files:

  * `.tf` file → infrastructure code
  * `terraform.tfstate` → actual infrastructure record
* Running core Terraform commands:

  * `terraform init`
  * `terraform plan`
  * `terraform apply`
* Storing code in GitHub
* Connecting Terraform execution with Azure

This is the basic foundation before moving toward remote backend and dependency concepts. 

---

# 2. Terraform Files Explained

## Terraform Code File (.tf)

This file contains infrastructure definition.

Example:

```hcl
resource "azurerm_resource_group" "mango" {
  name     = "rg-mango"
  location = "West Europe"
}
```

This tells Terraform:

> "Create this resource in Azure."

---

## terraform.tfstate File

This file stores:

* What Terraform created
* Resource IDs
* Current infrastructure mapping
* Terraform tracking information

Without state file Terraform cannot know:

* Existing resources
* What changed
* What needs update/delete

Think of state file as:

> Terraform ka memory card



---

# 3. Why State File Is Important

State file tells Terraform:

* Resource already exists
* Which values changed
* Which resources need modification

Without state:

Terraform behaves blind.

---

# 4. Problem with Local State File

Initially state file remains local:

```plaintext
terraform.tfstate → local machine
```

Problem:

If laptop lost / deleted / another engineer works:

State file lost.

That creates:

* Drift
* Duplicate infra
* Team conflict

Therefore production uses:

# Remote Backend



---

# 5. Remote Backend in Azure Storage Account

State file should move to:

```plaintext
Azure Storage Account
```

Because:

* Centralized
* Secure
* Team accessible
* Locking possible

---

# 6. Important Catch – Storage Account Needs Resource Group First

Azure rule:

Storage Account cannot exist without Resource Group.

So requirement becomes:

```plaintext
1 Resource Group
1 Storage Account
```

Order matters.



---

# 7. Terraform Dependency Problem

Suppose we write:

```hcl
resource "azurerm_resource_group" "mango" {
  name = "rg-mango"
}

resource "azurerm_storage_account" "fruits" {
  name = "fruitskastorage"
}
```

Terraform by default tries:

```plaintext
Both in parallel
```

Result:

```plaintext
Creating...
Creating...
```

Because Terraform is parallel by design.

---

# 8. Why Parallel Creation Causes Problem

Storage account needs RG first.

But Terraform may attempt both simultaneously.

This can fail because:

```plaintext
Resource Group not ready yet
```



---

# 9. Terraform Dependency Types

Diagram clearly shows two dependency models:

---

# Internal Dependency (Implicit Dependency)

Terraform automatically detects dependency when one resource references another.

Example:

```hcl
resource_group_name = azurerm_resource_group.mango.name
```

Terraform understands:

```plaintext
Storage account depends on RG
```

No extra instruction needed.

---

## Full Example – Implicit Dependency

```hcl
resource "azurerm_resource_group" "mango" {
  name     = "rg-mango"
  location = "West Europe"
}

resource "azurerm_storage_account" "fruits" {
  name                     = "fruitskastorage"
  resource_group_name      = azurerm_resource_group.mango.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

Terraform automatically executes:

1. RG first
2. Storage second



---

# 10. External Dependency (Explicit Dependency)

When no direct attribute reference exists, use:

```hcl
depends_on
```

---

# depends_on Is Meta Argument

Meta argument means:

A special Terraform argument usable inside resource blocks to control behavior.

Example:

```hcl
depends_on = [ azurerm_resource_group.mango ]
```

This explicitly says:

> First create RG, then create storage account.

---

## Full Example – Explicit Dependency

```hcl
resource "azurerm_resource_group" "mango" {
  name     = "rg-mango"
  location = "West Europe"
}

resource "azurerm_storage_account" "fruits" {
  depends_on               = [ azurerm_resource_group.mango ]
  name                     = "fruitskastorage"
  resource_group_name      = "rg-mango"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```



---

# 11. Implicit vs Explicit Dependency

| Type     | How Created               | Recommended      |
| -------- | ------------------------- | ---------------- |
| Implicit | Reference resource output | Best             |
| Explicit | depends_on                | Only when needed |

---

## Why Implicit Preferred

Because:

* Cleaner code
* Automatic graph generation
* Better maintainability

---

# 12. Dependency Creates Terraform Graph

Terraform internally creates:

```plaintext
Execution graph
```

This decides:

Which resource first
Which resource later

---

# 13. Terraform Execution Journey in Real Life

Diagram shows:

---

## Step 1

Developer writes `.tf`

---

## Step 2

Push to GitHub

---

## Step 3

Azure Pipeline triggers

---

## Step 4

Pipeline runs:

```bash
az login
terraform init
terraform plan
terraform apply
```

---

## Step 5

Resources created in Azure

---

## Step 6

State file stored remotely



---

# 14. Azure Pipeline Role

Azure Pipeline automates Terraform.

Instead of local laptop:

Pipeline does:

```plaintext
Authentication
Init
Plan
Apply
```

---

## Typical Flow

```bash
az login
terraform init
terraform plan
terraform apply
```

---

# 15. Why Remote Backend Needed Before Pipeline

Because pipeline agents are temporary.

Without remote backend:

Each run loses state.

Therefore:

State must stay in storage account.

---

# 16. Practical Real Production Order

Correct order:

---

## First create manually or bootstrap:

* Resource Group
* Storage Account

---

## Then configure backend:

```hcl
backend "azurerm" {
}
```

---

## Then rest infra uses remote state

---

# 17. One Very Important Production Concept

Storage account itself cannot depend on backend stored inside itself initially.

So bootstrap needed.

This is called:

# Bootstrap Infrastructure

---

# 18. Teaching Shortcut (Very Easy Line)

You can explain like this:

> Terraform code infra banata hai, state file infra ko yaad rakhta hai, aur dependency ensure karti hai ki resources sahi order me bane.

---

# 19. Interview Important Answer

If interviewer asks:

**Why depends_on if implicit already exists?**

Answer:

> Implicit dependency works only when Terraform can detect resource reference. If no attribute reference exists but logical dependency exists, then explicit depends_on is used.

---

# 20. Golden Production Practice

Always prefer:

✅ Implicit dependency
Use explicit only when necessary