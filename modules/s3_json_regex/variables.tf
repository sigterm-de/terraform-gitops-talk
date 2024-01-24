variable "bucket" {
  description = "The bucket, holding the data"
  type        = string
}
variable "path" {
  description = "The main path // /<path>/<name>"
  type        = string
}
variable "name" {
  description = "The name of the object // /<path>/<name>"
  type        = string
  default     = null
}
variable "include_filter_regex" {
  description = "A RE2 based regex to be applied to the S3 prefix to only include specific keys. (https://developer.hashicorp.com/terraform/language/functions/regexall)"
  type        = string
  default     = null
}

variable "exclude_filter_regex" {
  description = "A RE2 based regex to be applied to the S3 prefix to exclude specific keys. (https://developer.hashicorp.com/terraform/language/functions/regexall)"
  type        = string
  default     = null
}

variable "lock" {
  description = "Soft data contract - leave a `.lock` at the read objects and document consumption of the data // should be the name of the consuming stack"
  type        = string
  default     = null
}