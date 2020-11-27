variable "spokerg" {
  #default = "Test-RG"
  description = "name of spoke resource group"
}
variable "hubrg" {
  #default = "business-rg"
  description = "name of hub resource group"
}
variable "hubrt" {
  #default = "M-BusinessAD-rt"
  description = "hub route table name" 
}
variable "id" {
  #default = "Test"
  description = "environment you're deploying too"
}
variable "routetable" {
  #default = "Test-rt"
}
variable "spokeroute" {
  default     = ["route1", "route2" , "route3"]
}
variable "hubroute" {
  #default     = ["route4", "route5" , "route6"]
}
variable "hop" {
  #default = ["VirtualNetworkGateway", "VirtualNetworkGateway", "VirtualNetworkGateway"]
}
variable "subnets" {
 description = "array contains names of subnets, the subnet array used on the tfmodule-azure-vnet-with-nsg fits this expected pattern"
}
variable "spokeprefix" {
  #default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
variable "hubprefix" {
  #default     = ["10.240.106.0/24", "10.240.107.0/24" , "10.240.108.0/24"]
  
}












#variable "spokerg" {
#  default = "Test-RG"
#  description = "name of spoke resource group"
#}
#variable "hubrg" {
#  default = "business-rg"
#  description = "name of hub resource group"
#}
#variable "hubrt" {
#  default = "M-BusinessAD-rt"
#  description = "hub route table name" 
#}
#variable "id" {
#  default = "Test"
#  description = "environment you're deploying too"
#}
#variable "routetable" {
#  default = "Test-rt"
#}
#variable "spokeroute" {
#  default     = ["route1", "route2" , "route3"]
#}
#variable "hubroute" {
#  default     = ["route4", "route5" , "route6"]
#}
#variable "hop" {
#  default = ["VirtualNetworkGateway", "VirtualNetworkGateway", "VirtualNetworkGateway"]
#}
##variable "subnets" {
# # description = "array contains names of subnets, the subnet array used on the tfmodule-azure-vnet-with-nsg fits this expected pattern"
##}
#variable "spokeprefix" {
#  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
#}
#variable "hubprefix" {
#  default     = ["10.240.106.0/24", "10.240.107.0/24" , "10.240.108.0/24"]
#  
#}







