terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
  backend "azurerm" {
    use_cli              = true                                   # Can also be set via `ARM_USE_CLI` environment variable.
    use_azuread_auth     = true                                   # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "0f7010fd-209e-4344-8457-043ffb37143b" # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "insiderstfstatestorage"               # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "bluedrum"                             # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "blue.terraform.tfstate"               # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "rg-chintu"
  location = "West US"
}

resource "azurerm_resource_group" "resource_group1" {
  name     = "rg-minku"
  location = "West US"
}