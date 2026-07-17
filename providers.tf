terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }


  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatesahil01"
    container_name       = "tfstate"
    key                  = "landingzone.terraform.tfstate"
  }


}

provider "azurerm" {

  features {}

}

