variable "vnet_name" {
  description = "Name of the spoke VNet"
  type        = string
}

variable "location" {
  description = "Azure region where the VNet will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the VNet will be created"
  type        = string
}

variable "address_space" {
  description = "Address space for the spoke VNet in CIDR notation"
  type        = list(string)
}

variable "hub_vnet_id" {
  description = "Resource ID of the hub VNet"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the hub VNet"
  type        = string
}

variable "hub_vnet_rg_name" {
  description = "Name of the resource group where the hub vnet exists"
  type        = string
}

variable "tags" {
    description = "A map of tags to apply to the resources created"
    type        = map(string)
    default     = {}
}