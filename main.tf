resource "oci_vault_secret" "this" {
  #Required
  compartment_id = var.secret.compartment_id
  secret_content {
    #Required
    content_type = var.secret.secret_content.content_type
    content      = var.secret.secret_content.content
    #Optional
    name  = var.secret.secret_content.name
    stage = var.secret.secret_content.stage
  }
  secret_name = var.secret.secret_name
  vault_id    = var.secret.vault_id
  #Optional
  defined_tags  = var.secret.defined_tags
  description   = var.secret.description
  freeform_tags = var.secret.freeform_tags
  key_id        = var.secret.key_id
  metadata      = var.secret.metadata
  /*
  Unhandled Parameters:
    secret_rules {
        #Required
        rule_type = var.secret_secret_rules_rule_type

        #Optional
        is_enforced_on_deleted_secret_versions = var.secret_secret_rules_is_enforced_on_deleted_secret_versions
        is_secret_content_retrieval_blocked_on_expiry = var.secret_secret_rules_is_secret_content_retrieval_blocked_on_expiry
        secret_version_expiry_interval = var.secret_secret_rules_secret_version_expiry_interval
        time_of_absolute_expiry = var.secret_secret_rules_time_of_absolute_expiry
    }
  */
}