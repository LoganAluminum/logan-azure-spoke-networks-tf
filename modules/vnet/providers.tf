terraform {
    required_version = ">=1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.15.0"
    }
  }
}
# Main provider configuration where our new resources will be created

provider "azurerm" {
  # Configuration options
  subscription_id = "449222e0-9367-4341-84e2-6b36b61eb2b5"
  features {}
}

# Alias provider for the hub subscription
provider "azurerm" {
  features {}
  alias           = "hub"
  subscription_id = "56a5456f-a14e-4b9c-95cd-3a4ad84aaaa0"
}