variable "path" {
  description = "The path to store the parameter in // /<path>/<name>"
  type        = string
}
variable "name" {
  description = "The name of the parameter // /<path>/<name>"
  type        = string
}

variable "data" {
  description = "Map to be passed in as the SSM parameter value // will be stored as JSON in SSM"
  type        = any
  default     = {}
}

variable "tags" {
  description = "add. tags for resources"
  type        = map(string)
  default     = {}
}

variable "data_base64_encode" {
  description = "Should BASE64 be used to store/read data from SSM parameter? Not supported in combination with External Secrets Operator"
  type        = bool
  default     = false
}

variable "overwrite" {
  description = "Set the overwrite flag for exisiting parameters. Obsolete and a bit unclear for the future, see also: https://github.com/hashicorp/terraform-provider-aws/issues/25636"
  type        = bool
  default     = false
}