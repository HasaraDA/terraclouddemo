terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.100"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.5"
    }
  }
  required_version = ">= 1.4"

  cloud {
    organization = "DemoProDevOps"
    workspaces {
      name = "testflow"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1cc4ba40-8530-47fd-b391-01acfc8bf752"
}

data "azurerm_client_config" "current" {}
