locals {
  # Potential resources
  ## Secret
  potential_secret = length(data.oci_vault_secrets.existing_secret.secrets) < 1 ? {
    "resource" = {
      # Required
      compartment_id = var.secret.compartment_id
      secret_name    = var.secret.secret_name
      secret_content = var.secret.secret_content
      vault_id       = var.secret.vault_id
      # Optional
      key_id        = var.secret.key_id
      description   = var.secret.description
      defined_tags  = var.secret.defined_tags
      freeform_tags = var.secret.freeform_tags
      metadata      = var.secret.metadata
    }
  } : {}

  # Outputs
  ## Secret
  prep_existing_secret_output = length(data.oci_vault_secrets.existing_secret.secrets) > 0 ? {
    "resource" = {
      compartment_id                 = data.oci_vault_secrets.existing_secret.secrets[0].compartment_id
      current_version_number         = data.oci_vault_secrets.existing_secret.secrets[0].current_version_number
      defined_tags                   = data.oci_vault_secrets.existing_secret.secrets[0].defined_tags
      description                    = data.oci_vault_secrets.existing_secret.secrets[0].description
      freeform_tags                  = data.oci_vault_secrets.existing_secret.secrets[0].freeform_tags
      id                             = data.oci_vault_secrets.existing_secret.secrets[0].id
      key_id                         = data.oci_vault_secrets.existing_secret.secrets[0].key_id
      lifecycle_details              = data.oci_vault_secrets.existing_secret.secrets[0].lifecycle_details
      metadata                       = data.oci_vault_secrets.existing_secret.secrets[0].metadata
      secret_name                    = data.oci_vault_secrets.existing_secret.secrets[0].secret_name
      secret_rules                   = data.oci_vault_secrets.existing_secret.secrets[0].secret_rules
      state                          = data.oci_vault_secrets.existing_secret.secrets[0].state
      time_created                   = data.oci_vault_secrets.existing_secret.secrets[0].time_created
      time_of_current_version_expiry = data.oci_vault_secrets.existing_secret.secrets[0].time_of_current_version_expiry
      time_of_deletion               = data.oci_vault_secrets.existing_secret.secrets[0].time_of_deletion
      vault_id                       = data.oci_vault_secrets.existing_secret.secrets[0].vault_id
    }
  } : {}
  output_secret = merge(oci_vault_secret.this, local.prep_existing_secret_output)
}