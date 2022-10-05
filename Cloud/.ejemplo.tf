

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "example"
  # ...
  # expone API a IP locales
  private_cluster_enabled = true 

  default_node_pool {
    name       = "example"
    #... 
    # encripta los nodes
    enable_host_encryption = true 
  }
  # ...
}

