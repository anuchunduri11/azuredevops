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

variable "vm_size" {
}

variable "ssh_public_key" {
}

variable "devopspool_count" {
}
