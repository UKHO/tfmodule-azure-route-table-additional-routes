# route-table-additional-routes

module "create" {
    source                    = "github.com/UKHO/route-table-additional-routes"
    providers = {
        azurerm.hub   = azurerm.hub
        azurerm.spoke = azurerm.test
    }    
    spokerg                 =  var.spokerg
    hubrg                   =  var.hubrg
    hubrt                   =  var.hubrt
    id                      =  var.id
    routetable              =  var.routetable
    spokeroute              =  var.spokeroute
    hubroute                =  var.hubroute
    hop                     =  var.hop
    subnets                 =  var.SUBNETS
    hubprefix               =  var.hubprefix
    spokeprefix             =  var.spokeprefix
}
