terraform {
  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.78.0"
    }
  }

}
provider "azurerm" {
  features {}
  subscription_id   = "d260497c-7fda-4599-978e-686766898e1d"
}
variable "inputs" {}
variable "admin_password" {}
module "deploy" {
  source             = "git::git@ssh.dev.azure.com:v3/MarsDTEC/Azure%202.0/terraform-module-deploy"
  admin_password     = var.admin_password
  inputs             = var.inputs
  providers = {
    azurerm.remote = azurerm
  }
}
output "deploy" {
  value = module.deploy
}