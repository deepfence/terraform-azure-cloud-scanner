# Cloud compliance scanner for Azure cloud<br/>[ Example: Single-Subscription ]

This module example deploys Cloud compliance scanner for Cloud in a single Azure subscription.

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