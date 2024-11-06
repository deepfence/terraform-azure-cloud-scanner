variable "subscription_id" {
  type        = string
  description = "azure account subscription id"
}

variable "tenant_id" {
  type        = string
  description = "azure tenant id"
}

variable "client_id" {
  type        = string
  description = "azure client id"
}

variable "client_secret" {
  type        = string
  description = "azure client secret for given client id"
}

variable "location" {
  type        = string
  description = "target cluster location/region"
}

variable "name" {
  type        = string
  description = "Name to be assigned to all child resources. A suffix may be added internally when required. Use default value unless you need to install multiple instances"
  default     = "deepfence-cloud-scanner"
}

variable "k8s_namespace" {
  type        = string
  description = "namespace to install deepfence cloud scanner"
  default     = "deepfence"
}

variable "cloud_scanner_chart_name" {
  type    = string
  default = "deepfence-cloud-scanner"
}

variable "cloud_scanner_chart_version" {
  type        = string
  default     = "2.5.0"
  description = "cloud scanner chart version"
}

variable "cloud_scanner_image" {
  type        = string
  default     = "quay.io/deepfenceio/cloud_scanner_ce"
  description = "quay.io/deepfenceio/cloud_scanner_ce if using ThreatMapper. quay.io/deepfenceio/cloud_scanner if using ThreatStryker"
}

variable "cloud_scanner_image_tag" {
  type        = string
  default     = "2.5.0"
  description = "cloud scanner image tag"
}

variable "mgmt-console-url" {
  type        = string
  description = "deepfence cmanagement clonsole url"
}

variable "mgmt-console-port" {
  type        = string
  description = "deepfence management console port"
  default     = "443"
}

variable "deepfence-key" {
  type        = string
  description = "Deepfence API key, get it from console UI -> Settings -> User Management"
}

variable "log_level" {
  type        = string
  description = "cloud scanner log level"
  default     = "info"
}

variable "isOrganizationDeployment" {
  type    = bool
  default = false
}

# optional variables
# required if isOrganizationDeployment is true
variable "organizationAccountID" {
  type        = string
  description = "organization account id"
}


variable "deployedAccountID" {
  type        = string
  default     = ""
  description = "project id where cloud scanner in deployed"
}

# extra helm values for the helm chart 
# uses same sytax as that of helm_release for keys and values
variable "extra_helm_values" {
  type    = map(string)
  default = {}
}
