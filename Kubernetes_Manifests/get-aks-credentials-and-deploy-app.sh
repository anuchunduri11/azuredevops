#!/bin/sh

# Get AKS cluster credentials and store in local .kubeconfig file
az aks get-credentials --resource-group anuchunduridevops-rg --name anuchunduridevopsaks

# Kubectl command that will deploy the application as a deployment, a service and a Ingress resource that will use Azure Gateway Ingress Controller to expose the application to the internet
kubectl apply -f deployment.yaml
