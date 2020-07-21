###########################
## Azure Provider - Main ##
###########################

# Define Terraform provider
terraform {
  required_version = ">= 0.12"
}

# Configure the Azure provider
provider "azurerm" {
  environment      = "AzureCloud"
  version          = ">= 2.15.0"
  features {}
  subscription_id  = "7b49f69d-048a-4ca1-9fad-6a88cce612ac"
  tenant_id        = "e2b92a0a-62bf-43c0-90ea-45cfe4be51c6"
}
