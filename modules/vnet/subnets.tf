resource "azurerm_subnet" "subnets" {
    count = "${length(var.subnet_names)}"
    name = "${element(var.subnet_names, count.index)}"
    resource_group_name = "${var.rg_name}"
    virtual_network_name = "${azurerm_virtual_network.Vnet1.name}"
    address_prefixes = "${element(var.subnet_prefixes, count.index)}"
}

resource "azurerm_subnet" "public_subnets" {
    name = "${var.pub_subnet_names}"
    resource_group_name = "${var.rg_name}"
    virtual_network_name = "${azurerm_virtual_network.Vnet1.name}"
    address_prefixes = "${var.pub_subnet_prefixes}"
}


resource "azurerm_subnet" "private_subnets" {
    name = "${var.private_subnet_names}"
    resource_group_name = "${var.rg_name}"
    virtual_network_name = "${azurerm_virtual_network.Vnet1.name}"
    address_prefixes = "${var.private_subnet_prefixes}"
}

resource "azurerm_public_ip" "public_ip" {
    count =  "${length(var.public_ip_names)}"
    name                         = "${element(var.public_ip_names, count.index)}"
    location                     = "${var.pip_location}"
    resource_group_name          = "${var.rg_name}"
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}