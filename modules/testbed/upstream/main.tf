# --- some test data -----------------------
locals {
  path = "/pseudo-random-test/"
  test_data = {
    "foo.v1" = {
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

module "validated_data" {
  for_each = local.test_data
  source = "../../configuration_schema"

  data = each.value
}

module "upstream" {
  for_each = local.test_data
  source   = "../../ssm_json_store"

  name = each.key
  path = local.path
  data = module.validated_data[each.key].validated
}