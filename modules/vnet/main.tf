resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "peering-to-${var.hub_vnet_name}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.main.name
  remote_virtual_network_id = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic     = true
  allow_gateway_transit       = false # Set to true if you want to use the hub's gateway in the spoke
  use_remote_gateways         = false # Set to true if you want to use a remote gateway in the hub

  depends_on = [
    azurerm_virtual_network.main
  ]
}

# The peering request must be approved from the hub vnet side
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  provider                  = azurerm.hub
  name                      = "peering-from-${var.vnet_name}"
  resource_group_name       = var.hub_vnet_rg_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.main.id
  allow_virtual_network_access = true
  allow_forwarded_traffic     = true
  allow_gateway_transit       = false
  use_remote_gateways         = false

  depends_on = [
    azurerm_virtual_network_peering.spoke_to_hub
  ]
}