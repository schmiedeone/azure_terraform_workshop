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
  subscription_id  = "2e48ae36-5ceb-49b3-a916-6cb954b6063d"
  tenant_id        = "e2b92a0a-62bf-43c0-90ea-45cfe4be51c6"
}
