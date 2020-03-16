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
