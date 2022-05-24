locals {
  scopes = toset([for s in var.subscription_ids : "/subscriptions/${s}"])
}

data "azuread_client_config" "current" {}

resource "azuread_application" "aa" {
  display_name = "${var.name}-app"
  owners = [
    data.azuread_client_config.current.object_id
  ]
}

resource "azuread_service_principal" "asp" {
  application_id = azuread_application.aa.application_id
  owners = [
    data.azuread_client_config.current.object_id
  ]
}

resource "azuread_service_principal_password" "aspp" {
  service_principal_id = azuread_service_principal.asp.id
  depends_on = [
    azuread_application.aa
  ]
}

resource "azuread_application_password" "aap" {
  application_object_id = azuread_application.aa.object_id
  depends_on = [
    azuread_application.aa
  ]
}

resource "azurerm_role_assignment" "main" {
  for_each             = local.scopes
  scope                = each.value
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.asp.id
}