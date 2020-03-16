#!/bin/bash

# Enable kube
hal config provider kubernetes enable

# Add account
CONTEXT=$(kubectl config current-context)
ACCOUNT="spinnakerkubernetes"

hal config provider kubernetes account add $ACCOUNT \
    --provider-version v2 \
    --context $CONTEXT

# Enable artifacts
hal config features edit --artifacts true

# Make distributed
hal config deploy edit --type distributed --account-name $ACCOUNT
