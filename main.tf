#locals {
#  subscription_id     = "5739fe4c-408e-45ba-941e-301ae4525146"
#  hub_subscription_id = "282900b8-5415-4137-afcc-fd13fe9a64a7"
#}

#provider "azurerm" {
#  features {}
#  version = "=2.20.0"
#}

provider "azurerm" {
  #version = "=2.20.0"
  #features {}
  alias = "spoke"
  #subscription_id = local.subscription_id  
}

provider "azurerm" {
  #version = "=2.20.0"
  #features {}
  alias = "hub"
  #subscription_id = local.hub_subscription_id
}

data "azurerm_resource_group" "main" {
  provider = azurerm.spoke
  name     = var.spokerg
  #location = "uksouth"
}

resource "azurerm_route_table" "main" {
  provider                      = azurerm.spoke
  name                          = var.routetable
  location                      = data.azurerm_resource_group.main.location
  resource_group_name           = data.azurerm_resource_group.main.name
  disable_bgp_route_propagation = false
  
  lifecycle { ignore_changes = [tags] }
}

data "azurerm_subnet" "main" {
  count                = length(var.subnets)
  provider             = azurerm.spoke
  name                 = var.subnets[count.index].name
  resource_group_name  = var.spokerg
  virtual_network_name = local.vnet_name
}

resource "azurerm_subnet_route_table_association" "main" {
  count          = length(var.subnets)
  provider       = azurerm.spoke
  subnet_id      = data.azurerm_subnet.main[count.index].id
  route_table_id = azurerm_route_table.main.id
}

data "azurerm_resource_group" "hub" {
  provider = azurerm.hub
  name     = var.hubrg
}

data "azurerm_route_table" "main" {
  provider            = azurerm.hub
  name                = var.hubrt
  resource_group_name = data.azurerm_resource_group.hub.name
}

resource "azurerm_route" "main" {
  provider            = azurerm.spoke
  name                = var.spokeroute[count.index]
  resource_group_name = data.azurerm_resource_group.main.name
  route_table_name    = data.azurerm_route_table.main.name
  address_prefix      = var.spokeprefix[count.index]
  next_hop_type       = var.hop[count.index]
  count               = length(var.spokeroute)
}

resource "azurerm_route" "main1" {
  provider            = azurerm.hub
  name                = var.hubroute[count.index]
  resource_group_name = data.azurerm_resource_group.hub.name
  route_table_name    = data.azurerm_route_table.main.name
  address_prefix      = var.hubprefix[count.index]
  next_hop_type       = var.hop[count.index]
  count               = length(var.hubroute)
}






























#provider "azurerm" {
#  alias           = "spoke"
#}
#
#provider "azurerm" {
#  alias           = "hub"
#}
#
#locals {
#  vnet_name = "${var.id}-vnet"
#}
#
#data "azurerm_resource_group" "main" {
#  provider = azurerm.spoke
#  name     = var.spokerg
#}
#
#resource "azurerm_route_table" "main" {
#  provider                      = azurerm.spoke
#  name                          = var.routetable
#  location                      = data.azurerm_resource_group.main.location
#  resource_group_name           = data.azurerm_resource_group.main.name
#  disable_bgp_route_propagation = false
#
#  lifecycle { ignore_changes = [tags] }
#}
#
#data "azurerm_subnet" "main" {
#  count                = length(var.subnets)
#  provider             = azurerm.spoke
#  name                 = var.subnets[count.index].name
#  resource_group_name  = var.spokerg
#  virtual_network_name = local.vnet_name
#}
#
#resource "azurerm_subnet_route_table_association" "main" {
#  count          = length(var.subnets)
#  provider       = azurerm.spoke
#  subnet_id      = data.azurerm_subnet.main[count.index].id
#  route_table_id = azurerm_route_table.main.id
#}
#data "azurerm_resource_group" "hub" {
#  provider = azurerm.hub
#  name     = var.hubrg
#}
#
#data "azurerm_route_table" "main" {
#  provider            = azurerm.hub
#  name                = var.hubrt
#  resource_group_name = data.azurerm_resource_group.hub.name
#}
#resource "azurerm_route" "main" {
#  name                = var.spoke_route[count.index]
#  resource_group_name = azurerm_resource_group.main.name
#  route_table_name    = azurerm_routetable.main.name
#  address_prefix      = var.spoke_prefixes[count.index]
#  next_hop_type       = var.route_nexthop_types[count.index]
#  count               = length(var.route_names)
#}

