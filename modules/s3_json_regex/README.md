# s3_json_store

CRUD JSON information in S3.

## License
Courtesy of LYNQTECH GmbH, licensed under the [MIT license](https://opensource.org/license/mit/)

## Usage

### Create data in `/<path>/<name>`
```terraform
module "create_json_s3" {
  source  = "registry.example.com/foo/s3_json_store/aws"
  version = "~> 0.1"

  bucket = aws_s3_bucket.this.id
  path   = "/configuration/"
  name   = "/foo/bar.json"

  data = {
    this = {
      is = {
        content = true
      }
    }
  }
}
```
### Read data from `/<path>/<name>`
```terraform
module "read_json_s3" {
  source  = "registry.example.com/foo/s3_json_store/aws"
  version = "~> 0.1"

  bucket = aws_s3_bucket.this.id
  path   = "/configuration/"
  name   = "/foo/bar.json"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_object.lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_object) | data source |
| [aws_s3_objects.objects](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_objects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The bucket, holding the data | `string` | n/a | yes |
| <a name="input_exclude_filter_regex"></a> [exclude\_filter\_regex](#input\_exclude\_filter\_regex) | A RE2 based regex to be applied to the S3 prefix to exclude specific keys. (https://developer.hashicorp.com/terraform/language/functions/regexall) | `string` | `null` | no |
| <a name="input_include_filter_regex"></a> [include\_filter\_regex](#input\_include\_filter\_regex) | A RE2 based regex to be applied to the S3 prefix to only include specific keys. (https://developer.hashicorp.com/terraform/language/functions/regexall) | `string` | `null` | no |
| <a name="input_lock"></a> [lock](#input\_lock) | Soft data contract - leave a `.lock` at the read objects and document consumption of the data // should be the name of the consuming stack | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the object // /<path>/<name> | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | The main path // /<path>/<name> | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_paths_found"></a> [all\_paths\_found](#output\_all\_paths\_found) | A list of all S3 objects found without applying any filter (debugging). |
| <a name="output_filtered_paths"></a> [filtered\_paths](#output\_filtered\_paths) | A list of all S3 objects found applying filters (debugging). |
| <a name="output_values"></a> [values](#output\_values) | Merged JSON output |
<!-- END_TF_DOCS -->