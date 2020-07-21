##############################
## Azure App Service - Main ##
##############################

# # Create a Resource Group
# resource "azurerm_resource_group" "appservice-rg" {
#   name     = "kopi-${var.region}-${var.environment}-${var.app_name}-app-service-rg"
#   location = var.location

#   tags = {
#     description = var.description
#     environment = var.environment
#     owner       = var.owner  
#   }
# }

# Create the App Service Plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "${var.app_name}-service-plan"
  location            = var.location
  resource_group_name = var.test_resource_group
  # Linux isn't available in Free tier
  # kind                = "Linux"
  # reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }
}

# # Create the App Service
# resource "azurerm_app_service" "app-service" {
#   name                = "${var.app_name}-app-service"
#   location            = var.location
#   resource_group_name = var.test_resource_group
#   app_service_plan_id = azurerm_app_service_plan.service-plan.id

#   site_config {
#     linux_fx_version = "DOTNETCORE|3.1"
#     remote_debugging_enabled = true
#   }

#   # To connect with git, verify where to put them
#   # source_control = {}
#   # scm_type = "LocalGit"

#   app_settings = {
#     "NODE_ENV" = "production"
#   }

#   tags = {
#     description = var.description
#     environment = var.environment
#     owner       = var.owner  
#   }
# }
