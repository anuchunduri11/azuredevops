#!/bin/sh

# Choose one of the two ways to build a docker image for the application 
# based on your system architecture and target architecture
# build Option 1: docker image built on linux/amd64 compatible system to run on linux/amd64 system
docker build . -t simple-python-app
echo "succefully build docker image!"

#build Option 2: docker image being built on arm64 system to run on linux/amd64 system 
# docker buildx build --platform linux/amd64 . -t simple-python-app

# login to ACR via Azure CLI
az acr login --name anuchunduridevopsacr
echo "succefully logged in to ACR!"

# tag docker image
docker tag simple-python-app anuchunduridevopsacr.azurecr.io/simple-python-app:v1
echo "succefully tagged docker image with ACR!"

#push docker image to ACR
docker push anuchunduridevopsacr.azurecr.io/simple-python-app:v1
echo "succefully pushed docker image to ACR!"
