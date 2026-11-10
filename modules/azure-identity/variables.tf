variable "adbs_rbac" {
  type        = bool
  default     = false
  description = "Setup RBAC for ADB-S in Azure. Default is false."
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

variable "exa_rbac" {
  type        = bool
  default     = false
  description = "Setup RBAC for Exa in Azure. Default is false."
}

variable "group_prefix" {
  type        = string
  default     = ""
  description = "Group name prefix in Azure"
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
