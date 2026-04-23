# Terraform Comprehensive Notes – Blocks, Provider, State File, Plan, Refresh, Apply

The diagram explains how Terraform internally works from the moment a `.tf` file is written until infrastructure is created and synchronized with cloud resources. It also explains what happens when code changes, resources are deleted manually, or infrastructure drifts from state. 

---

# 1. Terraform Architecture Overview

Terraform itself acts like an engine:

```plaintext
terraform.exe
```

This engine does not create infrastructure directly.

Instead, it uses providers like:

* Azure → azurerm
* AWS → aws
* GCP → google

Meaning:

Terraform delegates actual cloud work to provider plugins.

So flow becomes:

```plaintext
Terraform Core → Provider Plugin → Cloud API
```

This is why Terraform is called:

> Infrastructure orchestration engine



---

# 2. Terraform Philosophy – Blocks Build Infrastructure

Diagram says:

> Block se block jude aur terraform in infra bane
> Block se block jude aur building bane

Meaning:

Terraform infrastructure is built by combining blocks.

Everything in Terraform is block-based.

---

# 3. Terraform Block Syntax

Terraform supports multiple block structures.

---

## Single Label Block

```hcl id="e1c52"
block_name "label" {
  argument = value
}
```

Example:

```hcl id="l9w14"
resource "azurerm_resource_group" "rg1" {
  name = "myrg"
}
```

---

## No Label Block

```hcl id="8cw7d"
block_name {
  argument = value
}
```

Used in blocks like:

```hcl id="f5xgk"
terraform {
}
```

---

## Two Label Block

```hcl id="f7skg"
block_name "label1" "label2" {
}
```

Some advanced providers/modules use this.



---

# 4. Important Terraform Blocks

Main Terraform blocks shown in diagram:

---

# Terraform Block

Purpose:

Defines:

* Required providers
* Terraform version
* Backend details

Example:

```hcl id="wnm26"
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
```

Meaning:

This tells Terraform:

> Which provider to download

---

# Provider Block

Purpose:

Configures provider after installation.

Example:

```hcl id="q0j5f"
provider "azurerm" {
  features {}
}
```

Meaning:

* Provider installed already
* Features enabled here

Diagram says:

> jo bhi provider install kia uska feature enable karne ka kaam



---

# Resource Block

This is actual infrastructure definition.

Example:

```hcl id="m9n1g"
resource "azurerm_resource_group" "rg1" {
  name = "rg-demo"
  location = "West Europe"
}
```

This block tells provider:

> Create actual cloud resource

---

# 5. Terraform Execution Flow

Terraform reads file step by step.

---

# terraform init – Internal Working

When running:

```bash id="t7r4x"
terraform init
```

Terraform performs:

---

## Step 1

Looks inside current folder for:

```plaintext
*.tf files
```

---

## Step 2

Searches for:

```plaintext
terraform block
```

---

## Step 3

Reads provider details

---

## Step 4

Downloads provider from internet

---

## Step 5

Creates:

```plaintext
.terraform folder
```

Inside this folder provider binaries are stored.

Diagram explains exactly:

> Terraform block me jo provider detail hogi, provider download hoga aur .terraform folder banega



---

# 6. terraform plan – Internal Working

When running:

```bash id="q3w9s"
terraform plan
```

Terraform performs:

---

## Step 1

Reads `.tf` file

---

## Step 2

Finds all resource blocks

---

## Step 3

Builds resource list

---

## Step 4

Compares with state file + cloud

---

## Step 5

Shows execution plan

Meaning:

Plan never creates anything.

It only predicts.

---

# 7. Core Terraform Equation

Diagram explains:

```plaintext
.tf file = desired state
.tfstate = current known state
Cloud = actual reality
```

Terraform continuously tries to make:

```plaintext
Desired = Actual
```

This is Terraform’s central principle.



---

# 8. Code Hi Satya Hai (Most Important Terraform Principle)

Diagram clearly says:

> Code hi satya hai

Meaning:

Terraform always trusts:

```plaintext
.tf code
```

Not portal.

Not manual changes.

Code is final truth.

---

# 9. State File Role in Execution

Terraform stores resource entries in:

```plaintext
terraform.tfstate
```

Example entries:

* rg2 block
* rg3 block
* rg4 block

State file stores:

* Resource IDs
* Metadata
* Current Terraform tracking

---

# 10. Refresh Operation Explained

Diagram shows:

# Refresh = Portal + State File Equilibrium

Terraform refresh checks:

Cloud actual state vs state file.

---

## Refresh Purpose

If portal changed manually:

Terraform updates state understanding.

---

# Terraform Plan Internal Formula

Diagram says:

```plaintext
Terraform plan = terraform refresh + terraform plan
```

Meaning:

Before planning:

Terraform refreshes actual state first.



---

# Terraform Apply Internal Formula

Diagram explains:

```plaintext
Terraform apply = terraform refresh + terraform plan + approval + apply
```

Meaning apply internally does:

1. Refresh
2. Plan
3. Approval
4. Apply

---

# 11. Scenario-Based Terraform Behavior

---

# Scenario 1 – New Resource Added in .tf File

Suppose new block added:

```hcl id="8g2kq"
resource "azurerm_resource_group" "rg4" {
}
```

Terraform behavior:

* Detects new block
* Creates in portal
* Adds entry in state file

Diagram says:

> Terraform usko portal pr create karta hai aur state file me entry kar leta hai

---

# Scenario 2 – Resource Removed from Code

Suppose rg3 removed from code.

Terraform sees:

Present in state
Absent in code

Result:

Terraform plans destroy.

Portal resource deleted.

State entry removed.

---

# Scenario 3 – Portal Deletion Done Manually

Suppose resource deleted manually from Azure Portal.

Terraform next plan:

* Refresh happens
* Detects missing resource
* Plan shows recreate

Diagram says:

> Refresh hoga and firse plan hoga

Meaning Terraform restores missing resource.



---

# Scenario 4 – Resource Updated

Suppose immutable property changed.

Terraform behavior:

Sometimes:

```plaintext
Destroy + Recreate
```

Diagram says:

> Replace hoke recreate ho jaega

Because some properties cannot update directly.

---

# 12. Compare Phase

Diagram also shows:

# Compare

Terraform compares:

```plaintext
.tf file
vs
.tfstate
vs
Cloud
```

This comparison generates plan output.

---

# 13. Why Manual Portal Changes Are Dangerous

Because next Terraform run will override them.

Reason:

Terraform trusts code only.

---

# 14. Real Production Golden Rule

Never do manual cloud changes after Terraform adoption.

Always update code first.

---

# 15. Why terraform destroy Is Dangerous

Diagram humorously says:

> Nadi kinare saanp hai aur terraform destroy chalana paap hai 🐍

Meaning:

Destroy removes everything tracked by Terraform.

Very dangerous in production.

---

# 16. Interview Golden Answer

If interviewer asks:

**What does terraform plan actually do internally?**

Answer:

> Terraform first refreshes current state by checking actual cloud resources against state file, then compares desired infrastructure written in .tf files, and finally generates execution actions like create, update, delete, or replace.

---

# 17. Easy Memory Trick

Remember:

```plaintext
Init = Download tools
Plan = Predict changes
Apply = Execute changes
State = Memory
Refresh = Reality check
```
