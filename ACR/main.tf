terraform {
	required_providers {
		azurerm = {
			source = "hashicorp/azurerm"
			version = "=3.0.0"
		}
	}
}

terraform {
	backend "azurerm" {
		resource_group_name = "anu-chunduri"
		storage_account_name = "anuchunduridevopssa"
		container_name = "tfstate"
		key = "acr-terraform.tfstate"
	}
}

resource "azurerm_resource_group" "acr_resource_group" {
	name = "${var.name}-rg"
	location = var.location
}

resource "azurerm_resource_group" "acr" {
	name = "${var.name}acr"
	location = azurerm_resource_group.acr_resource_group.location
	resource_group_name = azurerm_resource_group.acr_resource_group.name
	sku = "Standard"
	admin_enabled = false
}
