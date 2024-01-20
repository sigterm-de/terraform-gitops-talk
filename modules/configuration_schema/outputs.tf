output "validated" {
  description = "The validated data"
  value       = jsondecode(data.jsonschema_validator.values.validated)
  sensitive   = true
}
output "raw" {
  value = var.data
}