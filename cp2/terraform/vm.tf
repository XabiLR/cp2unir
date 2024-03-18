resource "azurerm_linux_virtual_machine" "myVM1" {
  name                      = var.vm_name
  resource_group_name       = azurerm_resource_group.cp2.name
  location                  = azurerm_resource_group.cp2.location
  size                      = var.vm_size
  admin_username            = "adminUsername"
  network_interface_ids     = [azurerm_network_interface.myNic1.id]
  disable_password_authentication = true

# datos de acceso con ssh, se crea manualmente la clave
    admin_ssh_key {
      username    = "adminUsername"
      public_key  = file("~/.ssh/id_rsa.pub")
    }
    

#configuracion cache y almacenamiento
  os_disk {
    caching                = "ReadWrite" #ReadWrite #None #ReadOnly
    storage_account_type   = "Standard_LRS" #Premiun_LRS
  }
  
  
#la imagen que se va a cargar como so
  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }
  
 #shell script que se ejecuta tras instalar
  custom_data = filebase64("script_linux.sh")
  
  tags={
	  enviroment=var.cp2_tag_name
  }
}

