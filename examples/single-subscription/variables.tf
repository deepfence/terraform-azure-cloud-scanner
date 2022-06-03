# general

variable "tags" {
  type        = map(string)
  description = "Tags to be added to the resources"
  default = {
    product = "cloud-compliance-scanner"
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
  default = "cloud-compliance-scanner"
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

variable "management_console_url" {
  type        = string
  description = "Deepfence's Secure API URL"
  default     = "https://dev.deepfence.com/"
}

variable "api_token" {
  type        = string
  description = "Deepfence's Secure API Token"
  default     = ""
  sensitive   = true
}

# app id and access creation input 

variable "deploy_scanning" {
  type        = bool
  description = "whether cloud compliance scanner app is to be deployed. Required if cloud-connector container module is to be deployed. "
  default     = true
}
