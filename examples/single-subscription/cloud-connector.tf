# sets tenant id, client id and client secret 

locals {
  tenant_id     = length(module.infrastructure_cloud-compliance-scanner-app) > 0 ? module.infrastructure_cloud-compliance-scanner-app[0].tenant_id : ""
  client_id     = length(module.infrastructure_cloud-compliance-scanner-app) > 0 ? module.infrastructure_cloud-compliance-scanner-app[0].client_id : ""
  client_secret = length(module.infrastructure_cloud-compliance-scanner-app) > 0 ? module.infrastructure_cloud-compliance-scanner-app[0].client_secret : ""
}

# creates container instance with image

module "cloud_connector" {
  source = "../../modules/services/cloud-connector"
  name   = "${var.name}-connector"

  subscription_id     = data.azurerm_subscription.current.subscription_id
  resource_group_name = module.infrastructure_resource_group.resource_group_name
  location            = var.location
  tenant_id           = local.tenant_id
  client_id           = local.client_id
  client_secret       = local.client_secret

  cpu    = var.cpu
  memory = var.memory
  depends_on = [module.infrastructure_resource_group]
  
}

