# general

variable "tags" {
  type        = map(string)
  description = "Tags to be added to the resources"
  default = {
    product = "deepfence-cloud-scanner"
  }
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name to deploy resources"
}

variable "name" {
  type        = string
  description = "Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances"
  validation {
    condition     = can(regex("^[a-zA-Z0-9\\-]+$", var.name)) && length(var.name) > 1 && length(var.name) <= 64
    error_message = "Must enter a naming prefix up to 64 alphanumeric characters."
  }
  default = "deepfence-cloud-scanner"
}

variable "location" {
  type        = string
  default     = "centralus"
  description = "Zone where the stack will be deployed"
}

