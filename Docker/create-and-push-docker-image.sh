#!/bin/sh

# build docker image
docker build . -t simple-python-app
echo "succefully build docker image!"

# login to ACR via Azure CLI
az acr login --name anuchunduridevopsacr
echo "succefully logged in to ACR!"

# tag docker image
docker tag simple-python-app anuchunduridevopsacr.azurecr.io/simple-python-app:v1
echo "succefully tagged docker image with ACR!"

#push docker image to ACR
docker push anuchunduridevopsacr.azurecr.io/simple-python-app:v1
echo "succefully pushed docker image to ACR!"
