# validation to create resource group 

locals {
  deploy_resource_group = var.resource_group_name == ""
}

# creates resource group if not created

resource "azurerm_resource_group" "rg" {
  count    = local.deploy_resource_group ? 1 : 0
  name     = "${lower(var.name)}-resourcegroup"
  location = var.location

  tags = var.tags
}
