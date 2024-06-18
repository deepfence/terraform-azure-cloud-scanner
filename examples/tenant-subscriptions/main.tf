# creates resource group

provider "azurerm" {
  features {}
}

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
  subscription_ids_access = var.subscription_ids_access

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
  mgmt-console-url    = var.mgmt-console-url
  mgmt-console-port   = var.mgmt-console-port
  deepfence-key       = var.deepfence-key
  cpu                 = var.cpu
  memory              = var.memory
  image               = var.image
  is_organizational   = "true"
  log_level           = var.log_level
  depends_on          = [module.infrastructure_resource_group]
}
