resource "azurerm_network_interface" "netinterface1" {
    count = "${length(var.netwrkif_names)}"
    name = "${element(var.netwrkif_names, count.index)}"
    location ="${var.netwrkif_loc}"
    resource_group_name ="${var.rg_name}"

     ip_configuration {
        name                          = "${element(var.ip_config_netwrkif_names, count.index)}"
        subnet_id                     = azurerm_subnet.public_subnets.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${element(azurerm_public_ip.public_ip.*.id, count.index)}"
    }  
}

resource "azurerm_network_interface" "netinterface2private" {
    count = "${length(var.private_netwrkif_names)}"
    name = "${element(var.private_netwrkif_names, count.index)}"
    location ="${var.private_netwrkif_loc}"
    resource_group_name ="${var.rg_name}"

     ip_configuration {
        name                          = "${element(var.ip_config_private_netwrkif_names, count.index)}"
        subnet_id                     = azurerm_subnet.private_subnets.id
        private_ip_address_allocation = "Dynamic"
    }  
}



# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
    count = "${length(var.netwrkif_names)}"
    network_interface_id      = "${element(azurerm_network_interface.netinterface1.*.id, count.index)}"
    network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_network_interface_security_group_association" "example1" {
    count = "${length(var.private_netwrkif_names)}"
    network_interface_id      = "${element(azurerm_network_interface.netinterface2private.*.id, count.index)}"
    network_security_group_id = azurerm_network_security_group.nsg2.id
}