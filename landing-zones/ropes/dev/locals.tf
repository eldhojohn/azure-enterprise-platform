locals {
  application_name = lower(var.application_name)
  environment      = lower(var.environment)
  region_code      = lower(var.region_code)

  resource_group_name = "rg-${local.application_name}-${local.environment}-${local.region_code}-001"

  spoke_vnet_name = "vnet-${local.application_name}-${local.environment}-${local.region_code}-001"

  subnets = {
    web = {
      name             = "snet-web-${local.application_name}-${local.environment}-${local.region_code}-001"
      address_prefixes = var.web_subnet_address_prefixes
    }

    data = {
      name             = "snet-data-${local.application_name}-${local.environment}-${local.region_code}-001"
      address_prefixes = var.data_subnet_address_prefixes
    }

    private_endpoints = {
      name             = "snet-private-endpoints-${local.application_name}-${local.environment}-${local.region_code}-001"
      address_prefixes = var.private_endpoint_subnet_address_prefixes
    }
  }

  network_security_groups = {
    web = {
      name = "nsg-web-${local.application_name}-${local.environment}-${local.region_code}-001"

      rules = {
        "Allow-RDP-From-Bastion" = {
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "3389"
          source_address_prefix      = "10.0.1.0/26"
          destination_address_prefix = var.web_subnet_address_prefixes[0]
          description                = "Allow RDP access from the Azure Bastion subnet."
        }

        "Allow-HTTP-From-Hub" = {
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "80"
          source_address_prefix      = "10.0.0.0/16"
          destination_address_prefix = var.web_subnet_address_prefixes[0]
          description                = "Allow internal HTTP access from the hub network."
        }

        "Allow-HTTPS-From-Hub" = {
          priority                   = 120
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "443"
          source_address_prefix      = "10.0.0.0/16"
          destination_address_prefix = var.web_subnet_address_prefixes[0]
          description                = "Allow internal HTTPS access from the hub network."
        }
      }
    }

    data = {
      name  = "nsg-data-${local.application_name}-${local.environment}-${local.region_code}-001"
      rules = {}
    }

    private_endpoints = {
      name  = "nsg-private-endpoints-${local.application_name}-${local.environment}-${local.region_code}-001"
      rules = {}
    }
  }

  common_tags = {
    Organisation = var.organisation
    Owner        = var.owner
    Project      = var.project
    Environment  = local.environment
    Application  = upper(local.application_name)
    ManagedBy    = "Terraform"
    CostCentre   = var.cost_centre
    BusinessUnit = var.business_unit
  }
}