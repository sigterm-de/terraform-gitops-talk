output "value" {
  description = "The value"
  value       = length(var.data) > 0 ? jsondecode(aws_s3_object.data[0].content) : jsondecode(data.aws_s3_object.data[0].body)
  sensitive   = true
}
