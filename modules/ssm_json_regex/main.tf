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
  # drop all `<service>.lock` entries
  filtered_names = toset([for p in local.names : p if length(regexall("([a-zA-Z0-9]*\\.lock)", p)) == 0])
  # apply filters (if any)
  filtered_paths = var.include_filter_regex != null ? toset(
    [for p in local.filtered_names : p if length(regexall(var.include_filter_regex, p)) > 0]
  ) : var.exclude_filter_regex != null ? toset(
      [for p in local.filtered_names : p if length(regexall(var.exclude_filter_regex, p)) == 0]
    ) : local.filtered_names
}

data "aws_ssm_parameters_by_path" "parameters" {
  path      = local.path
  recursive = true
}

data "aws_ssm_parameter" "param" {
  for_each = local.filtered_paths
  name     = each.key
}

## also leave a `.lock` entry at read
resource "aws_ssm_parameter" "lock" {
  for_each = var.lock != null ? local.filtered_paths : toset([])
  name     = "${each.key}/${var.lock}.lock"
  type     = "String"
  value    = "true"
  overwrite = true
}