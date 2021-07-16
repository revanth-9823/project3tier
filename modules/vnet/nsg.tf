resource "azurerm_network_security_group" "nsg1" {
    name                = "${var.nsg_name}"
    location            = "${var.nsg_location}"
    resource_group_name ="${var.rg_name}"
    security_rule {
        name                       = "Allow_All"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    
}
    
}

resource "azurerm_network_security_group" "nsg2" {
    name                = "${var.nsg2_name}"
    location            = "${var.nsg2_location}"
    resource_group_name ="${var.rg_name}"
    security_rule {
        name                       = "Allow_All"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    
}
    
}