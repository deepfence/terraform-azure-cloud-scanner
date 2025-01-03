# Cloud Scanner for Azure<br/>[ Example: Single-Subscription ]

This module example deploys Cloud Scanner in a single Azure cloud subscription. Cloud Scanner will scan resources in the subscription id where deployment will be done.

### Notice

* This example will create resources that cost money.<br/>Run `terraform destroy` when you don't need them anymore

Minimum requirements:

1. Configure [Terraform **Azure** Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Usage

Copy the code below and paste it into a .tf file on your local machine.

```terraform
provider "azurerm" {
  features {}
  # Subscription ID to deploy the Azure Container Service
  subscription_id = "<SUBSCRIPTION_ID eg. XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX>"
}

module "cloud-scanner_example_single-subscription" {
  source              = "deepfence/cloud-scanner/azure//examples/single-subscription"
  version             = "0.9.1"
  mgmt-console-url    = "<Console URL> eg. XXX.XXX.XX.XXX"
  mgmt-console-port   = "443"
  deepfence-key       = "<Deepfence-key> eg. XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
  name                = "deepfence-cloud-scanner"
  # ThreatMapper
  image               = "quay.io/deepfenceio/cloud_scanner_ce:2.5.1"
  # ThreatStryker
  # image               = "quay.io/deepfenceio/cloud_scanner:2.5.1"
  # Location name https://gist.github.com/ausfestivus/04e55c7d80229069bf3bc75870630ec8#results
  location            = "eastus"
  # Number of CPU cores (Default: 2 vCPU)
  cpu                 = "2"
  # Memory in GB (Default: 4 GB)
  memory              = "4"
  tags = {
    product = "deepfence-cloud-scanner"
  }
}
```

To run this example you need be logged in Azure using Azure CLI tool and to execute:

```shell
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
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.107.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_infrastructure_cloud-scanner-app"></a> [infrastructure\_cloud-scanner-app](#module\_infrastructure\_cloud-scanner-app) | ../../modules/infrastructure/cloud-scanner-app | n/a |
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
| <a name="input_deepfence-key"></a> [deepfence-key](#input\_deepfence-key) | deepfence-key | `string` | `""` | no |
| <a name="input_image"></a> [image](#input\_image) | n/a | `string` | `"quay.io/deepfenceio/cloud_scanner_ce:2.5.1"` | no |
| <a name="input_location"></a> [location](#input\_location) | Zone where the stack will be deployed | `string` | `"centralus"` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level | `string` | `"info"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory in GB of the container | `string` | `"2"` | no |
| <a name="input_mgmt-console-port"></a> [mgmt-console-port](#input\_mgmt-console-port) | mgmt-console-port | `string` | `"443"` | no |
| <a name="input_mgmt-console-url"></a> [mgmt-console-url](#input\_mgmt-console-url) | mgmt-console-url | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances | `string` | `"deepfence-cloud-scanner"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name to deploy secure for cloud stack | `string` | `""` | no |
| <a name="input_subscription_ids_access"></a> [subscription\_ids\_access](#input\_subscription\_ids\_access) | List of subscription IDs where cloud scanner will scan resources. If no subscriptions are specified, all of the tenant will be used. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to the resources | `map(string)` | <pre>{<br>  "product": "deepfence-cloud-scanner"<br>}</pre> | no |

## Outputs

No outputs.
