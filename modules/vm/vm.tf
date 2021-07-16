resource "azurerm_linux_virtual_machine" "vm1east" {
  count = "${length(var.vm_names)}"
  name                = "${element(var.vm_names, count.index)}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.vm_location}"
  size                = "Standard_B1s"
  disable_password_authentication      =  false
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = ["${element(var.ntif_id, count.index)}"]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}


resource "azurerm_linux_virtual_machine" "vm1app" {
  count = "${length(var.vmapp_names)}"
  name                = "${element(var.vmapp_names, count.index)}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.vm_location}"
  zone  = "${element(var.avzone, count.index)}"
  size                = "Standard_B1s"
  disable_password_authentication      =  false
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = ["${element(var.privatentif_id, count.index)}"]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}