terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mango" {
  name      = "rg-mango"
  location   = "West Europe"
}

resource "azurerm_storage_account" "fruits" {
    depends_on = [ azurerm_resource_group.mango ]
  name                     = "fruitskastorage"
  resource_group_name      = "rg-mango"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
