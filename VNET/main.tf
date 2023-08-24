terraform {
	required_providers {
		azurerm = {
			source = "hashicorp/azurerm"
			version = "=3.0.0"
		}
	}
}

provider "azurerm" {
	features {}
}

terraform {
	backend "azurerm" {
		resource_group_name = "anu-chunduri"
		storage_account_name = "anuchunduridevopssa"
		container_name = "tfstate"
		key = "vnet-terraform.tfstate"
	}
}

data "azurerm_resource_group" "resource_group" {
	name = "${var.name}-rg"
}

resource "azurerm_virtual_network" "vir_network" {
	name = "${var.name}vnet"
	location = var.location
	resource_group_name = data.azurerm_resource_group.resource_group.name
	address_space = var.vnet_address_space
}

resource "azurerm_subnet" "aks-subnet" {
	name = "aks_subnet"
	resource_group_name = data.azurerm_resource_group.resource_group.name
	virtual_network_name = azurerm_virtual_network.vir_network.name
	address_prefixes = [var.aks_subnet_address_prefix]
}

resource "azurerm_subnet" "appgw-subnet" {
   name = "appgw_subnet"
   resource_group_name = data.azurerm_resource_group.resource_group.name
   virtual_network_name = azurerm_virtual_network.vir_network.name
   address_prefixes = [var.appgw_subnet_address_prefix]
}
