# version requirement

terraform {
  required_version = ">= 0.15.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.0"
    }
  }
}