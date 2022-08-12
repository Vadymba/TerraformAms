terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
    prefix = "alert-paas-${var.env}" 

    default_tags = {
        created-by = "terraform"
        managed-by = "terraform"
        environment = var.env
        initiative = "PaaS"
        terraform-project-repo = "default"
        owner = "default"
        owner-contact = "default"
        budget = var.budget_dollars
        platform-module = var.platform_module
  }
}

resource "azurerm_resource_group" "rg" {
  name = local.prefix
  location = var.location

  tags = local.default_tags
}