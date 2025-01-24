variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the subnet will be created"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network to which the subnet belongs"
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet (e.g., [\"10.0.1.0/24\"])"
  type        = list(string)
}

variable "route_table_id" {
  description = "Optional: The ID of the route table to associate with the subnet"
  type        = string
  default     = null # No route table by default
}

variable "nsg_id" {
  description = "Optional: The ID of the network security group to associate with the subnet"
  type        = string
  default     = null # No NSG by default
}

variable "private_endpoint_network_policies_enabled" {
  description = "Enable or disable network policies for private endpoints on the subnet"
  type        = bool
  default     = true  # Enabled by default to allow private endpoints
}

variable "private_link_service_network_policies_enabled" {
  description = "Enable or disable network policies for private link service on the subnet"
  type        = bool
  default     = true # Enabled by default to allow private link services
}

variable "service_endpoints" {
  description = "A list of service endpoint names to associate with the subnet"
  type        = set(string)
  default     = []  # Empty list by default, meaning no service endpoints
}

variable "delegations" {
  description = "A map of delegations to configure on the subnet"
  type = list(object({
    name = string
    service_name = string
    actions = list(string)
  }))
  default = []
}