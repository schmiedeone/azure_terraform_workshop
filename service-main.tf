# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.app_name}-${var.variance}-rg"
  location = var.location

  tags = {
    description = var.description
    environment = var.environment
  }
}

# Create the App Service Plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "${var.app_name}-${var.variance}-service-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  # Linux isn't available in Free tier
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
    description = var.description
    environment = var.environment
  }
}

# Create the App Service
resource "azurerm_app_service" "app-service" {
  name                = "${var.app_name}-${var.variance}-app-service"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  site_config {
    app_command_line = ""
    linux_fx_version = "COMPOSE|${filebase64("./docker-compose.yml")}"
  }

  app_settings = {
    "NODE_ENV" = "production"
  }

  tags = {
    description = var.description
    environment = var.environment
  }
}
