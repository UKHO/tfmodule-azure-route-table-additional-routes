# Terraform Module: for Azure Private endpoint

## Required Resources

- `Resource Group` exists or is created external to the module.
- `Provider` must be created external to the module.

## Usage

```terraform


## Creating multiple routes under the spoke and hub tables

## Usage Vars

variable "dns_zone" {
    description = "alias to create private dns zone - be aware this is dependant on the endpoint"
    default = "privatelink.azurewebsites.net"
}

variable "vnet_link" {
    description = "alias of the virtual network link"
    default = ""  
}

variable "location" {
    default = "uksouth"
}

variable "network_type" {
  description = "type of connection"
  default = "network"
}

variable "private_connection" {
    description = "endpoint resource id"	 
    default = "/subscriptions/SUBID/resourceGroups/RGNAME/providers/Microsoft.Web/sites/APP_SERVICE_NAME" 
}

variable "zone_group" {
    description = "private dns zone group"
    default = ""   
}

variable "pe_identity" {
    description = "identity that will create all the private endpoint resources required"
    default = ""
}

variable "pe_environment" {
    description = "environment for private endpoint"
    default = "dev | prd | qa"
}

variable "pe_vnet_rg" {
    description = "this is the rg for the spoke vnet"
    default = ""
}

variable "pe_vnet_name" {
    description = "vnet name for the private endpoint"
    default = ""
}

variable "pe_subnet_name" {
    description = "subname that the private endpoint will associate"
    default = ""
}

## Module

module "setup" {
  source                        = "github.com/ukho/tfmodule-azure-private-endpoint?ref=0.1.1"
  providers = {
    azurerm.src = azurerm.alias
  }
  pr                        = "${var.

}


