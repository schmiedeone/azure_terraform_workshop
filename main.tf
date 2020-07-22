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
  subscription_id  = var.subscription_id
  tenant_id        = var.tenant_id
}
