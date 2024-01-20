# configuration_schema

Validate your data against a versioned JSON schema 

## License
Courtesy of Daniel Ciaglia, licensed under the [MIT license](https://opensource.org/license/mit/)

## Usage

```terraform
module "validated_data" {
  source = "configuration-schema"
  version = "1.0.0"

  data = {
    installed = true
    private   = {}
    public    = {}
  }
}

module "ssm_data" {
  source = "ssm_json_store"

  name = "foo"
  path = "/configuration/"
  data = module.validated_data.validated
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_jsonschema"></a> [jsonschema](#requirement\_jsonschema) | 0.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_jsonschema"></a> [jsonschema](#provider\_jsonschema) | 0.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [jsonschema_validator.values](https://registry.terraform.io/providers/nekottyo/jsonschema/0.1.1/docs/data-sources/validator) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data"></a> [data](#input\_data) | The data to be validated against this version of JSON schema | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_raw"></a> [raw](#output\_raw) | n/a |
| <a name="output_validated"></a> [validated](#output\_validated) | The validated data |
<!-- END_TF_DOCS -->