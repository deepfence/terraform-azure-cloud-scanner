# declares provider

provider "azurerm" {
  features {}
  subscription_id = "aeca76e8-1861-4aed-b28a-b8c48923f89b"
}

# creates resource group

module "infrastructure_resource_group" {
  source = "../../modules/infrastructure/resource_group"
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  
}