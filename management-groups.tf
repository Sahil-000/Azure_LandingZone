resource "azurerm_management_group" "platform" {
  name         = "mg-platform"  
  display_name = "Platform"   
}

resource "azurerm_management_group" "landing_zones" {
  name         = "mg-landing-zones"   
  display_name = "Landing Zones"   
}