#!/bin/bash

echo "What public ssh key should be used?"
read SSHPUBKEY

echo "What subscription id should be used?"
read SUBSCRIPTION_ID

echo "What is the app id of your Service Principal?"
read APP_ID

echo "What is the tennant id of your Service Principal?"
read TENANT_ID

RESOURCE_GROUP="spinnaker"
VAULT_NAME=tomreillyspinnakervault
ACCOUNT="spinnakerazure"

az keyvault create --enabled-for-template-deployment true --resource-group $RESOURCE_GROUP --name $VAULT_NAME
az keyvault set-policy --secret-permissions get --name $VAULT_NAME --spn $APP_ID
az keyvault secret set --name VMUsername --vault-name $VAULT_NAME --value spinnaker
az keyvault secret set --name VMSshPublicKey --vault-name $VAULT_NAME --value $SSHPUBKEY

hal config provider azure enable

hal config provider azure account add $ACCOUNT \
  --client-id $APP_ID \
  --tenant-id $TENANT_ID \
  --subscription-id $SUBSCRIPTION_ID \
  --default-key-vault $VAULT_NAME \
  --default-resource-group $RESOURCE_GROUP \
  --packer-resource-group $RESOURCE_GROUP \
  --app-key