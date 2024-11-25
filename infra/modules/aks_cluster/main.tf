resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.aks_cluster_name}-dns"
  kubernetes_version  = "1.29.9"
  automatic_channel_upgrade = "stable"
  node_os_channel_upgrade   = "Unmanaged"

  default_node_pool {
    name       = "default"
    node_count = var.enable_scaling ? var.node_count : 1
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = var.subnet_id
  }  

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  tags = {
    ENV           = var.environment
    PROJECT       = var.project
    CREATED_DATE  = var.created_date
  }
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}