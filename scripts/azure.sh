#!/bin/bash

# If you dont already have a service principal run
# az ad sp create-for-rbac --name "spinnaker"

echo "What subscription id should be used?"
read SUBSCRIPTION_ID

echo "What is the app id of your Service Principal?"
read APP_ID

echo "What is the tennant id of your Service Principal?"
read TENANT_ID

RESOURCE_GROUP="spinnaker"
VAULT_NAME="tomreillyspinnakervault"
ACCOUNT="spinnakerazure"
SSHPUBKEY=$( cat ~/.ssh/id_rsa.pub )

az keyvault create --enabled-for-template-deployment true --resource-group $RESOURCE_GROUP --name $VAULT_NAME
az keyvault set-policy --secret-permissions get --name $VAULT_NAME --spn $APP_ID
az keyvault secret set --name VMUsername --vault-name $VAULT_NAME --value spinnaker
az keyvault secret set --name VMSshPublicKey --vault-name $VAULT_NAME --value "$SSHPUBKEY"

# Wait for the above services to finish setup
sleep 5s

hal config provider azure enable

hal config provider azure account add $ACCOUNT \
  --client-id $APP_ID \
  --tenant-id $TENANT_ID \
  --subscription-id $SUBSCRIPTION_ID \
  --default-key-vault $VAULT_NAME \
  --default-resource-group $RESOURCE_GROUP \
  --packer-resource-group $RESOURCE_GROUP \
  --app-key
