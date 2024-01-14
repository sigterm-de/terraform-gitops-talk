# example.tf
locals {
  names = toset(data.aws_ssm_parameters_by_path.parameters.names)
  path = join(
    "/",
    [
      "",
      trim(var.path, "/"),
      try(trim(var.name, "/"), "")
    ]
  )
  filtered_paths = var.include_filter_regex != null ? toset([for p in local.names : p if length(regexall(var.include_filter_regex, p)) > 0]) : var.exclude_filter_regex != null ? toset([for p in local.names : p if length(regexall(var.exclude_filter_regex, p)) == 0]) : local.names
}

data "aws_ssm_parameters_by_path" "parameters" {
  path      = local.path
  recursive = true
}

data "aws_ssm_parameter" "param" {
  for_each = local.filtered_paths
  name     = each.key
}
