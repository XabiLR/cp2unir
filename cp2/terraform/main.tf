#https://github.com/hashicorp/terraform-provider-azurerm

# 1. Provider y su version
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.85.0"
    }
  }
  required_version=">=0.14"
}

provider "azurerm" {
  features {}
}


# 2. Datos de login omitimos con az login y nos logamos desde el navegador

# 3. Grupo de recursos donde almacenaremos los recursos creados
resource "azurerm_resource_group" "cp2" {
  name     = var.grecurso_name
  location = var.location
  
  tags={
  	enviroment = var.cp2_tag_name
  }
}

# 4. Cuenta de almacenamiento, todos los recursos residen aqui
resource "azurerm_storage_account" "stAccount" {
  name                		= var.saccount_name
  resource_group_name 		= azurerm_resource_group.cp2.name
  location            		= azurerm_resource_group.cp2.location
  account_tier	      		= "Standard" #standar(basico, simple) o premium(mejor rendimiento y menos latencia)
  account_replication_type 	="LRS" #LRS (basico), ZRS (replica síncrona region), GRS (replica síncrona centro e datos y asincrona en otra region), RA-GRS (acceso de lectura a la region asincrona)
  
  tags={
	  enviroment = var.cp2_tag_name
  }
}

