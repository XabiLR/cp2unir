resource "azurerm_virtual_network" "myNet" {
	name                = var.vnetwork_name
        address_space       = ["10.0.0.0/16"]
	location		= azurerm_resource_group.cp2.location
	resource_group_name	= azurerm_resource_group.cp2.name
	tags={
	  enviroment="CP2"
  }
}
	
resource "azurerm_subnet" "mySubnet"{
	name			= var.subnet_name
	resource_group_name	= azurerm_resource_group.cp2.name
	virtual_network_name	= azurerm_virtual_network.myNet.name
	address_prefixes	= ["10.0.1.0/25"]
}

resource "azurerm_network_interface" "myNic1"{
	name			= var.ninterface_name
	location		= azurerm_resource_group.cp2.location
	resource_group_name	= azurerm_resource_group.cp2.name
	
	ip_configuration{
		name				= "myipconfiguration1"
		subnet_id			= azurerm_subnet.mySubnet.id
		private_ip_address_allocation	= "Static"
		private_ip_address		= "10.0.1.10"
		public_ip_address_id		= azurerm_public_ip.myPublicIp1.id
	}
	tags={
	  enviroment = var.cp2_tag_name
  }
}


resource "azurerm_public_ip" "myPublicIp1"{
	name			= var.publicip_name
	location		= azurerm_resource_group.cp2.location
	resource_group_name	= azurerm_resource_group.cp2.name
	allocation_method	= "Dynamic"
	sku			= "Basic"
	
	tags={
	  enviroment = var.cp2_tag_name
  }
}
