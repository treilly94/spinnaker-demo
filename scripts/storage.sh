#! /bin/bash

# Get storage account name
echo "What is the name of your storage account?"
read STORAGE_ACCOUNT_NAME

RESOURCE_GROUP="SpinnakerStorage"
STORAGE_ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT_NAME --query [0].value | tr -d '"')

# Set storage account details
hal config storage azs edit \
  --storage-account-name $STORAGE_ACCOUNT_NAME \
  --storage-account-key $STORAGE_ACCOUNT_KEY

# Set storage account type to azure
hal config storage edit --type azs
