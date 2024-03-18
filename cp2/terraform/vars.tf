variable "location"{
	type=string
	description = "Region donde desplegar la maquina: az account list-locations -o table"
	default = "northeurope"
}

variable "vm_size"{
	type=string
	description="maquinas en la region elegida: az vm list-sizes --location northeurope --output table"
	default="Standard_B2ms"
}

# LOS NOMBRES DE LOS RECURSOS EN AZURE

# RESOURCE GROUP
variable "grecurso_name"{
	type=string
	description="nombre del grupo de recursos de Azure, contenedor para agrupar todos los recursos que se vayan creando"
	default="gruporecurso-xabi-03"
}

#STORAGE ACCOUNT
variable "saccount_name"{
	type=string
	description="Almacenamiento de azure - azurerm_storage_account -> name"
	default="staccountcp2xabi2"
}

#NETWORK SECURITY GROUP
variable "nsecurtiyg_name"{
	type=string
	description="Actua de firewall virtual para controlar trafico de red entrante y saliente y redes - azurerm_network_security_group -> name"
	default="sshtraffic"
}

#VIRTUAL NETWORK
variable "vnetwork_name"{
	type=string
	description="Crear red virtual - azurerm_virtual_network-> name"
	default="virtualnet-xg"
}

#SUBNET
variable "subnet_name"{
	type=string
	description="Crear subnet - azurerm_subnet-> name"
	default="subnet-xg"
}

#NETWORK INTERFACE
variable "ninterface_name"{
	type=string
	description="Crear network interface- azurerm_network_interface-> name"
	default="vmni-xg"
}

#PUBLIC IP
variable "publicip_name"{
	type=string
	description="Crear public ip - azurerm_public_ip -> name"
	default="vmip-xg"
}


#VIRTUAL MACHINE
variable "vm_name"{
	type=string
	description="Crear maquina virtual - azurerm_linux_virtual_machine -> name"
	default="virtual-machine-xg"
}

# ACR
variable "acr_name"{
	type=string
	description="Registry ACR - azurerm_container_registry -> name"
	default="acrxabi"
}

#KUBERNETES CLUSTER
variable "aks_name"{
	type=string
	description="Crear cluster de kubernetes - azurerm_kubernetes_cluster -> name"
	default="aks-xg"
}

#ROLES
variable "role_access_acr"{
	type=string
	description="Asignar role - azurerm_role_assignment -> name https://learn.microsoft.com/es-es/azure/container-registry/container-registry-roles?tabs=azure-cli"
	default="owner"
}

#NAMESPACE
variable "namespace_aks_name"{
	type=string
	description="Crear namespace para kubernetes - azurerm_kubernetes_cluster -> name"
	default="namespace-xabi"
}



#IMAGEN para VM azurerm_linux_virtual_machine -->source_image_reference
#publisher
variable "vm_publisher"{
	type=string
	description="editor de la imagen"
	default="Canonical"
}
variable "vm_offer"{
	type=string
	description="el sistema in"
	default="0001-com-ubuntu-server-jammy"
}
variable "vm_sku"{
	type=string
	description="SKU del so"
	default="22_04-lts"
}
variable "vm_version"{
	type=string
	description="Version del SO"
	default="latest"
}

#TAG
variable "cp2_tag_name"{
	type=string
	description="agrupacion"
	default="CP2"
}

































