[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/avaloqcloud/terraform-oci-vault-secret/archive/refs/heads/main.zip)
# Terraform OCI Vault Secret
The code provides a reusable and standalone Terraform module that provisions a Vault Secret on Oracle Cloud Infrastructure.

>⚠️**CAUTION:** Usage of this module assumes no reliance on existing Terraform/ORM state, apply on existing terraform state will remove existng `key` resource if managed in state. ⚠️

## Example Input
`secret.auto.tfvars.json`:
```json
{
    "secret": {
        "compartment_id": "ocid1.tenancy.oc1..x",
        "secret_name": "my-secret",
        "secret_content": {
            "content_type": "BASE64",
            "content": "eyJ2ZXJ5X2ltcG9ydGFudF9zZWNyZXQiOiJzZWNyZXQifQo="
        },
        "vault_id": "ocid1.vault.oc1.eu-frankfurt-1.x",
        "key_id": "ocid1.key.oc1.eu-frankfurt-1.x",
       "description": "My Secret"
    }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.9 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_vault_secret.this](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/resources/vault_secret) | resource |
| [oci_vault_secrets.existing_secret](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/data-sources/vault_secrets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secret"></a> [secret](#input\_secret) | Secret input object | <pre>object({<br>    # Required<br>    secret_name    = string,<br>    compartment_id = string,<br>    vault_id       = string, # comes from vault object<br>    key_id        = string, # comes from key object<br>    secret_content = object({<br>      content_type = string,<br>      content      = string,<br>      # Optional<br>      name  = optional(string),<br>      stage = optional(string),<br>    })<br>    # Optional<br>    description   = optional(string),<br>    defined_tags  = optional(map(string)),<br>    freeform_tags = optional(map(string)),<br>    metadata      = optional(map(string)),<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret"></a> [secret](#output\_secret) | Secret output object |
<!-- END_TF_DOCS -->