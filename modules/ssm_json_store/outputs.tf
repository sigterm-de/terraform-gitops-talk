output "value" {
  description = "The value"
  value       = length(var.data) > 0 ? jsondecode(var.data_base64_encode ? base64decode(aws_ssm_parameter.mod[0].value) : aws_ssm_parameter.mod[0].value) : jsondecode(var.data_base64_encode ? base64decode(data.aws_ssm_parameter.mod[0].value) : data.aws_ssm_parameter.mod[0].value)
  sensitive   = true
}
