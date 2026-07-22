output "firewall_public_ip" {
  value       = azurerm_public_ip.firewall.ip_address
  description = "Data-plane public IP for Azure Firewall"
}

output "firewall_management_public_ip" {
  value       = azurerm_public_ip.firewall_management.ip_address
  description = "Management public IP for Azure Firewall"
}