resource "aws_s3_object" "data" {
  count = length(var.data) > 0 ? 1 : 0

  bucket = var.bucket
  key    = local.path

  content      = jsonencode(var.data)
  content_type = "application/json"
  tags         = local.aws_tags
}

data "aws_s3_object" "data" {
  count  = length(var.data) < 1 ? 1 : 0
  bucket = var.bucket
  key    = local.path
}

locals {
  aws_tags = merge(var.tags, { "Provisioner" = "Terraform" })
  path = join(
    "/",
    [
      "",
      trim(var.path, "/"),
      trim(var.name, "/")
    ]
  )
}
