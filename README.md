# Cloud Scanner for Azure by Deepfence

This module deploys Cloud Scanner for Azure by creating underlying resources in Azure.

### Notice

* **Deployment cost** This example will create resources that cost money.<br/>Run `terraform destroy` when you don't need them anymore

## Required Permissions

### Provisioning Permissions

User deploying the resources needs the below access on Azure-
- Subscription to create container group, virtual network, resource group.
- Security administrator role to set up access.

## Usage

### - Single-Subscription

This approach deploys Cloud Scanner in a single Azure cloud subscription. Cloud Scanner will scan resources in the subscription id where deployment will be done.<br/>
More info
in [`./examples/single-subscription`](https://github.com/deepfence/terraform-azure-cloud-scanner/tree/main/examples/single-subscription)

### - Tenant-Subscriptions

This approach deploys Cloud Scanner in a single Azure cloud subscription. However, Cloud Scanner will scan resources in all the subscription ids given as input.<br/>
More info
in [`./examples/tenant-subscriptions`](https://github.com/deepfence/terraform-azure-cloud-scanner/tree/main/examples/tenant-subscriptions)

## Resources

Following resources are created in a new resource group:

| Name                                                                                                                                                 | Type        |
|------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| [azurerm_container_group.cg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group)                        | resource    |
| [azurerm_network_profile.np](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_profile)                        | resource    |
| [azurerm_subnet.sn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)                                          | resource    |
| [azurerm_virtual_network.vn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)                        | resource    |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription)                      | data source |
| [azuread_application.aa](https://registry.terraform.io/providers/hashicorp/azuread/2.7.0/docs/resources/application)                                 | resource    |
| [azuread_application_password.aap](https://registry.terraform.io/providers/hashicorp/azuread/2.7.0/docs/resources/application_password)              | resource    |
| [azuread_service_principal.asp](https://registry.terraform.io/providers/hashicorp/azuread/2.7.0/docs/resources/service_principal)                    | resource    |
| [azuread_service_principal_password.aspp](https://registry.terraform.io/providers/hashicorp/azuread/2.7.0/docs/resources/service_principal_password) | resource    |
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)                      | resource    |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/2.7.0/docs/data-sources/client_config)                     | data source |

## Authors

Module is maintained and supported by [Deepfence](https://deepfence.io/).

## License

Apache 2 Licensed. See LICENSE for full details.
