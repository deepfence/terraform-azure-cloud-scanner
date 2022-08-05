# data source to access the configuration of the AzureAD provider.

data "azuread_client_config" "current" {}

# Manages an application registration within Azure Active Directory.

resource "azuread_application" "aa" {
  display_name = "${var.name}-app"
  owners = [
    data.azuread_client_config.current.object_id
  ]
}

# Manages a service principal associated with an application within Azure Active Directory.

resource "azuread_service_principal" "asp" {
  application_id = azuread_application.aa.application_id
  owners = [
    data.azuread_client_config.current.object_id
  ]
}

# Manages a password credential associated with a service principal within Azure Active Directory.

resource "azuread_service_principal_password" "aspp" {
  service_principal_id = azuread_service_principal.asp.id
  depends_on = [
    azuread_application.aa
  ]
}

# Manages a password credential associated with an application within Azure Active Directory.

resource "azuread_application_password" "aap" {
  application_object_id = azuread_application.aa.object_id
  depends_on = [
    azuread_application.aa
  ]
}

resource "azuread_directory_role" "example" {
  display_name = "Global Reader"
}

resource "azuread_directory_role_assignment" "example" {
  role_id             = azuread_directory_role.example.template_id
  principal_object_id = azuread_service_principal.asp.object_id
}

