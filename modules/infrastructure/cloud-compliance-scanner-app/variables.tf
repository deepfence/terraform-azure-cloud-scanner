variable "subscription_ids" {
  type        = list(string)
  description = "Subscription IDs for apply the service principal scope"
}

variable "name" {
  type        = string
  description = "Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances"

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\-]+$", var.name)) && length(var.name) > 1 && length(var.name) <= 64
    error_message = "Must enter a naming prefix up to 64 alphanumeric characters."
  }
  default = "cloud-compliance-scanner"
}
