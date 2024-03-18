#creación del ACR
resource "azurerm_container_registry" "example" {
  name                     = var.acr_name
  resource_group_name      = azurerm_resource_group.cp2.name
  location                 = azurerm_resource_group.cp2.location
  sku                      = "Basic" 
  admin_enabled            = true
}


#creación del AKS
resource "azurerm_kubernetes_cluster" "aks-xabi" {
  name                = var.aks_name
  location            = azurerm_resource_group.cp2.location
  resource_group_name = azurerm_resource_group.cp2.name
  dns_prefix          = "cp2"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.cp2_tag_name
  }
}

#roles para el acceso
resource "azurerm_role_assignment" "acr_public_access" {
  scope                = azurerm_container_registry.example.id
  role_definition_name = var.role_access_acr
  principal_id         = azurerm_kubernetes_cluster.aks-xabi.kubelet_identity[0].object_id
}

#creacion namespace
resource "azurerm_eventhub_namespace" "example" {
  name                = var.namespace_aks_name
  location            = azurerm_resource_group.cp2.location
  resource_group_name = azurerm_resource_group.cp2.name
  sku                 = "Basic"  # Opciones: "Basic", "Standard", "Dedicated"
}


