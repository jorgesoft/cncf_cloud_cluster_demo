terraform {
  cloud {
    organization = "jorgesoft"

    workspaces {
      name = "cncf_cloud_cluster_demo"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-k8s-resources"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "${var.prefix}-k8s"
  #private_cluster_enabled = true # exponer API a IP locales

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    #enable_host_encryption = true # encripta los nodes
  }

  identity {
    type = "SystemAssigned"
  }
}
