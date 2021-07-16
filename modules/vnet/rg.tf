resource "azurerm_resource_group" "revgroup" {
    name = "${var.rg_name}"
    location ="${var.rg_location}"
    
}