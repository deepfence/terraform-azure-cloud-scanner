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

## Authors

Module is maintained and supported by [Deepfence](https://deepfence.io/).

## License

Apache 2 Licensed. See LICENSE for full details.
