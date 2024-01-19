variable "path" {
  description = "The main path // /<path>/<name>"
  type        = string
}
variable "name" {
  description = "The name of the parameter // /<path>/<name>"
  type        = string
  default     = null
}
variable "include_filter_regex" {
  description = "A RE2 based regex to be applied to the SSM path to only include specific paths. (https://developer.hashicorp.com/terraform/language/functions/regexall)"
  type        = string
  default     = null
}

variable "exclude_filter_regex" {
  description = "A RE2 based regex to be applied to the SSM path to exclude specific paths. (https://developer.hashicorp.com/terraform/language/functions/regexall)"
  type        = string
  default     = null
}

variable "lock" {
  description = "Leave a `.lock` and document consumption of the data"
  type = object({
    enabled = bool
    service = string
  })
  default = {
    enabled = false
    service = null
  }
  validation {
    condition = var.lock.enabled == true ? length(var.lock.service) != null : true
    error_message = "The lock service must be set."
  }
}