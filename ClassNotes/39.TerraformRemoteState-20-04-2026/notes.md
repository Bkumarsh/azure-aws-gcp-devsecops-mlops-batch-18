# Terraform on Azure – Resource Group and Storage Account Notes

---

# 1. Objective of This Setup

The goal is to use Terraform to create on Microsoft Azure:

* Resource Group
* Storage Account

This is usually the **first practical Terraform lab on Azure** because:

* Resource Group is the basic container in Azure
* Storage Account is required later for backend setup

---

# 2. Prerequisites Before Running Terraform

Before starting, certain prerequisites must be completed.

---

## Azure Access Requirement

You must have at least:

# Contributor Role on Azure Subscription

Why contributor role?

Because Terraform needs permission to:

* create resources
* update resources
* delete resources

Without contributor rights, Terraform apply will fail with authorization errors.

---

## Minimum Tools Required

Install these tools first:

---

### 1. Visual Studio Code

Used for writing `.tf` files.

---

### 2. Terraform

Main engine that executes infrastructure code.

Check installation:

```bash
terraform version
```

---

### 3. Terraform Extension in VS Code

Used for:

* syntax highlighting
* autocomplete
* formatting

---

### 4. Azure CLI

Used for Azure authentication.

Check installation:

```bash
az version
```

---

# 3. Folder Structure

Create one working folder:

```text
LZ
```

LZ generally means:

# Landing Zone

Inside folder:

```text
main.tf
```

---

# Why main.tf?

Terraform reads all `.tf` files, but `main.tf` is standard naming.

Example structure:

```text
LZ/
 ├── main.tf
```

---

# 4. Azure Authentication Before Terraform

Before running Terraform, login to Azure:

```bash
az login
```

This connects local Terraform execution with Azure subscription.

---

## Why Azure CLI Login is Needed?

Terraform provider uses Azure CLI token automatically.

Meaning:

Terraform internally takes auth token from Azure CLI.

---

# 5. Azure Provider Installation

Terraform needs provider to understand Azure APIs.

Provider used:

# azurerm

---

## Provider Block Example

```hcl
provider "azurerm" {
  features {}
}
```

---

## Meaning

* `azurerm` = Azure Resource Manager provider
* `features {}` = mandatory empty block for provider initialization

---

# What Happens During terraform init?

Command:

```bash
terraform init
```

Terraform:

* checks provider block
* downloads Azure provider
* stores provider locally

Inside folder created:

```text
.terraform/
```

---

# Lock File Also Created

```text
.terraform.lock.hcl
```

Purpose:

Locks provider version.

---

# 6. Creating Resource Group

Terraform resource block:

```hcl
resource "azurerm_resource_group" "rg1" {
  name     = "rg-demo"
  location = "Central India"
}
```

---

## Explanation

### resource

Terraform keyword for creating infra.

---

### azurerm_resource_group

Azure resource type.

---

### rg1

Terraform local name.

---

### name

Actual Azure name.

---

---

# 7. Creating Storage Account

Terraform resource block:

```hcl
resource "azurerm_storage_account" "st1" {
  name                     = "storagedemo12345"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

---

# Important Dependency Concept

Storage account depends on resource group.

Terraform automatically understands dependency through reference:

```hcl
azurerm_resource_group.rg1.name
```

---

# This Means

First create RG → then Storage Account

---

# 8. Full Execution Flow

---

## Step 1

Initialize:

```bash
terraform init
```

---

## Step 2

See plan:

```bash
terraform plan
```

---

## Step 3

Create resources:

```bash
terraform apply
```

---

# Terraform Internal Logic

Terraform compares:

```text
Code vs State vs Azure Cloud
```

---

If state empty and Azure empty:

Terraform creates everything.

---

# 9. State File Concept

When apply runs:

Terraform creates:

```text
terraform.tfstate
```

---

## State file stores:

* created resource IDs
* metadata
* dependencies
* exact cloud mapping

---

# Why State File is Important?

Terraform cannot manage infra without state.

---

# 10. Very Important Warning ⚠️

Your PDF says:

> Terraform destroy chalana mahapaap hai 😄

Meaning:

Be careful with:

```bash
terraform destroy
```

Because it deletes all resources managed by state.

---

## In company environments

Destroy without review can remove:

* production resource groups
* databases
* networking

---

# 11. Problem with Local State File

By default:

```text
terraform.tfstate
```

is stored locally.

Problem:

* only one user sees latest state
* team conflict happens
* local machine failure risk

---

# 12. Remote Backend Concept

To solve this:

Move state file to Azure Storage Account.

This is called:

# Backend Setup

---

# Definition

Backend block moves state file from:

```text
Local → Remote Storage
```

---

# Backend Block Example

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-backend"
    storage_account_name = "tfstateprod001"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}
```

---

# What Backend Does

It uploads:

```text
terraform.tfstate
```

to Azure Blob Storage.

---

# Internal Working

Your PDF line:

> Backend block ek aisa block hai jo state file ko local se utha ke remote pr le jata hai

Exactly correct.

---

# 13. Why Azure Storage for Backend?

Because Microsoft Azure Storage provides:

## 99.99% SLA

Meaning highly reliable storage.

---

## Advantages

---

### 1. Shared by team

Multiple engineers use same state.

---

### 2. Secure

Azure blob encryption.

---

### 3. Durable

Replicas maintained.

---

### 4. Supports locking

Prevents simultaneous apply.

---

# 14. Backend Migration Command

After backend block added:

Run:

```bash
terraform init
```

Again.

Terraform asks:

```text
Move existing state to backend?
```

Answer:

```text
yes
```

---

# Then local state becomes remote.

---

# 15. Interview Question ⭐

Why backend needed?

Best answer:

> Backend is used to securely store Terraform state remotely so that multiple team members can work safely using one consistent infrastructure state.

---

# 16. Practical Company Flow

Real company flow:

```text
Laptop → Git → Pipeline → Terraform → Azure Backend → Azure Resources
```

---

# 17. Golden Interview Line ⭐

Say this confidently:

> Terraform first authenticates to Azure using Azure CLI, downloads azurerm provider, reads resource blocks, compares desired state with current state, and then provisions Azure resources.