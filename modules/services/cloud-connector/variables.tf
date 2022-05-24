variable "name" {
  type        = string
  description = "Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\-]+$", var.name)) && length(var.name) > 1 && length(var.name) <= 64
    error_message = "Must enter a naming up to 64 alphanumeric characters."
  }
  default = "cloud-compliance-scanner"
}

variable "location" {
  type        = string
  description = "Zone where the stack will be deployed"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name to deploy cloud vision stack"
}

variable "image" {
  type        = string
  default     = "hub.docker.com/r/ramananr/cloud-compliance/latest"
  description = "Image of the cloud-connector to deploy"
}

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

variable "management_console_url" {
  type        = string
  default     = "https://dev.deepfence.com/"
  description = "Deepfence's Secure API URL"
}

variable "api_token" {
  type        = string
  description = "Deepfence's Secure API Token"
  default     = ""
  sensitive   = true
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID where to deploy the cloud connector image"
}


variable "tags" {
  type        = map(string)
  description = "Tags to be added to the resources"
  default = {
    product = "cloud-compliance-scanner"
  }
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



