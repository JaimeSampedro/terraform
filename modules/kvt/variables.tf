
variable "resource_group" {
  type        = string
  description = "(Required) The name of the resource group in which the Key Vault is created."
}

variable "name" {
  type        = string
  description = "(Required) Specifies the key vault name. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

