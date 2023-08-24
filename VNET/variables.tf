variable "name" {
  type        = string
  default     = "anuchunduridevops"
  description = "Name for resources"
}

variable "location" {
  type        = string
  default     = "swedencentral"
  description = "Azure Location of resources"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Azure VNET Address Space"
}

variable "aks_subnet_address_prefix" {
  type        = string
  description = "AKS Subnet Address prefix"
}

variable "appgw_subnet_address_prefix" {
  type        = string
  description = "AppGW Subnet Address prefix"
}
