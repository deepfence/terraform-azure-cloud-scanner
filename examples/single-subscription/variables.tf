# general

variable "tags" {
  type        = map(string)
  description = "Tags to be added to the resources"
  default = {
    product = "deepfence-cloud-scanner"
  }
}

variable "location" {
  type        = string
  default     = "centralus"
  description = "Zone where the stack will be deployed"
}

variable "name" {
  type        = string
  description = "Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\-]+$", var.name)) && length(var.name) > 1 && length(var.name) <= 64
    error_message = "Must enter a naming up to 64 alphanumeric characters."
  }
  default = "deepfence-cloud-scanner"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name to deploy secure for cloud stack"
  default     = ""
}

# container instance variables

variable "cpu" {
  type        = string
  default     = "1"
  description = "Number of CPU cores of the containers"
}

variable "memory" {
  type        = string
  default     = "2"
  description = "Number of CPU cores of the containers"
}

# container env variables

variable "mode" {
  type        = string
  description = "mode"
  default     = "service"
}

variable "mgmt-console-url" {
  type        = string
  description = "mgmt-console-url"
  default     = ""
}

variable "mgmt-console-port" {
  type        = string
  description = "mgmt-console-port"
  default     = "443"
}

variable "deepfence-key" {
  type        = string
  description = "deepfence-key"
  default     = ""
}

# application access

variable "subscription_ids_access" {
  default     = []
  type        = list(string)
  description = "List of subscription IDs where cloud scanner will scan resources. If no subscriptions are specified, all of the tenant will be used."
}


variable "image" {
  type    = string
  default = "deepfenceio/cloud-scanner:latest"
}