locals {
  values = {
    "image.repository"      = var.cloud_scanner_image,
    "image.tag"             = var.cloud_scanner_image_tag,
    "managementConsoleUrl"  = var.mgmt-console-url,
    "managementConsolePort" = var.mgmt-console-port,
    "deepfenceKey.key"      = var.deepfence-key,
    "logLevel"              = var.log_level

    "cloudAccount.cloudProvider" = "azure",
    "cloudAccount.accountID"     = var.subscription_id,
    "cloudAccount.region"        = var.location,

    "cloudAccount.isOrganizationDeployment" = var.isOrganizationDeployment
    "cloudAccount.deployedAccountID"        = var.deployedAccountID
    "cloudAccount.organizationAccountID"    = var.organizationAccountID
  }
}

resource "helm_release" "cs" {
  name             = var.name
  repository       = "https://deepfence-helm-charts.s3.amazonaws.com/cloud-scanner"
  chart            = var.cloud_scanner_chart_name
  version          = var.cloud_scanner_chart_version
  namespace        = var.k8s_namespace
  create_namespace = true
  upgrade_install  = true

  values = [
    <<EOT
env_vars:
  AZURE_TENANT_ID: "${var.tenant_id}"
  AZURE_REGION: "${var.location}"
  AZURE_CLIENT_ID: "${var.client_id}"
  AZURE_CLIENT_SECRET: "${var.client_secret}"
  AZURE_SUBSCRIPTION_ID: "${var.subscription_id}"
EOT
  ]

  dynamic "set" {
    for_each = merge(local.values, var.extra_helm_values)
    content {
      name  = set.key
      value = set.value
    }
  }
}
