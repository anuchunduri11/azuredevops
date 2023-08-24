variable "backend_address_pool_name" {
    default = "myBackendPool"
}

variable "frontend_port_name" {
    default = "myFrontendPort"
}

variable "frontend_ip_configuration_name" {
    default = "myAppGWIPConfig"
}

variable "gateway_ip_configuration_name" {
	default = "myGWIPConfig"
}

variable "http_setting_name" {
    default = "myHTTPsetting"
}

variable "listener_name" {
    default = "myListener"
}

variable "request_routing_rule_name" {
    default = "myRoutingRule"
}

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
