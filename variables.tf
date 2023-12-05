variable "secret" {
  description = "Secret input object"
  type = object({
    # Required
    secret_name    = string,
    compartment_id = string,
    vault_id       = string, # comes from vault object
    key_id         = string, # comes from key object
    secret_content = object({
      content_type = string,
      content      = string,
      # Optional
      name  = optional(string),
      stage = optional(string),
    })
    # Optional
    description   = optional(string),
    defined_tags  = optional(map(string)),
    freeform_tags = optional(map(string)),
    metadata      = optional(map(string)),
  })
  validation {
    condition     = contains(["BASE64"], var.secret.secret_content.content_type)
    error_message = "Validation of the Secret object failed. 'secret_content.content_type' must be 'BASE64'."
  }
}