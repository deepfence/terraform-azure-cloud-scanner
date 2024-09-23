# creates application id with access 
module "infrastructure_cloud_scanner_app" {
  source                  = "../../modules/infrastructure/cloud-scanner-app"
  name                    = var.name
  subscription_ids_access = var.isOrganizationDeployment ? var.subscription_ids_access : [var.subscription_id]
}

# imports tenant id, application id and principal secret 
locals {
  tenant_id     = module.infrastructure_cloud_scanner_app.tenant_id
  client_id     = module.infrastructure_cloud_scanner_app.client_id
  client_secret = module.infrastructure_cloud_scanner_app.client_secret
}

provider "helm" {
  kubernetes {
    host                   = var.aks_host
    client_certificate     = var.aks_client_certificate
    client_key             = var.aks_client_key
    cluster_ca_certificate = var.aks_cluster_ca_certificate
  }
}

# install cloud scanner on the target cluster
# uses the workload identity and service accounts created previously
module "cloud_scanner_helm" {
  source                   = "../../modules/cloud-scanner-helm"
  k8s_namespace            = var.k8s_namespace
  location                 = var.location
  subscription_id          = var.subscription_id
  tenant_id                = local.tenant_id
  client_id                = local.client_id
  client_secret            = local.client_secret
  isOrganizationDeployment = var.isOrganizationDeployment
  deployedAccountID        = var.deployedAccountID
  organizationAccountID    = local.tenant_id
  mgmt-console-url         = var.mgmt-console-url
  deepfence-key            = var.deepfence-key
  cloud_scanner_image      = var.cloud_scanner_image

  depends_on = [
    module.infrastructure_cloud_scanner_app,
  ]
}

