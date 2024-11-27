# general

variable "subscription_id" {
  type        = string
  description = "azure account subscription id"
}

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


variable "aks_host" {
  description = "aks cluster host"
}

variable "aks_client_key" {
  description = "aks cluster client key"
}

variable "aks_client_certificate" {
  description = "aks cluster client certificate"
}

variable "aks_cluster_ca_certificate" {
  description = "aks cluster client ca certificate"
}

# container env variables
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

variable "log_level" {
  type        = string
  default     = "info"
  description = "Log level"
  validation {
    condition     = contains(["error", "warn", "info", "debug", "trace"], var.log_level)
    error_message = "Must be one of error, warn, info, debug, trace"
  }
}

variable "k8s_service_account_name" {
  type        = string
  description = "kubernetes service account name"
  default     = "deepfence-cloud-scanner"
}

variable "k8s_namespace" {
  type        = string
  description = "namespace to install deepfence cloud scanner"
  default     = "deepfence"
}

variable "cloud_scanner_chart_name" {
  type        = string
  default     = "deepfence-cloud-scanner"
  description = "cloud scanner chart name"
}

variable "cloud_scanner_chart_version" {
  type        = string
  default     = "2.5.1"
  description = "cloud scanner chart version"
}

variable "cloud_scanner_image" {
  type        = string
  default     = "quay.io/deepfenceio/cloud_scanner_ce"
  description = "quay.io/deepfenceio/cloud_scanner_ce if using ThreatMapper. quay.io/deepfenceio/cloud_scanner if using ThreatStryker"
}

variable "cloud_scanner_image_tag" {
  type        = string
  default     = "2.5.1"
  description = "cloud scanner container image tag"
}

variable "isOrganizationDeployment" {
  type    = bool
  default = false
}

# optional variables
# required if isOrganizationDeployment is true
variable "organizationAccountID" {
  type        = string
  default     = ""
  description = "organization subscription id"
}

variable "deployedAccountID" {
  type        = string
  default     = ""
  description = "target project where cloud scanner is deployed in org mode"
}

# extra helm values for the helm chart 
# uses same sytax as that of helm_release for keys and values
variable "extra_helm_values" {
  type    = map(string)
  default = {}
}
