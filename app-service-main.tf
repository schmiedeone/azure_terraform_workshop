##############################
## Azure App Service - Main ##
##############################

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.app_name}-rg"
  location = var.location

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }
}

# Container module
# https://registry.terraform.io/modules/innovationnorway/web-app-container/azurerm/1.2.0

# Create the App Service Plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "${var.app_name}-service-plan"
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
    owner       = var.owner  
  }
}

# Create the App Service
resource "azurerm_app_service" "app-service" {
  name                = "${var.app_name}-app-service"
  location            = var.location
  resource_group_name = var.test_resource_group
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  site_config {
    # https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples/app-service/docker-compose
    app_command_line = ""
    linux_fx_version = "COMPOSE|${filebase64("/Users/schmiedeone/work/labs/terraform_sample/sampleapi/docker-compose.yml")}"
  }

  lifecycle {
    ignore_changes = [
      site_config.0.linux_fx_version # deployments are made outside of Terraform
    ]
  }
  # To connect with git, verify where to put them
  # source_control = {}
  # scm_type = "LocalGit"

  app_settings = {
    "NODE_ENV" = "production"
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }
}
