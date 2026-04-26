# Terraform + Interview Preparation Plan Notes

## 1) Career Execution Plan (1 May – 7 May)

The diagram begins with a practical execution plan for all learners:

* Between **1 May and 7 May**, everyone should start giving interviews.
* Initial target should be **small companies**, because:

  * interview rounds are faster,
  * selection probability is higher,
  * confidence builds quickly.
* Before interviews:

  * Resume must be ready
  * Naukri.com profile must be updated
  * LinkedIn profile must be optimized

### Immediate Goal

First priority is:

* **Immediate joiners should enter jobs quickly**
* Focus is not perfection first — focus is entry into market.

That means:

* start applying,
* attend interviews,
* learn while interviewing,
* improve after each rejection.

---

# 2) Crash Course Execution Strategy

## Schedule

For next **3 months**:

* Monday
* Tuesday
* Wednesday
* Friday

Time:

* **9:30 PM – 11:00 PM**

Topics:

* Azure
* Pipelines
* Terraform foundation

## Important Rule

Crash course content:

* whatever is taught here will also come later in main class slowly,
* but crash course gives fast momentum.

## Restriction

Crash course material:

* should **not be shared in Siksha Sathi groups**

Reason:

* self-study discipline is important.

## Joining Method

Use:

* Google Classroom mobile app

This allows:

* phone joining,
* mobile revision,
* quick access.

## Main Class Rule

Crash course will **not influence main class speed**.

Main class continues normally:

* slowly,
* deeply,
* structured.

---

# 3) Five Terraform Topics Everyone Must Explain in 10 Minutes

The diagram clearly says:

These 5 topics must become so strong that you can explain them in **10 minutes confidently**.

---

# Topic 1: Terraform Blocks

Terraform code is made of blocks.

Example:

```hcl
resource "azurerm_resource_group" "rg" {
  name = "my-rg"
  location = "West Europe"
}
```

## Block Structure

A block has:

* block type
* labels
* arguments

Structure:

```hcl
block_type "label1" "label2" {
 arguments
}
```

## Common Block Types

* provider
* resource
* variable
* output
* backend

---

# Topic 2: Terraform Provider

Provider means:

Terraform needs a plugin to talk to cloud.

Example Azure provider:

```hcl
provider "azurerm" {
  features {}
}
```

## Why Provider Needed?

Because Terraform itself does not know Azure APIs.

Provider gives:

* authentication
* API connection
* resource mapping

---

# Topic 3: Terraform Dependency (Implicit + Explicit)

## Implicit Dependency

Terraform automatically understands dependency when one resource uses another.

Example:

```hcl
resource_group_name = azurerm_resource_group.rg.name
```

Terraform understands:

RG first → then dependent resource

## Explicit Dependency

When Terraform cannot understand automatically:

```hcl
depends_on = [azurerm_resource_group.rg]
```

Use when:

* manual dependency needed
* hidden dependency exists

---

# Topic 4: Terraform State File (3 Scenarios)

Terraform state stores actual deployed infrastructure mapping.

File:

```bash
terraform.tfstate
```

## Why State Needed?

Terraform compares:

Desired state vs Current state

## Three Important Scenarios

### Scenario 1: Fresh Create

No state exists:

Terraform creates all resources.

### Scenario 2: Existing State Matches

No change needed.

### Scenario 3: Drift / Change

Terraform updates only difference.

---

# Topic 5: Remote State (Backend Concept)

Diagram mentions:

State file remote pe dalne ka concept = backend

## Why Remote Backend?

Local state causes issues:

* no collaboration
* overwrite risk
* no locking

## Backend Example in Azure

```hcl
backend "azurerm" {
}
```

## Benefits

* team access
* central state
* safe deployment

---

# Topic 6: State Locking

Very important in team environments.

## Why Needed?

Suppose two people run apply together:

State corruption happens.

## Locking Prevents

Only one apply at one time.

Azure backend automatically supports locking.

---

# 4) Terraform Works Like "Nanad"

Funny memory trick in diagram 😄

Terraform works like:

> Goes inside folder and checks every `.tf` file.

## Important Concept

Terraform loads all `.tf` files in same folder automatically.

Means:

These all merge logically:

* provider.tf
* main.tf
* variables.tf
* outputs.tf

## Terraform searches all blocks

Then internally builds dependency graph.

---

# 5) Pain Points (Dard Kya Hai)

Diagram says:

## Pain 1: Hardcoded Values

Bad example:

```hcl
name = "rg-prod"
```

Problem:

* inflexible
* hard to reuse

---

## Pain 2: Multiple Resource Creation Requires Copying

Without variables:

Need repeated code.

Bad:

copy same block many times.

---

# 6) Solution = Variables in Terraform

Variables solve hardcoding.

Example:

```hcl
variable "name" {}
```

Use:

```hcl
name = var.name
```

---

# Variable Flow (Very Important)

Diagram shows 3-step memory:

## Step 1: Declare

```hcl
variable "x" {}
```

## Step 2: Use

```hcl
var.x
```

## Step 3: Assign

Value can come from:

* CLI
* default value
* terraform.tfvars

---

# Value Priority Order

Highest priority:

CLI

Then:

default in variable block

Then:

terraform.tfvars

---

# Example

## Variable Declaration

```hcl
variable "name" {
}
```

## Variable Use

```hcl
resource "azurerm_resource_group" "resource_group" {
  name = var.name
  location = "West Europe"
}
```

## Variable Assignment via tfvars

```hcl
name = "rg-sapna"
```

---

# 7) Looping in Terraform

Diagram mentions:

## for_each

Used for multiple resources.

Example:

```hcl
for_each = toset(["dev","beta","prod"])
```

Useful for:

* multiple RGs
* multiple VNets
* multiple storage accounts

---

# 8) Standard Location Rule

Diagram fixes:

## west_europe for everything

Why?

Uniformity in learning.

Avoid confusion from region mismatch.

---

# 9) Concept Memory Trick: x = y and y = z then x = z

This explains chaining.

If:

A depends on B

and B depends on C

Then:

A indirectly depends on C.

Terraform graph engine handles this.

