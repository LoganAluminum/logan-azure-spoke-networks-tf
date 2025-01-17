output "vnet_id" {
  description = "Resource ID of the created spoke VNet"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the created spoke VNet"
  value       = azurerm_virtual_network.main.name
}

output "vnet_address_space" {
  description = "Address space of the created spoke VNet"
  value       = azurerm_virtual_network.main.address_space
}