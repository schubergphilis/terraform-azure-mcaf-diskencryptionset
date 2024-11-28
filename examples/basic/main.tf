terraform {
  required_version = ">= 1.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.5, < 5.0"
    }
  }
}

data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "github.com/schubergphilis/terraform-azure-mcaf-key-vault?ref=v0.2.2"

  key_vault = {
    name                = "example"
    resource_group_name = "keyvault-rg"
    location            = "westeurope"
    tenant_id           = data.azurerm_client_config.current.tenant_id
    cmk_keys_create     = true
  }

  tags = {
    environment = "dev"
  }
}

module "des" {
  source                    = "../../"
  name                      = "example"
  resource_group_name       = "des-rg"
  location                  = "westeurope"
  key_vault_key_id          = module.key_vault.cmkrsa_resource_versionless_id
  key_vault_resource_id     = module.key_vault.key_vault_id
  auto_key_rotation_enabled = true
  managed_identities = {
    system_assigned = true
  }
}