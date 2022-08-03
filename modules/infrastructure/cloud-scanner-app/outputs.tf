# outputs data about resource created

output "tenant_id" {
  value       = azuread_service_principal.asp.application_tenant_id
  description = "Service principal tenant ID"
}

output "client_id" {
  value       = azuread_application.aa.application_id
  description = "Service principal ID"
}

output "client_secret" {
  value       = azuread_service_principal_password.aspp.value
  description = "Service principal secret"
  sensitive   = true
}