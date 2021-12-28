variable "location" {
  type = string
  default = "uksouth"
}

variable "prefix" {
  type = string
  default = "mjw"
}

variable "suffix" {
  #type = string
  default = {
    uksouth = "uks"
    ukwest = "ukw"
    westeurope = "weu"
    northeurope = "neu"
  }
}

#variable "admin_username" {
#  type        = string
#  description = "Administrator user name for virtual machine"
#}

#variable "admin_password" {
#  type        = string
#  description = "Password must meet Azure complexity requirements"
#}

#variable "prefix" {
#  type    = string
#  default = "my"
#}

variable "tags" {
  type = map

  default = {
    Environment = "Terraform GS"
    Dept        = "Engineering"
  }
}

variable "sku" {
  default = {
    uksouth = "16.04-LTS"
    ukwest  = "18.04-LTS"
    westeurope = "18.04-LTS"
  }
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

variable "max_age" {
  type        = string
  default     = "86400"
  description = "MTA-STS max_age. Time in seconds the policy should be cached. Default is 1 day"
}

variable "MX" {
  type        = string
  description = "'mx' value for MTA-STS policy. List of MX hostnames to be included in MTA-STS policy"
}

variable "reporting_email" {
  type        = string
  default     = ""
  description = "(Optional) Email to use for TLS-RPT reporting."
}