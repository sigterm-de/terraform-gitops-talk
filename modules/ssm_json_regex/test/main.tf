locals {
  service = "demo"
}

module "test" {
  source = "../"

  path                 = "/${random_id.path.id}/"
  include_filter_regex = "(foo)"

  lock = {
    enabled = true
    service = local.service
  }
}

output "test" {
  description = "Values of found parameters"
  value       = module.test.values
  sensitive   = true
}

# --- some test data -----------------------
locals {
  test = {
    foo = {
      installed = true
      private   = {}
      public    = {}
    }
    bar = {
      installed = true
      private   = {}
      public    = {}
    }
  }
}

resource "random_id" "path" {
  byte_length = 8
}

resource "aws_ssm_parameter" "foo" {
  for_each    = local.test
  name        = "/${random_id.path.id}/${each.key}"
  description = "Data for ${each.key}"
  type        = "SecureString"
  value       = jsonencode(each.value)
}