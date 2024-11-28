# terraform-azure-mcaf-diskencryptionset
Terraform module for a disk encryption set

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.5, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.5, < 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_disk_encryption_set.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_vault_key_id"></a> [key\_vault\_key\_id](#input\_key\_vault\_key\_id) | The Key Vault Key ID used for encryption. | `string` | n/a | yes |
| <a name="input_key_vault_resource_id"></a> [key\_vault\_resource\_id](#input\_key\_vault\_resource\_id) | The resource ID of the Key Vault to associate with the disk encryption set. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region where the resource should be deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the disk encryption set. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the disk encryption set. | `string` | n/a | yes |
| <a name="input_auto_key_rotation_enabled"></a> [auto\_key\_rotation\_enabled](#input\_auto\_key\_rotation\_enabled) | Whether or not auto key rotation is enabled for the encryption set. | `bool` | `false` | no |
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | The type of encryption to be used. Allowed Values are'EncryptionAtRestWithCustomerKey', 'EncryptionAtRestWithPlatformAndCustomerKeys' and 'ConfidentialVmEncryptedWithCustomerKey'. | `string` | `"EncryptionAtRestWithCustomerKey"` | no |
| <a name="input_federated_client_id"></a> [federated\_client\_id](#input\_federated\_client\_id) | Multi-tenant application client id to access key vault in a different tenant. | `string` | `null` | no |
| <a name="input_managed_hsm_key_id"></a> [managed\_hsm\_key\_id](#input\_managed\_hsm\_key\_id) | The Managed HSM Key ID used for encryption. | `string` | `null` | no |
| <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities) | Controls the Managed Identity configuration on this resource. The following properties can be specified:<br><br>- `system_assigned` - (Optional) Specifies if the System Assigned Managed Identity should be enabled.<br>- `user_assigned_resource_ids` - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.<br><br>Example Input:<pre>hcl<br>managed_identities = {<br>  system_assigned = true<br>}</pre> | <pre>object({<br>    system_assigned            = optional(bool, false)<br>    user_assigned_resource_ids = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags of the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource"></a> [resource](#output\_resource) | This is the full output for the resource. |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The ID of the disk encryption set. |
<!-- END_TF_DOCS -->

## License

**Copyright:** Schuberg Philis

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```