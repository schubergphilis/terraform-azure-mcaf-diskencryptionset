resource "azurerm_disk_encryption_set" "this" {
  location                  = var.location
  name                      = var.name
  resource_group_name       = var.resource_group_name
  auto_key_rotation_enabled = var.auto_key_rotation_enabled
  encryption_type           = var.encryption_type
  federated_client_id       = var.federated_client_id
  key_vault_key_id          = var.key_vault_key_id
  managed_hsm_key_id        = var.managed_hsm_key_id

  dynamic "identity" {
    for_each = coalesce(local.identity_system_assigned_user_assigned, local.identity_system_assigned, local.identity_user_assigned)

    content {
      type         = identity.value.type
      identity_ids = identity.value.user_assigned_resource_ids
    }
  }

  tags = merge(
    try(var.tags),
    tomap({
      "Resource Type" = "Disk Encryption Set"
    })
  )
}

resource "azurerm_role_assignment" "this" {
  count = (local.identity_system_assigned != null || local.identity_system_assigned_user_assigned != null) ? 1 : 0
  principal_id         = azurerm_disk_encryption_set.this.identity[0].principal_id
  scope                = var.key_vault_resource_id
  role_definition_name = "Key Vault Crypto Service Encryption User"
}