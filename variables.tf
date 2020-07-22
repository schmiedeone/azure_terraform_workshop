#############################
## Application - Variables ##
#############################

variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
}

variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
}

variable "region" {
  type        = string
  description = "Azure region where the resource group will be created"
}

variable "description" {
  type        = string
  description = "Test app for hands on practice"
}

variable "tenant_id" {
  type        = string
}

variable "subscription_id" {
  type        = string
}

variable "variance" {
  type = string
}