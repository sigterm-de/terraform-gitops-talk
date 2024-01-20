locals {
  service = "downstream"
  path = "/pseudo-random-test/"
}

module "test" {
  source = "../../ssm_json_regex"

  path                 = "/${local.path}/"
  include_filter_regex = "(foo.v1)"

  lock = local.service
}

output "test" {
  description = "Values of found parameters"
  value       = module.test.values
  sensitive   = true
}
