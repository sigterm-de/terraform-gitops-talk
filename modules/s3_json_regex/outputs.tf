output "values" {
  description = "Merged JSON output"
  value = merge({
    for k in local.filtered_paths : replace(k, "/.*//", "") => jsondecode(try(base64decode(data.aws_s3_object.object[k].body), data.aws_s3_object.object[k].body))
  })
  sensitive = false
}

output "all_paths_found" {
  description = "A list of all S3 objects found without applying any filter (debugging)."
  value       = local.names
}
output "filtered_paths" {
  description = "A list of all S3 objects found applying filters (debugging)."
  value       = local.filtered_paths
}