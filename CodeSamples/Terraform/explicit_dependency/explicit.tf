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

resource "azurerm_resource_group" "malaika-ka-rg" {
  name     = "rg-malaika-jila-top-lagelu"
  location = "West Europe"
}

resource "azurerm_storage_account" "malaika-ka-locker" {
  depends_on               = [ azurerm_resource_group.malaika-ka-rg ]
  name                     = "malaikajewellerystore"
  resource_group_name      = "rg-malaika-jila-top-lagelu"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
