# ssm_json_store

CRUD JSON information in SSM parameter store.

## License
Courtesy of LYNQTECH GmbH, licensed under the [MIT license](https://opensource.org/license/mit/)

## Usage

### Create data in `/<path>/<name>`
```terraform
module "create_json_ssm" {
  source  = "registry.example.com/foo/ssm_json_store/aws"
  version = "~> 0.1.0"

  path    = "/configuration/dev_blue"
  name    = "foo"
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
module "read_json_ssm" {
  source  = "registry.example.com/foo/ssm_json_store/aws"
  version = "~> 0.1.0"

  path    = "/configuration/dev_blue"
  name    = "foo"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.mod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.mod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data"></a> [data](#input\_data) | Map to be passed in as the SSM parameter value // will be stored as JSON in SSM | `any` | `{}` | no |
| <a name="input_data_base64_encode"></a> [data\_base64\_encode](#input\_data\_base64\_encode) | Should BASE64 be used to store/read data from SSM parameter? Not supported in combination with External Secrets Operator | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the parameter // /<path>/<name> | `string` | n/a | yes |
| <a name="input_overwrite"></a> [overwrite](#input\_overwrite) | Set the overwrite flag for existing parameters. Obsolete and a bit unclear for the future, see also: https://github.com/hashicorp/terraform-provider-aws/issues/25636 | `bool` | `true` | no |
| <a name="input_path"></a> [path](#input\_path) | The path to store the parameter in // /<path>/<name> | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | add. tags for resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_value"></a> [value](#output\_value) | The value |
<!-- END_TF_DOCS -->