variable "deploy_on_existing_vnet" {
  type    = bool
  default = false
}

variable "existing_vnet_id" {
  type    = string
  default = ""
}

variable "vnet_name" {
  type    = string
  default = "aks-vnet"
}

variable "subnet_name" {
  type    = string
  default = "aks-subnet"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_vnet_name" {
  type = string
}