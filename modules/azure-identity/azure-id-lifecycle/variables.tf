variable "az_ad_app_object_id" {
  description = "objectId of azure enterprise app created for sso"
}

variable "oci_confidential_app_secret_token" {
  description = "oci confidential app secret token , base64 encode of client-id:client-secret"
}

variable "oci_domain_identity_admin_url" {
  description = "admin domain url e.g. https://idcs-<>.identity.oraclecloud.com:443/admin/v1"
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
  nullable    = false
}

variable "location" {
  type        = string
  default     = null
  description = "The Azure region for this module's resources or telemetry deployment."

  validation {
    condition     = !var.enable_telemetry || var.location != null
    error_message = "The location must not be null when telemetry is enabled."
  }
}
