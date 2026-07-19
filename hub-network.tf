resource "azurerm_resource_group" "hub" {
  name     = "rg-hub"   
  location = "australiaeast"
}

resource "azurerm_virtual_network" "hub" {
  name                = "vnet-hub"   # <- e.g. "vnet-hub"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
}

resource "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"   # exact name required, don't change
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.1.0/26"]
}

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"   # exact name required, don't change
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.2.0/26"]   
}