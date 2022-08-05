# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# creates resource group

module "infrastructure_resource_group" {
  source              = "../../modules/infrastructure/resource_group"
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
}

# creates application id with access 

module "infrastructure_cloud-scanner-app" {
  source = "../../modules/infrastructure/cloud-scanner-app"

  name                    = var.name
}

# imports tenant id, application id and principal secret 

locals {
  tenant_id     = module.infrastructure_cloud-scanner-app.tenant_id
  client_id     = module.infrastructure_cloud-scanner-app.client_id
  client_secret = module.infrastructure_cloud-scanner-app.client_secret
}

# creates container instance with image

module "vn-container" {
  source = "../../modules/services/vn-container"

  subscription_id     = data.azurerm_subscription.current.subscription_id
  resource_group_name = module.infrastructure_resource_group.resource_group_name
  location            = var.location
  tenant_id           = local.tenant_id
  client_id           = local.client_id
  client_secret       = local.client_secret
  mode                = var.mode
  mgmt-console-url    = var.mgmt-console-url
  mgmt-console-port   = var.mgmt-console-port
  deepfence-key       = var.deepfence-key
  image               = var.image
  cpu                 = var.cpu
  memory              = var.memory
  depends_on          = [module.infrastructure_resource_group]
}
