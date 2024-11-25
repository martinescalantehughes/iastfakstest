resource "azurerm_virtual_network" "vnet" {
  count               = var.deploy_on_existing_vnet ? 0 : 1
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  count               = var.deploy_on_existing_vnet ? 0 : 1
  name                = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  address_prefixes    = ["10.0.1.0/24"]
}

data "azurerm_virtual_network" "existing_vnet" {
  count = var.deploy_on_existing_vnet ? 1 : 0
  name                = var.vnet_name
  resource_group_name = var.rg_vnet_name
}

data "azurerm_subnet" "existing_subnet" {
  count = var.deploy_on_existing_vnet ? 1 : 0
  name  = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet[0].name
  resource_group_name  = var.resource_group_name
}

output "subnet_id" {
  value = var.deploy_on_existing_vnet ? data.azurerm_subnet.existing_subnet[0].id : azurerm_subnet.subnet[0].id
}