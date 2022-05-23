module "cloud_connector" {
  source = "../../modules/services/cloud-connector"
  name   = "${var.name}-connector"

  subscription_id     = "aeca76e8-1861-4aed-b28a-b8c48923f89b"
  resource_group_name = module.infrastructure_resource_group.resource_group_name
  location            = var.location

  verify_ssl              = local.verify_ssl

  cpu    = var.cpu
  memory = var.memory
  
  
}