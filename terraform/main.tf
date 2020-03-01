provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "spinnaker" {
  name    = "spinnaker"
  region  = "lon1"
  version = "1.16.6-do.0"

  node_pool {
    name       = "spinnaker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}

resource "local_file" "kubeconfig" {
  content  = digitalocean_kubernetes_cluster.spinnaker.kube_config.0.raw_config
  filename = "../kubeconfig.yml"
}
