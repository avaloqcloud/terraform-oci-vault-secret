# Data lookups of existing resources
## Secret
data "oci_vault_secrets" "existing_secret" {
  # Required
  compartment_id = var.secret.compartment_id

  # Optional (built-in filter)
  name     = var.secret.secret_name
  state    = "ACTIVE"
  vault_id = var.secret.vault_id
}