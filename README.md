# Spinnaker Demo

## Requirements

* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [halyard](https://www.spinnaker.io/setup/install/halyard/#1-install-halyard)
* A [azure service principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

# Quick start

## Kuberneties

1. Run the terraform
2. (Optional) Move the kuberneties config to the kube directory `mv kubeconfig.yml ~/.kube/config`

## Spinnaker Config/Installation

Full instructions can be found [here](https://www.spinnaker.io/setup/install/)

### Cloud provider

The thing spinnaker runs on

Run the script `./scripts/kubernetes.sh` or follow the [onlie instructions](https://www.spinnaker.io/setup/install/providers/kubernetes-v2/)

#### Addidtional Cloud providers

We can set up additional cloud providers that can be used by spinnaker after instillation. [Docs](https://www.spinnaker.io/setup/install/providers/)

I have a script to add a azure provider `./scripts/azure.sh`

### Setup storage

Persistant storage for spinnikers data (in this case on azure)

The script uses the storage account created by the terraform and assumes that you are already logged into the azcli. It will ask you for the name of the storage account

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
