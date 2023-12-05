resource "oci_vault_secret" "this" {
  for_each = local.potential_secret
  #Required
  compartment_id = each.value.compartment_id
  secret_content {
    #Required
    content_type = each.value.secret_content.content_type
    content      = each.value.secret_content.content
    #Optional
    name  = each.value.secret_content.name
    stage = each.value.secret_content.stage
  }
  secret_name = each.value.secret_name
  vault_id    = each.value.vault_id
  #Optional
  defined_tags  = each.value.defined_tags
  description   = each.value.description
  freeform_tags = each.value.freeform_tags
  key_id        = each.value.key_id
  metadata      = each.value.metadata
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