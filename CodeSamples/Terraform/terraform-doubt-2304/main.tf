terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "mangostates7"
    container_name       = "tfstate"
    key                  = "changu.tfstate"
  }
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "changu" {
  name     = "rg-changu"
  location = "West Europe"
}

resource "azurerm_resource_group" "mangu" {
  name     = "rg-mangu"
  location = "West Europe"
}

resource "azurerm_resource_group" "ganju" {
  name     = "rg-ganju"
  location = "West Europe"
}


resource "azurerm_resource_group" "tinku" {
  name     = "rg-tinku"
  location = "West Europe"
}