provider "azurerm" {
  version = "1.44.0"
}

resource "azurerm_resource_group" "spinnaker" {
  name     = "spinnaker"
  location = "westus"
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

resource "azurerm_virtual_network" "spinnaker" {
  name                = "spinnaker"
  location            = azurerm_resource_group.spinnaker.location
  resource_group_name = azurerm_resource_group.spinnaker.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
}

