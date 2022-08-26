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
  
  subscription_ids_access = var.subscription_ids_access
  name                    = var.name

}

# imports tenant id and formats subscriptions ids to string

locals {
  tenant_id     = module.infrastructure_cloud-scanner-app.tenant_id
  ids = var.subscription_ids_access
  string_formatted_ids = format("%s", join(", ", local.ids))  
}

# creates container instance with image

module "vn-container" {
  source = "../../modules/services/vn-container"

  multiple-acc-ids    = local.string_formatted_ids
  resource_group_name = module.infrastructure_resource_group.resource_group_name
  location            = var.location
  org-acc-id          = local.tenant_id
  mode                = var.mode
  mgmt-console-url    = var.mgmt-console-url
  mgmt-console-port   = var.mgmt-console-port
  deepfence-key       = var.deepfence-key
  cpu                 = var.cpu
  memory              = var.memory
  depends_on          = [module.infrastructure_resource_group]
}
