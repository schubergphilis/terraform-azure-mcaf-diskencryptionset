resource "azurerm_resource_group" "this" {
  count = var.create_new_resource_group ? 0 : 1

  name     = var.resource_group_name
  location = var.location
}

data "azurerm_resource_group" "this" {
  count = !var.create_new_resource_group ? 0 : 1

  name = var.resource_group_name
}


resource "azurerm_disk_encryption_set" "this" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.create_new_resource_group ? azurerm_resource_group.this.name : data.azurerm_resource_group.this.name
  auto_key_rotation_enabled = var.auto_key_rotation_enabled
  encryption_type           = var.encryption_type
  federated_client_id       = var.federated_client_id
  key_vault_key_id          = var.key_vault_key_id
  managed_hsm_key_id        = var.managed_hsm_key_id

  dynamic "identity" {
    for_each = local.identity

    content {
      type         = identity.value.type
      identity_ids = identity.value.user_assigned_resource_ids
    }
  }

  tags = merge(var.tags, { "Resource Type" = "Disk Encryption Set" })
}

resource "azurerm_role_assignment" "this" {
  count                = (local.identity_system_assigned != null || local.identity_system_assigned_user_assigned != null) ? 1 : 0
  principal_id         = azurerm_disk_encryption_set.this.identity[0].principal_id
  scope                = var.key_vault_resource_id
  role_definition_name = "Key Vault Crypto Service Encryption User"
}