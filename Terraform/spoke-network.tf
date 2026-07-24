resource "azurerm_resource_group" "spoke" {
  name     = "rg-spoke"          # <- e.g. "rg-spoke"
  location = "australiaeast"
}

resource "azurerm_virtual_network" "spoke" {
  name                = "vnet-spoke"   # <- e.g. "vnet-spoke"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.spoke.location
  resource_group_name = azurerm_resource_group.spoke.name
}

resource "azurerm_subnet" "workload" {
  name                 = "snet-workload"   # <- e.g. "subnet-workload"
  resource_group_name  = azurerm_resource_group.spoke.name
  virtual_network_name = azurerm_virtual_network.spoke.name
  address_prefixes     = ["10.1.0.0/24"]   # workload subnet, carved from 10.1.0.0/16
}