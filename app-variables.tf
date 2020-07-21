#############################
## Application - Variables ##
#############################

# application name 
variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
}

# environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

# azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "West Europe"
}

# azure region shortname
variable "region" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "we"
}

# owner
variable "owner" {
  type        = string
  description = "Mukku"
}

# description
variable "description" {
  type        = string
  description = "Test app for hands on practice"
}

variable "test_resource_group" {
  type        = string
  description = "Resource group to have the service plan. Already created by Grimme"
}