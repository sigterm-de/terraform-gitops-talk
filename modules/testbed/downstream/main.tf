locals {
  service   = "downstream"
  ssm_path  = "<the output of upstream>"
  s3_bucket = "<the output of upstream>"
  s3_prefix = "configuration"
}

module "test" {
  source = "../../ssm_json_regex"

  path                 = "/${local.ssm_path}/"
  include_filter_regex = "(foo_v1)"

  lock = local.service
}

output "test_ssm" {
  description = "SSM: Values of found parameters"
  value       = module.test.values
  sensitive   = true
}

module "test_s3" {
  source = "../../s3_json_regex"

  bucket               = local.s3_bucket
  path                 = local.s3_prefix
  include_filter_regex = "(foo_v1|bar)"

  lock = local.service
}

output "test_s3" {
  description = "S3: Values of found parameters"
  value       = module.test_s3.values
  sensitive   = true
}
