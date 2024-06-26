# declaring environment variables for container

locals {
  env_vars = {
    CLOUD_PROVIDER        = var.cloud_provider
    CLOUD_ACCOUNT_ID      = var.subscription_id
    AZURE_TENANT_ID       = var.tenant_id
    AZURE_REGION          = var.location
    AZURE_CLIENT_ID       = var.client_id     #application id
    AZURE_CLIENT_SECRET   = var.client_secret #application secret
    AZURE_SUBSCRIPTION_ID = var.subscription_id
  }

  org_options = [
    "-multiple-acc-ids", join(",", var.subscription_id_multiple),
    "-org-acc-id", var.tenant_id
  ]
  command = [
    "/usr/local/bin/cloud_compliance_scan",
    "-mode", var.mode,
    "-mgmt-console-url", var.mgmt-console-url,
    "-mgmt-console-port", var.mgmt-console-port,
    "-deepfence-key", var.deepfence-key,
    "-debug", var.debug,
  ]
}

# creates virtual network

resource "azurerm_virtual_network" "vn" {
  name                = "${var.name}-vn"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# creates subnet

resource "azurerm_subnet" "sn" {
  name                 = "${var.name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "${var.name}-delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

# creates network profile

resource "azurerm_network_profile" "np" {
  name                = "${var.name}-np"
  location            = var.location
  resource_group_name = var.resource_group_name

  container_network_interface {
    name = "${var.name}-ni"

    ip_configuration {
      name      = "acrfrontal"
      subnet_id = azurerm_subnet.sn.id
    }
  }
}

# creates container group with container

resource "azurerm_container_group" "cg" {
  name                = "${var.name}-cg"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  os_type             = "Linux"
  subnet_ids          = [azurerm_subnet.sn.id]


  container {
    name                  = "${var.name}-container"
    image                 = var.image
    cpu                   = var.cpu
    memory                = var.memory
    commands              = length(var.subscription_id_multiple) > 0 ? concat(local.command, local.org_options) : local.command
    environment_variables = local.env_vars

    ports {
      port     = 5000
      protocol = "TCP"
    }
  }

  tags = var.tags
}

