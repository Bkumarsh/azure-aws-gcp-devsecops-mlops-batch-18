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

resource "azurerm_resource_group" "jaklin-ka-rg" {
  name     = "rg-jaklin-jila-top-lagelu"
  location = "West Europe"
}

resource "azurerm_storage_account" "jaklin-ka-locker" {
  name                     = "jaklinjewellerystore"
  resource_group_name      = azurerm_resource_group.jaklin-ka-rg.name
  location                 = azurerm_resource_group.jaklin-ka-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
