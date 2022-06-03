# Cloud compliance scanner for Azure cloud<br/>[ Example: Single-Subscription ]

This module example deploys Cloud compliance scanner in a single Azure cloud subscription.

### Notice

* This example will create resources that cost money.<br/>Run `terraform destroy` when you don't need them anymore

Minimum requirements:

1. Configure [Terraform **Azure** Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Usage

For quick testing, use this snippet on your terraform files

```terraform
provider "azurerm" {
  features {}
  subscription_id = "<SUBSCRIPTION_ID>"
}
module "cloud-compliance-scanner" {
  source                  = ""
  secure_api_token = ""
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
| <a name="module_cloud_connector"></a> [cloud\_connector](#module\_cloud\_connector) | ../../modules/services/cloud-connector | n/a |
| <a name="module_infrastructure_cloud-compliance-scanner-app"></a> [infrastructure\_cloud-compliance-scanner-app](#module\_infrastructure\_cloud-compliance-scanner-app) | ../../modules/infrastructure/cloud-compliance-scanner-app | n/a |
| <a name="module_infrastructure_resource_group"></a> [infrastructure\_resource\_group](#module\_infrastructure\_resource\_group) | ../../modules/infrastructure/resource_group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | Deepfence's Secure API Token | `string` | `""` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | Number of CPU cores of the containers | `string` | `"1"` | no |
| <a name="input_deploy_scanning"></a> [deploy\_scanning](#input\_deploy\_scanning) | whether cloud compliance scanner app is to be deployed. Required if cloud-connector container module is to be deployed. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Zone where the stack will be deployed | `string` | `"centralus"` | no |
| <a name="input_management_console_url"></a> [management\_console\_url](#input\_management\_console\_url) | Deepfence's Secure API URL | `string` | `"https://dev.deepfence.com/"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Number of CPU cores of the containers | `string` | `"2"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances | `string` | `"cloud-compliance-scanner"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name to deploy secure for cloud stack | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to the resources | `map(string)` | <pre>{<br>  "product": "cloud-compliance-scanner"<br>}</pre> | no |

## Outputs

No outputs.
