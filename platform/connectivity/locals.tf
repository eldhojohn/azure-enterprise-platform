locals {
  common_tags = {
    Organisation = var.organisation
    Owner        = var.owner
    Project      = var.project
    Environment  = var.environment
    ManagedBy    = "Terraform"
    CostCentre   = var.cost_centre
    BusinessUnit = var.business_unit
  }

  hub_subnets = {
    gateway = {
      name             = "GatewaySubnet"
      address_prefixes = ["10.0.0.0/24"]
    }

    bastion = {
      name             = "AzureBastionSubnet"
      address_prefixes = ["10.0.1.0/26"]
    }

    firewall = {
      name             = "AzureFirewallSubnet"
      address_prefixes = ["10.0.2.0/26"]
    }

    management = {
      name             = "snet-management-${var.environment}-${var.region_code}-001"
      address_prefixes = ["10.0.3.0/24"]
    }

    shared_services = {
      name             = "snet-shared-${var.environment}-${var.region_code}-001"
      address_prefixes = ["10.0.4.0/24"]
    }
  }

  hub_network_security_groups = {
    management = {
      name = "nsg-management-${var.environment}-${var.region_code}-001"

      rules = {
        "Allow-RDP-From-Bastion" = {
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "3389"
          source_address_prefix      = "10.0.1.0/26"
          destination_address_prefix = "10.0.3.0/24"
          description                = "Allow RDP from the Azure Bastion subnet"
        }
      }
    }

    shared_services = {
      name  = "nsg-shared-${var.environment}-${var.region_code}-001"
      rules = {}
    }
  }

  hub_nsg_associations = {
    management = {
      subnet_key = "management"
      nsg_key    = "management"
    }

    shared_services = {
      subnet_key = "shared_services"
      nsg_key    = "shared_services"
    }
  }

  hub_route_tables = {
    management = {
      name                          = "rt-management-${var.environment}-${var.region_code}-001"
      disable_bgp_route_propagation = false
      routes                        = {}
    }

    shared_services = {
      name                          = "rt-shared-${var.environment}-${var.region_code}-001"
      disable_bgp_route_propagation = false
      routes                        = {}
    }
  }

  hub_route_table_associations = {
    management = {
      subnet_key      = "management"
      route_table_key = "management"
    }

    shared_services = {
      subnet_key      = "shared_services"
      route_table_key = "shared_services"
    }
  }

  hub_bastion = {
    name           = "bas-hub-${var.environment}-${var.region_code}-001"
    public_ip_name = "pip-bas-hub-${var.environment}-${var.region_code}-001"
    sku            = "Standard"
  }

  hub_vpn_gateway = {
    name           = "vpng-hub-${var.environment}-${var.region_code}-001"
    public_ip_name = "pip-vpng-hub-${var.environment}-${var.region_code}-001"
    sku            = "VpnGw1AZ"
    generation     = "Generation2"
    active_active  = false
    enable_bgp     = false
  }


  private_dns_zones = {
    key_vault = {
      name = "privatelink.vaultcore.azure.net"

      virtual_network_links = {
        hub = {
          name                 = "link-hub-prod-aue-001"
          virtual_network_key  = "hub"
          registration_enabled = false
        }
      }
    }
  }
}