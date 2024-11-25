# Nombre del grupo de recursos
resource_group_name = "myResourceGroup"

# Nombre del AKS cluster
aks_cluster_name = "myAKSCluster"

# Ubicación de los recursos en Azure
location = "East US 2"

# Enable autoscaling
enable_scaling = true

# Number of nodes (only used if enable_scaling is true)
node_count = 3

# Deploy existing vnet
deploy_on_existing_vnet = true

# Existing vnet id (only used if deploy_on_existing_vnet is true)
existing_vnet_id = "/subscriptions/your-subscription-id/resourceGroups/your-resource-group/providers/Microsoft.Network/virtualNetworks/your-vnet"

# Vnet name(only used if deploy_on_existing_vnet is false)
vnet_name = "myNewVNet"

# Subnet name
subnet_name = "myAKSSubnet"