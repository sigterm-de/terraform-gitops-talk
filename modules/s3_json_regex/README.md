# s3_json_regex

Read all JSON information from the S3 bucket under path `/<path>/<name>`

Based on the `ssm_json_regex` modules

## License
Courtesy of Daniel Ciaglia <daniel@sigterm.de>, licensed under the [MIT license](https://opensource.org/license/mit/)

## Usage

```terraform
module "global_service_inventory" {
  source  = "registry.example.com/foo/s3_json_regex/aws"
  version = "~> 0.1.0"

  path = "/service-inventory"
  # name = "foo"  -> "/${path}/${name}"
  # include_filter_regex = "(base|/configuration/devops-.*)" -> all parameters below "/${path}/${name}" will be filtered on "== regex(${filter[x]})"
  # exclude_filter_regex = "(base|/configuration/devops-.*)" -> all parameters below "/${path}/${name}" will be filtered on "!= regex(${filter[x]})"
  
  # Soft data contract - leave a `.lock` at the read objects and document consumption of the data
  lock = "this.service"
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