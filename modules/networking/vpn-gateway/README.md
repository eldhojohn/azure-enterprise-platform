# Azure VPN Gateway Module

Creates:

- Azure VPN Gateway
- Standard static public IP
- Route-based VPN configuration
- Gateway IP configuration using an existing `GatewaySubnet`

The initial implementation supports active-standby deployment.

Recommended SKU for new deployments: `VpnGw1AZ` or higher.