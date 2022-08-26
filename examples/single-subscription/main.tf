# creates resource group

module "infrastructure_resource_group" {
  source              = "../../modules/infrastructure/resource_group"
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
}

# creates application id with access 

module "infrastructure_cloud-scanner-app" {
  source                  = "../../modules/infrastructure/cloud-scanner-app"
  subscription_ids_access = [data.azurerm_subscription.current.subscription_id]
  name                    = var.name
}

# imports tenant id

locals {
  tenant_id     = module.infrastructure_cloud-scanner-app.tenant_id
}

# creates container instance with image

module "vn-container" {
  source = "../../modules/services/vn-container"

  resource_group_name = module.infrastructure_resource_group.resource_group_name
  location            = var.location
  mode                = var.mode
  mgmt-console-url    = var.mgmt-console-url
  mgmt-console-port   = var.mgmt-console-port
  deepfence-key       = var.deepfence-key
  org-acc-id          = local.tenant_id
  multiple-acc-ids    = data.azurerm_subscription.current.subscription_id
  image               = var.image
  cpu                 = var.cpu
  memory              = var.memory
  depends_on          = [module.infrastructure_resource_group]
}
