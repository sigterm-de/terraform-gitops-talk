resource "aws_ssm_parameter" "mod" {
  count = length(var.data) > 0 ? 1 : 0

  name        = local.path
  description = "The configuration data for ${local.path}"
  tags        = merge(var.tags, local.aws_tags)
  type        = "SecureString"
  value       = var.data_base64_encode ? base64encode(jsonencode(var.data)) : jsonencode(var.data)
  tier        = local.tier
}

data "aws_ssm_parameter" "mod" {
  count = length(var.data) < 1 ? 1 : 0
  name  = local.path
}

locals {
  tier = length(var.data) > 0 && length(base64encode(jsonencode(var.data))) <= 4096 ? "Standard" : "Advanced"
  aws_tags = {
    "Provisioner" = "Terraform"
  }
  path = join(
    "/",
    [
      "",
      trim(var.path, "/"),
      trim(var.name, "/")
    ]
  )
}
