# Terraform Variables – Complete Notes

The diagram explains how **Terraform variables work**, especially how we make infrastructure dynamic instead of hardcoding values.

---

# 1) Basic Resource Block

Example resource:

```hcl
resource "azurerm_resource_group" "resource_group" {
  name     = var.rg_name
  location = var.rg_location
}
```

Here:

* `azurerm_resource_group` = Azure Resource Group resource type
* `"resource_group"` = local Terraform name
* `name` and `location` should not be hardcoded ideally
* Instead, values should come from variables



---

# 2) Variable Means "Dabba" (Container)

Variable is like a **box (dabba)** where value is stored.

First variable must be declared:

```hcl
variable "rg_name" {}
```

This means:

Terraform now knows that one variable called `rg_name` exists.

Similarly:

```hcl
variable "rg_location" {}
```



---

# 3) Using Variable Value

To use variable inside resource:

```hcl
var.rg_name
```

and

```hcl
var.rg_location
```

Rule:

Every variable usage starts with:

```hcl
var.
```

So:

```hcl
name = var.rg_name
location = var.rg_location
```



---

# 4) Default Value in Variable

You can assign default value inside variable block.

Example:

```hcl
variable "rg_name" {
  default = "elephant"
}
```

Example:

```hcl
variable "rg_location" {
  default = "westus"
}
```

Meaning:

If user does not pass any value, Terraform automatically uses default.



---

# 5) Override Default Value from CLI

Default value can be overridden from command line:

```bash
terraform apply -var="rg_name=ghoda" -var="rg_location=eastus"
```

Now:

Terraform ignores default and uses CLI value.

Priority becomes:

CLI value > default value



---

# 6) Override Using terraform.tfvars

Create file:

```hcl
terraform.tfvars
```

Inside:

```hcl
rg_name     = "ghoda"
rg_location = "eastus"
```

Terraform automatically reads this file.

No need to mention manually.



---

# 7) Variable Priority Order

Terraform variable priority:

1. CLI `-var`
2. terraform.tfvars
3. default value inside variable block

Highest priority always wins.

---

# 8) Real Interview Question

Why variables are used?

Answer:

* To avoid hardcoding
* To reuse code
* To support multiple environments
* To make modules flexible

---

# 9) Production Best Practice

Normally:

* `variables.tf` → only variable declaration
* `terraform.tfvars` → actual values
* `main.tf` → resource logic

Structure:

```bash
main.tf
variables.tf
terraform.tfvars
```