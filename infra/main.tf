locals {
  current_date = timestamp()
}

module "resource_group" {
  source              = "/modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
  project             = var.project
  created-date        = local.current_date
}

module "vnet" {
  source              = "/modules/vnet"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  deploy_on_existing_vnet = var.deploy_on_existing_vnet
  existing_vnet_id    = var.existing_vnet_id
}

module "aks_cluster" {
  #revisar
  source  = "/modules/aks_cluster"
  resource_group_name = module.resource_group.resource_group_name
  aks_cluster_name    = var.aks_cluster_name
  location            = var.location
  enable_scaling      = var.enable_scaling
  node_count          = var.node_count
  environment         = var.environment
  project             = var.project
  created_date        = local.current_date
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "aks_cluster_name" {
  value = module.aks_cluster.name
}

output "kubeconfig_file" {
  value = azurerm_kubernetes_cluster.aks.kube_config
}