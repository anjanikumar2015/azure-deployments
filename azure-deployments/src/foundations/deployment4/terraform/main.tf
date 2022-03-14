terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.78.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id   = "4a1bebfc-591e-4875-bb61-ce0223ecfeeb"
}
provider "azurerm" {
  features {}
  alias             = "remote"
  subscription_id   = "d260497c-7fda-4599-978e-686766898e1d"
}
variable "inputs" {}
module "infra" {
  source              = "git::git@ssh.dev.azure.com:v3/MarsDTEC/Azure%202.0/terraform-module-infra"
  inputs              = var.inputs
  providers = {
    azurerm.remote = azurerm.remote
  }
}
output "infra" {
  value = module.infra
}