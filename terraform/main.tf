provider "azurerm" {
  version = "1.44.0"
}

resource "azurerm_resource_group" "spinnaker" {
  name     = "spinnaker"
  location = "UK South"
}

resource "azurerm_storage_account" "spinnaker" {
  name                     = "tomreillyspinnaker"
  resource_group_name      = azurerm_resource_group.spinnaker.name
  location                 = azurerm_resource_group.spinnaker.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_kubernetes_cluster" "spinnaker" {
  name                = "spinnakerkube"
  location            = azurerm_resource_group.spinnaker.location
  resource_group_name = azurerm_resource_group.spinnaker.name
  dns_prefix          = "spinnakerkube"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.sp_client_id
    client_secret = var.sp_client_secret
  }
}

resource "local_file" "kubeconfig" {
  content  = azurerm_kubernetes_cluster.spinnaker.kube_config_raw
  filename = "../kubeconfig.yml"
}
