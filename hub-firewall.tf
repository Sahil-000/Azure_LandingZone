resource "azurerm_public_ip" "firewall" {
  name                = "pip-fw-hub"
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip" "firewall_management" {
  name                = "pip-fw-mgmt-hub"   # <- e.g. "pip-fw-mgmt-hub"
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "hub" {
    name                = "fw-hub"   # <- e.g. "fw-hub"
    location            = azurerm_resource_group.hub.location
    resource_group_name = azurerm_resource_group.hub.name
    sku_name = "AZFW_VNet"
    sku_tier = "Basic"

  ip_configuration {
    name                 = "fw-ip-config"
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }

  management_ip_configuration {
    name                 = "fw-mgmt-ip-config"
    subnet_id            = azurerm_subnet.firewall_management.id
    public_ip_address_id = azurerm_public_ip.firewall_management.id
  }
}