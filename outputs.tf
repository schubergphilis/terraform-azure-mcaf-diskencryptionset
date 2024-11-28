output "resource" {
  description = "This is the full output for the resource."
  value       = azurerm_disk_encryption_set.this
}

output "resource_id" {
  description = "The ID of the disk encryption set."
  value       = azurerm_disk_encryption_set.this.id
}