resource "azurerm_virtual_network" "Vnet1" {
    name = "${var.vnet_name}"
    resource_group_name = "${var.rg_name}"
    location =  "${var.vnet_location}"
    address_space = "${var.vnet_address_space}"
    dns_servers = ["8.8.8.8","8.8.4.4"]
}