output resource_group_name {
   value  = "${azurerm_resource_group.revgroup.name}"
}

output virtual_network_name {
   value  = "${azurerm_virtual_network.Vnet1.name}"
}

output subnet_id {
   value  = "${azurerm_subnet.public_subnets.id}"
}

output network_interface_ids {
   value  = "${azurerm_network_interface.netinterface1.*.id}"
}

output network_interface_private_ids {
   value  = "${azurerm_network_interface.netinterface2private.*.id}"
}