## Optional input variables.


variable "oci_domain_uri" {
  type        = string
  description = "A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant. I,e https://idcs-<unique_ID>.identity.oraclecloud.com:443/fed"
}

variable "application_group_name" {
  type        = string
  default     = ""
  description = "User application group name that will be added to the application"
}

variable "application_name" {
  type        = string
  default     = "odbaa_app"
  description = "The display name for the application."
}

variable "claim" {
  type        = bool
  default     = true
  description = "Enable this will edit Attributes and Claims in your new Azure AD SAML app so that the user email address is used as the user name."
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

variable "user_email" {
  type        = string
  default     = ""
  description = "Existing user email that will be added to the application."
}
