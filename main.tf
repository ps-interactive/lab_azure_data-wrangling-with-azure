provider "azurerm" {
  features {}
}

module "cosmosdb" {
  source = "./azurerm/cosmosdb"
}

module "resource_group" {
  source = "./azurerm/resource_group"
}

module "storage_account" {
  source = "./azurerm/storage_account"
}

module "storage_container" {
  source = "./azurerm/storage_container"
}

variable "location" {
  type = string
  default = "eastus"
}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
  number = true
}
