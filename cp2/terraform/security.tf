# Security Group
# Firewall virtual para controlar el trafico de red, se crean dos reglas, una para la conxion y otra para el ejercicio 2 poder acceder por http a la web del servidor
resource "azurerm_network_security_group" "mySecGroup"{
	name			= var.nsecurtiyg_name
	location		= azurerm_resource_group.cp2.location
	resource_group_name	= azurerm_resource_group.cp2.name
	
	security_rule{
		name				= "SSH"
		priority			= 1001
		direction			= "Inbound"
		access				= "Allow"
		protocol			= "Tcp"
		source_port_range		= "*"
		destination_port_range		= "22"
		source_address_prefix		= "*"
		destination_address_prefix	= "*"
	}
	security_rule{
		name				= "HTTP"
		priority			= 1002
		direction			= "Inbound"
		access				= "Allow"
		protocol			= "Tcp"
		source_port_range		= "*"
		destination_port_range		= "8080"
		source_address_prefix		= "*"
		destination_address_prefix	= "*"
	}
	tags={
	  enviroment = var.cp2_tag_name
  }
}

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1"{
	network_interface_id		= azurerm_network_interface.myNic1.id
	network_security_group_id	= azurerm_network_security_group.mySecGroup.id
}

