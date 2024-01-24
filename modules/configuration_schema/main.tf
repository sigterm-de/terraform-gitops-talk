data "jsonschema_validator" "values" {
  document = jsonencode(var.data)
  schema   = file("${path.module}/schema.json")
}