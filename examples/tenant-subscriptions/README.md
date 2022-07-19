# Cloud compliance scanner for Azure cloud<br/>[ Example: Tenant-Subscriptions ]

This module example deploys Cloud compliance scanner in a single Azure cloud subscription. Cloud compliance scanner will scan resources in all the subscription ids given as input.

### Notice

* This example will create resources that cost money.<br/>Run `terraform destroy` when you don't need them anymore.

Minimum requirements:

1. Configure [Terraform **Azure** Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Usage

For quick testing, use this snippet on your terraform files

```terraform
provider "azurerm" {
  features {}
  subscription_id = "<SUBSCRIPTION_ID eg. XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX>"
}
module "cloud-compliance_example_tenant-subscriptions" {
  source                  = "deepfence/cloud-compliance/azure//examples/tenant-subscriptions"
  version                 = "0.1.0"
  mode                    = "<Mode type> eg. service"
  mgmt-console-url        = "<Console URL> eg. XXX.XXX.XX.XXX"
  mgmt-console-port       = "<Console port> eg. 443"
  deepfence-key           = "<Deepfence-key> eg. XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
  subscription_ids_access = "<List of subscription ids which can be accessed by cloud compliance scanner> eg. ["XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"]
}
```

To run this example you need be logged in Azure using Azure CLI tool and to execute:

```terraform
$ terraform init
$ terraform plan
$ terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_infrastructure_cloud-compliance-scanner-app"></a> [infrastructure\_cloud-compliance-scanner-app](#module\_infrastructure\_cloud-compliance-scanner-app) | ../../modules/infrastructure/cloud-compliance-scanner-app | n/a |
| <a name="module_infrastructure_resource_group"></a> [infrastructure\_resource\_group](#module\_infrastructure\_resource\_group) | ../../modules/infrastructure/resource_group | n/a |
| <a name="module_vn-container"></a> [vn-container](#module\_vn-container) | ../../modules/services/vn-container | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu"></a> [cpu](#input\_cpu) | Number of CPU cores of the containers | `string` | `"1"` | no |
| <a name="input_deepfence-key"></a> [deepfence-key](#input\_deepfence-key) | deepfence-key | `string` | `"test"` | no |
| <a name="input_location"></a> [location](#input\_location) | Zone where the stack will be deployed | `string` | `"centralus"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Number of CPU cores of the containers | `string` | `"2"` | no |
| <a name="input_mgmt-console-port"></a> [mgmt-console-port](#input\_mgmt-console-port) | mgmt-console-port | `string` | `"443"` | no |
| <a name="input_mgmt-console-url"></a> [mgmt-console-url](#input\_mgmt-console-url) | mgmt-console-url | `string` | `"test"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | mode | `string` | `"service"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances | `string` | `"cloud-compliance-scanner"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name to deploy secure for cloud stack | `string` | `""` | no |
| <a name="input_subscription_ids_access"></a> [subscription\_ids\_access](#input\_subscription\_ids\_access) | List of subscription IDs where cloud compliance scanner will scan resources. If no subscriptions are specified, all of the tenant will be used. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to the resources | `map(string)` | <pre>{<br>  "product": "cloud-compliance-scanner"<br>}</pre> | no |

## Outputs

No outputs.
