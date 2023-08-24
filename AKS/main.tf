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
		key = "aks-terraform.tfstate"
	}
}

provider "azurerm" {
	features {}
}

data "azurerm_resource_group" "resource_group" {
	name = "${var.name}-rg"
}

data "azurerm_subnet" "aks_subnet" {
	name = "aks_subnet"
	virtual_network_name = "${var.name}vnet"
	resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_kubernetes_cluster" "aks" {
	name = "${var.name}aks"
	location = var.location
	resource_group_name = data.azurerm_resource_group.resource_group.name
	dns_prefix = "${var.name}dns"
	
	identity {
		type = "SystemAssigned"
	}
	default_node_pool {
		name = "devopspool"
		vm_size = var.vm_size
		node_count = var.devopspool_count
		type = "VirtualMachineScaleSets"
		vnet_subnet_id = data.azurerm_subnet.aks_subnet.id
	}
	
	ingress_application_gateway {
		gateway_id = "/subscriptions/7a70fcbd-d2c2-4017-bfe5-6d89c10285fe/resourceGroups/anuchunduridevops-rg/providers/Microsoft.Network/applicationGateways/anuchunduridevopsappgw"  
	}

	linux_profile {
		admin_username = "ubuntu"
		ssh_key {
			key_data = var.ssh_public_key
		}
	}
}

resource "azurerm_role_assignment" "acr_pull" {
	scope = data.azurerm_resource_group.resource_group.id 
	principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
	role_definition_name = "AcrPull"
	depends_on = [azurerm_kubernetes_cluster.aks]
}
