# --- some test data -----------------------
locals {
  s3_prefix = "configuration"
  test_data = {
    "foo.v1" = {
      installed = true
      private = {
        kubernetes = {
          role_arn        = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
          service_account = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        }
        database = {
          foo = {
            name            = "module.database.database_name"
            username        = "module.database.database_username"
            secret_key      = "module.database.secret_key"
            endpoint        = "module.database.endpoint"
            reader_endpoint = "module.database.reader_endpoint"
            port            = 5432
          }
        }
      }
      public = {}
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
  source   = "../../configuration_schema"
  # version = "1.0.0"

  data = each.value
}

resource "random_string" "random" {
  length  = 24
  special = false
}

# --- SSM as backend --------------------------------------------------
module "upstream_ssm" {
  for_each = local.test_data
  source   = "../../ssm_json_store"

  name = each.key
  path = lower(random_string.random.id)
  data = module.validated_data[each.key].validated
}

# --- S3 as backend ---------------------------------------------------
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.0.1"

  bucket = lower(random_string.random.id)

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "aws:kms"
      }
    }
  }

  versioning = { enabled = true }
}

module "upstream_s3" {
  for_each = local.test_data
  source   = "../../s3_json_store"

  bucket = module.s3_bucket.s3_bucket_id
  path   = local.s3_prefix

  name = each.key
  data = module.validated_data[each.key].validated
}

# --- outputs ----------------------------------------------------------
output "ssm_path" {
  value       = random_string.random.id
  description = "SSM path"
}

output "s3_bucket" {
  value       = module.s3_bucket.s3_bucket_id
  description = "S3 bucket"
}
output "s3_prefix" {
  value       = local.s3_prefix
  description = "S3 prefix"
}