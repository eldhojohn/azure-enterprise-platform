provider "azurerm" {
  features {}

  resource_provider_registrations = "none"

  resource_providers_to_register = [
    "Microsoft.Authorization",
    "Microsoft.Insights",
    "Microsoft.ManagedIdentity",
    "Microsoft.Network",
    "Microsoft.OperationalInsights",
    "Microsoft.Resources",
    "Microsoft.Security",
    "Microsoft.Storage"
  ]
}
