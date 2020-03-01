# Spinnaker Demo

## Requirements

* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [halyard](https://www.spinnaker.io/setup/install/halyard/#1-install-halyard)
* A azure storage account

# Quick start

## Kuberneties

1. Run the terraform
2. (Optional) Move the kuberneties config to the kube directory `mv kubeconfig.yml ~/.kube/config`

## Spinnaker

Full instructions can be found [here](https://www.spinnaker.io/setup/install/)

### Cloud provider

The thing spinnaker runs on

Run the script `./scripts/cloudprovider.sh` or follow the [onlie instructions](https://www.spinnaker.io/setup/install/providers/kubernetes-v2/)

### Setup storage

Persistant storage for spinnikers data (in this case on azure)

The script assumes that a storage account already exists in a resource group called `SpinnakerStorage` and that you are already logged into the azcli. It will ask you for the name of the storage account

Run the script `./scripts/storage.sh` or follow the [onlie instructions](https://www.spinnaker.io/setup/install/storage/azs/)
