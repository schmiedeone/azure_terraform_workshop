# How to Deploy a Linux Azure App Service using Terraform

This repo includes sample code to deploy Azure App Services Web App running Linux using HashiCorp Terraform.

## Usage

  `cp .env.example .env`

Add values in .env file, get help from the inline docs.
Export environment variables from .env.

  `source .env`

Run Terraform

  `terraform init`
This will pull terraform plugins into .terraform folder

  `terraform plan`
This will tell you what resources will be created/destroyed/updated

  `terraform refresh`
You might not have state file initially even though resources exist by same code, so this refresh command will check resources in your provider and will create state file

  `terraform apply`
This will make changes in your cloud resources. You will be asked for confirmation