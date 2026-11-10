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

variable "odbaa_built_in_role_assigned_groups" {
  type        = set(string)
  default     = []
  description = "Groups required Built-in Azure Role assigned"
}

variable "odbaa_other_groups" {
  type        = set(string)
  default     = []
  description = "Groups don't require Built-in Azure Role assigned"
}

variable "role_mapping" {
  type        = map(string)
  default     = null
  description = "Group name and Role mapping in Azure"
}
