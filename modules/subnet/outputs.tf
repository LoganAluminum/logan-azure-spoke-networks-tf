output "subnet_id" {
  description = "The ID of the created subnet"
  value       = azurerm_subnet.main.id
}

output "subnet_name" {
  description = "The name of the created subnet"
  value       = azurerm_subnet.main.name
}