variable "resource_group_name" {
  type    = string
  default = "RG-AKS-TEST"
}

variable "aks_cluster_name" {
  type    = string
  default = "AKSAISTEST"
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "West US"

  validation {
    condition     = contains(["East US", "East US 2", "Central US", "North Central US", "South Central US", "West US", "West US 2", "West US 3"], var.location)
    error_message = "The location must be one of the US regions: East US, East US 2, Central US, North Central US, South Central US, West US, West US 2, or West US 3."
  }
}

variable "enable_scaling" {
  type    = bool
  default = false
}

variable "node_count" {
  type    = number
  default = 3
}

variable "deploy_on_existing_vnet" {
  type    = bool
  default = false
}

variable "existing_vnet_id" {
  type    = string
  default = ""
}

variable "current_date" {
  description = "The current date and time"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment to be deployed"
  type        = string
  default     = "DEV"

  validation {
    condition     = contains(["DEV", "PROD", "QA", "STAGE"], var.environment)
    error_message = "The environment variable must be one of DEV, PROD, QA, or STAGE."
  }
}

variable "project" {
  description = "Project"
  type        = string
  default     = "SN" 
}

variable "created_date " {
  description = "The resource creation date and time"
  type        = string
  default     = "undated"  
}

variable "subnet_name" {
  type    = string
  default = "AKS-SUBNET"
}

variable "vnet_name" {
  type    = string
  default = "AKS-VNET"
}