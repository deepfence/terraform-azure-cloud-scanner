# Cloud Scanner for Azure<br/>[ Example: AKS ]

This module example deploys Cloud Scanner in a AKS cluster.
### Notice

* This example will create resources that cost money.<br/>Run `terraform destroy` when you don't need them anymore

Minimum requirements:

1. Configure [Terraform **Azure** Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Usage

Copy the code below and paste it into a .tf file on your local machine.

## Single Tenant

```terraform
provider "azurerm" {
  subscription_id = "<SUBSCRIPTION_ID eg. XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX>"
  features {}
}

data "azurerm_subscription" "current" {}

data "azurerm_kubernetes_cluster" "default" {
  name                = "< AKS CLUSTER NAME >"
  resource_group_name = "<AKS CLUSTER RESOURCE GROUP>"
}

module "test" {
  source                     = "deepfence/cloud-scanner/azure//examples/aks"
  version                    = "0.8.0"
  name                       = "<name of the app>"
  mgmt-console-url           = "<Console URL> eg. XXX.XXX.XX.XXX"
  deepfence-key              = "<DEEPFENCE API KEY>"
  # ThreatMapper
  cloud_scanner_image        = "quay.io/deepfenceio/cloud_scanner_ce"
  # ThreatStryker
  # cloud_scanner_image      = "quay.io/deepfenceio/cloud_scanner"
  location                   = "< LOCATION >"
  subscription_id            = data.azurerm_subscription.current.subscription_id
  aks_host                   = data.azurerm_kubernetes_cluster.default.kube_config.0.host
  aks_client_key             = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_key)
  aks_client_certificate     = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
  aks_cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}
```

## Multi Tenant

```terraform
provider "azurerm" {
  subscription_id = "<SUBSCRIPTION_ID eg. XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX>"
  features {}
}

data "azurerm_subscription" "current" {}

data "azurerm_kubernetes_cluster" "default" {
  name                = "< AKS CLUSTER NAME >"
  resource_group_name = "<AKS CLUSTER RESOURCE GROUP>"
}

module "test" {
  source                     = "deepfence/cloud-scanner/azure//examples/aks"
  version                    = "0.8.0"
  name                       = "<name of the app>"
  mgmt-console-url           = "<Console URL> eg. XXX.XXX.XX.XXX"
  deepfence-key              = "<DEEPFENCE API KEY>"
  # ThreatMapper
  cloud_scanner_image        = "quay.io/deepfenceio/cloud_scanner_ce"
  # ThreatStryker
  # cloud_scanner_image      = "quay.io/deepfenceio/cloud_scanner"
  location                   = "< LOCATION >"
  subscription_id            = data.azurerm_subscription.current.subscription_id
  aks_host                   = data.azurerm_kubernetes_cluster.default.kube_config.0.host
  aks_client_key             = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_key)
  aks_client_certificate     = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
  aks_cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
  isOrganizationDeployment   = true
  deployedAccountID          = data.azurerm_subscription.current.subscription_id
  subscription_ids_access    = [ <list of tenants subscription id's> ]
}
```

To run this example you need be logged in Azure using Azure CLI tool and to execute:

```shell
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_scanner_helm"></a> [cloud\_scanner\_helm](#module\_cloud\_scanner\_helm) | ../../modules/cloud-scanner-helm | n/a |
| <a name="module_infrastructure_cloud_scanner_app"></a> [infrastructure\_cloud\_scanner\_app](#module\_infrastructure\_cloud\_scanner\_app) | ../../modules/infrastructure/cloud-scanner-app | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default                                                     | Required |
|------|-------------|------|-------------------------------------------------------------|:--------:|
| <a name="input_aks_client_certificate"></a> [aks\_client\_certificate](#input\_aks\_client\_certificate) | aks cluster client certificate | `any` | n/a                                                         | yes |
| <a name="input_aks_client_key"></a> [aks\_client\_key](#input\_aks\_client\_key) | aks cluster client key | `any` | n/a                                                         | yes |
| <a name="input_aks_cluster_ca_certificate"></a> [aks\_cluster\_ca\_certificate](#input\_aks\_cluster\_ca\_certificate) | aks cluster client ca certificate | `any` | n/a                                                         | yes |
| <a name="input_aks_host"></a> [aks\_host](#input\_aks\_host) | aks cluster host | `any` | n/a                                                         | yes |
| <a name="input_cloud_scanner_chart_name"></a> [cloud\_scanner\_chart\_name](#input\_cloud\_scanner\_chart\_name) | cloud scanner chart name | `string` | `"deepfence-cloud-scanner"`                                 | no |
| <a name="input_cloud_scanner_chart_version"></a> [cloud\_scanner\_chart\_version](#input\_cloud\_scanner\_chart\_version) | cloud scanner chart version | `string` | `"2.4.0"`                                                   | no |
| <a name="input_cloud_scanner_image"></a> [cloud\_scanner\_image](#input\_cloud\_scanner\_image) | quay.io/deepfenceio/cloud\_scanner\_ce if using ThreatMapper. quay.io/deepfenceio/cloud\_scanner if using ThreatStryker | `string` | `"quay.io/deepfenceio/cloud_scanner_ce"`                    | no |
| <a name="input_cloud_scanner_image_tag"></a> [cloud\_scanner\_image\_tag](#input\_cloud\_scanner\_image\_tag) | cloud scanner container image tag | `string` | `"2.4.0"`                                                   | no |
| <a name="input_deepfence-key"></a> [deepfence-key](#input\_deepfence-key) | deepfence-key | `string` | `""`                                                        | no |
| <a name="input_deployedAccountID"></a> [deployedAccountID](#input\_deployedAccountID) | target project where cloud scanner is deployed in org mode | `string` | `""`                                                        | no |
| <a name="input_extra_helm_values"></a> [extra\_helm\_values](#input\_extra\_helm\_values) | extra helm values for the helm chart uses same sytax as that of helm\_release for keys and values | `map(string)` | `{}`                                                        | no |
| <a name="input_isOrganizationDeployment"></a> [isOrganizationDeployment](#input\_isOrganizationDeployment) | n/a | `bool` | `false`                                                     | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | namespace to install deepfence cloud scanner | `string` | `"deepfence"`                                               | no |
| <a name="input_k8s_service_account_name"></a> [k8s\_service\_account\_name](#input\_k8s\_service\_account\_name) | kubernetes service account name | `string` | `"deepfence-cloud-scanner"`                                 | no |
| <a name="input_location"></a> [location](#input\_location) | Zone where the stack will be deployed | `string` | `"centralus"`                                               | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level | `string` | `"info"`                                                    | no |
| <a name="input_mgmt-console-port"></a> [mgmt-console-port](#input\_mgmt-console-port) | mgmt-console-port | `string` | `"443"`                                                     | no |
| <a name="input_mgmt-console-url"></a> [mgmt-console-url](#input\_mgmt-console-url) | mgmt-console-url | `string` | `""`                                                        | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances | `string` | `"deepfence-cloud-scanner"`                                 | no |
| <a name="input_organizationAccountID"></a> [organizationAccountID](#input\_organizationAccountID) | organization subscription id | `string` | `""`                                                        | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | azure account subscription id | `string` | n/a                                                         | yes |
| <a name="input_subscription_ids_access"></a> [subscription\_ids\_access](#input\_subscription\_ids\_access) | List of subscription IDs where cloud scanner will scan resources. If no subscriptions are specified, all of the tenant will be used. | `list(string)` | `[]`                                                        | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to the resources | `map(string)` | <pre>{<br>  "product": "deepfence-cloud-scanner"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->