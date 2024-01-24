# s3_json_store

CRUD JSON information in S3.

## License
Courtesy of LYNQTECH GmbH, licensed under the [MIT license](https://opensource.org/license/mit/)

## Usage

### Create data in `/<path>/<name>`
```terraform
module "create_json_s3" {
  source  = "registry.example.com/foo/s3_json_store/aws"
  version = "~> 0.1.0"

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
  version = "~> 0.1.0"

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
| [aws_s3_object.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_object) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The bucket, holding the data | `string` | n/a | yes |
| <a name="input_data"></a> [data](#input\_data) | Map to be passed in // will be stored as JSON in S3 | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the data // /<path>/<name> | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The path to store the data in // /<path>/<name> | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | add. tags for resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_value"></a> [value](#output\_value) | The value |
<!-- END_TF_DOCS -->