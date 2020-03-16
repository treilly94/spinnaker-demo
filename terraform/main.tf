provider "azurerm" {
  version = "1.44.0"
}

provider "digitalocean" {
  token = var.do_token
}
