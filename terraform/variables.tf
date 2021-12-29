variable "location" {
  type = string
  default = "uksouth"
}

variable "DOMAIN" {
  type        = string
  description = "The domain MTA-STS/TLS-RPT is being deployed for."
}

variable "MTASTSMODE" {
  type        = string
  default     = "testing"
  description = "MTA-STS policy 'mode'. Either 'testing' or 'enforce'."
}

variable "MAX_AGE" {
  type        = string
  default     = "86400"
  description = "MTA-STS max_age. Time in seconds the policy should be cached. Default is 1 day"
}

variable "MX" {
  type        = string
  description = "comma separated string of 'mx' records that should be included in mta-sts policy"
}

variable "REPORTING_EMAIL" {
  type        = string
  default     = "tls-rpt"
  description = "(Optional) Email to use for TLS-RPT reporting."
}

variable "resource_group" {
  type = "string"
  description = "resource group that contains existing resources"
}