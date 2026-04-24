terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-mango"
    storage_account_name = "devopsinsidersstates"
    container_name       = "bluedrum"             
    key                  = "bluedrum.tfstate"     
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = "rg-mango"
  location = "West US"
}

resource "azurerm_resource_group" "rg3" {
  name     = "rg-orange"
  location = "West US"
}

resource "azurerm_resource_group" "rg4" {
  name     = "rg-avocardo"
  location = "West US"
}

resource "azurerm_resource_group" "rg5" {
  name     = "rg-bhindi"
  location = "West US"
}
