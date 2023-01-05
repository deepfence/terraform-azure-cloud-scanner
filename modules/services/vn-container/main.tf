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
  network_profile_id  = azurerm_network_profile.np.id


  container {
    name                  = "${var.name}-container"
    image                 = var.image
    cpu                   = var.cpu
    memory                = var.memory
    commands              = ["/usr/local/bin/cloud_compliance_scan", "-mode", var.mode, "-mgmt-console-url", var.mgmt-console-url, "-mgmt-console-port", var.mgmt-console-port, "-deepfence-key", var.deepfence-key, "-cloud_provider", var.cloud_provider, "-multiple-acc-ids", var.multiple-acc-ids, "-org-acc-id", var.org-acc-id]
    ports {
      port     = 5000
      protocol = "TCP"
    }
  }

  tags = var.tags
}

