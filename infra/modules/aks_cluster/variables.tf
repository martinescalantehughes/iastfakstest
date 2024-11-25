variable "environment" {
  description = "Environment to be deployed"
  type        = string
}

variable "project" {
  description = "Project"
  type        = string
}

variable "created_date" {
  description = "The resource creation date and time"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "enable_scaling" {
  type    = bool
  default = false
}

variable "node_count" {
  type    = number
  default = 1
}