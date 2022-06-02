# Cloud compliance scanner for Azure by Deepfence

This module deploys Cloud compliance scanner for Azure by creating underlying resources in Azure.

### Notice

* **Deployment cost** This example will create resources that cost money.<br/>Run `terraform destroy` when you don't need them anymore

<br/>

## Usage

### - Single-Subscription

Workload will be deployed in the same account where user's resources will be watched.<br/>
More info
in [`./examples/single-subscription`](https://github.com/deepfence/terraform-azure/tree/main/examples/single-subscription)

## Required Permissions

### Provisioning Permissions

User deploying the resources needs the below access on Azure-
- Subscription to create container group, virtual network, resource group.
- Security administrator role to set up access.

## Authors

Module is maintained and supported by [Deepfence](https://deepfence.io/).

## License

Apache 2 Licensed. See LICENSE for full details.
