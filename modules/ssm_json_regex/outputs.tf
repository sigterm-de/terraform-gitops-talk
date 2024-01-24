output "values" {
  description = "Merged JSON output"
  value = merge({
    for k in local.filtered_paths : replace(k, "//.*//", "") => jsondecode(try(base64decode(data.aws_ssm_parameter.param[k].value), data.aws_ssm_parameter.param[k].value))
  })
  sensitive = false
}

output "all_paths_found" {
  description = "A list of all SSM parameters found without applying any filter (debugging)."
  value       = local.names
}
output "filtered_paths" {
  description = "A list of all SSM parameters found applying filters (debugging)."
  value       = local.filtered_paths
}