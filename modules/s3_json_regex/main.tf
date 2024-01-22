locals {
  names = toset(data.aws_s3_objects.objects.keys)
  path = join(
    "/",
    [
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

data "aws_s3_objects" "objects" {
  bucket = var.bucket
  prefix = local.path
}

data "aws_s3_object" "object" {
  for_each = local.filtered_paths
  bucket   = var.bucket
  key      = each.key
}

## also leave a `.lock` entry at read
resource "aws_s3_object" "lock" {
  for_each = var.lock != null ? local.filtered_paths : toset([])

  bucket       = var.bucket
  key          = "${each.key}/${var.lock}.lock"
  content      = jsonencode({ "lock" : var.lock })
  content_type = "application/json"
  tags         = { "Provisioner" = "Terraform" }
}