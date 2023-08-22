#!/bin/sh

RESOURCE_GROUP_NAME="anu-chunduri"
STORAGE_ACCOUNT_NAME="anuchunduridevopssa"
LOCATION="swedencentral"

# Create Resource Group in Azure
az group create -l $LOCATION -n $RESOURCE_GROUP_NAME

# Create Storage Account in Azure
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l $LOCATION --sku Standard_LRS

# Create Storage Account container to store terraform state file
az storage container create  --name tfstate --account-name $STORAGE_ACCOUNT_NAME
