# ssm_json_regex

Read all JSON information from the parameter store under path `/<path>/<system>`

Based on https://stackoverflow.com/questions/73044446/terraform-copy-aws-ssm-parameters

## License
Courtesy of LYNQTECH GmbH, licensed under the [MIT license](https://opensource.org/license/mit/)

## Usage

```terraform
module "global_service_inventory" {
  source  = "registry.example.com/foo/ssm_json_regex/aws"
  version = "~> 0.1.0"

  path = "/service-inventory"
  # name = "foo"  -> "/${path}/${name}"
  # include_filter_regex = "(/configuration/base|/configuration/devops-.*)" -> all parameters below "/${path}/${name}" will be filtered on "== regex(${filter[x]})"
  # exclude_filter_regex = "(/configuration/base|/configuration/devops-.*)" -> all parameters below "/${path}/${name}" will be filtered on "!= regex(${filter[x]})"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.45 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.45 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.param](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameters_by_path.parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameters_by_path) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_exclude_filter_regex"></a> [exclude\_filter\_regex](#input\_exclude\_filter\_regex) | A RE2 based regex to be applied to the SSM path to exclude specific paths. (https://developer.hashicorp.com/terraform/language/functions/regexall) | `string` | `null` | no |
| <a name="input_include_filter_regex"></a> [include\_filter\_regex](#input\_include\_filter\_regex) | A RE2 based regex to be applied to the SSM path to only include specific paths. (https://developer.hashicorp.com/terraform/language/functions/regexall) | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the parameter // /<path>/<name> | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | The main path // /<path>/<name> | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_paths_found"></a> [all\_paths\_found](#output\_all\_paths\_found) | A list of all SSM parameters found without applying any filter (debugging). |
| <a name="output_filtered_paths"></a> [filtered\_paths](#output\_filtered\_paths) | A list off all SSM parameters found applying filters (debugging). |
| <a name="output_values"></a> [values](#output\_values) | Merged JSON output |
<!-- END_TF_DOCS -->