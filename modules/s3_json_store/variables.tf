variable "bucket" {
  description = "The bucket, holding the data"
  type        = string
}
variable "path" {
  description = "The path to store the data in // /<path>/<name>"
  type        = string
}
variable "name" {
  description = "The name of the data // /<path>/<name>"
  type        = string
}

variable "data" {
  description = "Map to be passed in // will be stored as JSON in S3"
  type        = any
  default     = {}
}

variable "tags" {
  description = "add. tags for resources"
  type        = map(string)
  default     = {}
}
