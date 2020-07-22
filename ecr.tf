# resource "azurerm_container_registry" "acr" {
#   name                     = "${var.app_name}-ecr"
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   sku                      = "Standard"
#   admin_enabled            = false
#   georeplication_locations = ["West Europe"]
# }