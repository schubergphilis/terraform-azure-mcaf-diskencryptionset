variable "key_vault_key_id" {
  type        = string
  description = "The Key Vault Key ID used for encryption."
}

variable "key_vault_resource_id" {
  type        = string
  description = "The resource ID of the Key Vault to associate with the disk encryption set."
}

variable "location" {
  type        = string
  description = "Azure region where the resource should be deployed."
  nullable    = false
}

variable "name" {
  type        = string
  description = "The name of the disk encryption set."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the disk encryption set."
}

variable "auto_key_rotation_enabled" {
  type        = bool
  default     = true
  description = "Whether or not auto key rotation is enabled for the encryption set, defaults to true."
}

variable "encryption_type" {
  type        = string
  default     = "EncryptionAtRestWithCustomerKey" # Optional: Adjust default value based on your requirements
  description = "The type of encryption to be used. Allowed Values are'EncryptionAtRestWithCustomerKey', 'EncryptionAtRestWithPlatformAndCustomerKeys' and 'ConfidentialVmEncryptedWithCustomerKey'."
}

variable "federated_client_id" {
  type        = string
  default     = null # Optional: Set to an empty string if not using a federated service principal
  description = " Multi-tenant application client id to access key vault in a different tenant."
}

variable "managed_hsm_key_id" {
  type        = string
  default     = null # Optional: Set to an empty string if not using Managed HSM
  description = "The Managed HSM Key ID used for encryption."
}

variable "managed_identities" {
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default     = {}
  description = <<DESCRIPTION
Controls the Managed Identity configuration on this resource. The following properties can be specified:

- `system_assigned` - (Optional) Specifies if the System Assigned Managed Identity should be enabled.
- `user_assigned_resource_ids` - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.

Example Input:

```hcl
managed_identities = {
  system_assigned = true
}
```
DESCRIPTION
  nullable    = false
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}