# Spinnaker Demo

## Requirements

* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [halyard](https://www.spinnaker.io/setup/install/halyard/#1-install-halyard)
* A azure storage account

# Quick start

## Kuberneties

1. Run the terraform
2. (Optional) Move the kuberneties config to the kube directory `mv kubeconfig.yml ~/.kube/config`

## Spinnaker Config/Installation

Full instructions can be found [here](https://www.spinnaker.io/setup/install/)

### Cloud provider

The thing spinnaker runs on

Run the script `./scripts/cloudprovider.sh` or follow the [onlie instructions](https://www.spinnaker.io/setup/install/providers/kubernetes-v2/)

### Setup storage

Persistant storage for spinnikers data (in this case on azure)

The script assumes that a storage account already exists in a resource group called `SpinnakerStorage` and that you are already logged into the azcli. It will ask you for the name of the storage account

Run the script `./scripts/storage.sh` or follow the [onlie instructions](https://www.spinnaker.io/setup/install/storage/azs/)

### Select a version

Select a version of spinnaker to use ([docs](https://www.spinnaker.io/setup/install/deploy/#pick-a-version))

1. List versions with `hal version list`
2. Set version with `hal config version edit --version <version>` 

### Deploy spinnaker

Deploy spinnaker with the above config ([docs](https://www.spinnaker.io/setup/install/deploy/#deploy-spinnaker))

`hal deploy apply`

### Connect to the UI

[docs](https://www.spinnaker.io/setup/install/deploy/#connect-to-the-spinnaker-ui)

1. Run `hal deploy connect`
2. Open http://localhost:9000
