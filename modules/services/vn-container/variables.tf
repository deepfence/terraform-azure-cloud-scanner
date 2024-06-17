# general

variable "name" {
  type        = string
  description = "Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\-]+$", var.name)) && length(var.name) > 1 && length(var.name) <= 64
    error_message = "Must enter a naming up to 64 alphanumeric characters."
  }
  default = "deepfence-cloud-scanner"
}

variable "location" {
  type        = string
  description = "Zone where the stack will be deployed"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name to deploy cloud vision stack"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be added to the resources"
  default = {
    product = "deepfence-cloud-scanner"
  }
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID where to deploy the cloud connector image"
}


variable "subscription_id_multiple" {
  type        = list(string)
  default     = []
  description = "Subscription ID where to deploy the cloud connector image"
}

# container

variable "image" {
  type        = string
  default     = "deepfenceio/cloud-scanner:latest"
  description = "Image of the cloud scanner to deploy"
}

variable "cpu" {
  type        = string
  default     = "1"
  description = "Number of CPU cores of the container"
}

variable "memory" {
  type        = string
  default     = "2"
  description = "Memory in GB of the container"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}

variable "client_id" {
  type        = string
  description = "application ID"
}

variable "client_secret" {
  type        = string
  description = "application service principal secret"
}

variable "mode" {
  type        = string
  description = "mode"
  default     = "service"
}

variable "mgmt-console-url" {
  type        = string
  description = "mgmt-console-url"
}

variable "mgmt-console-port" {
  type        = string
  description = "mgmt-console-port"
}

variable "deepfence-key" {
  type        = string
  description = "deepfence-key"
}

variable "cloud_provider" {
  type        = string
  description = "Cloud provider name"
  default     = "azure"
}

variable "debug" {
  type        = string
  description = "enable cloud scanner debug logs"
  default     = "false"
}
