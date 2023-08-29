# azuredevops
An end-to-end project dealing with 
1. containerising a sample python application using Docker
2. using Terraform to create an VNET with two subnets - one for Azure Kubernetes Service cluster and one for Azure Application Gateway.
3. using Terraform to deploy ACR (Azure Container Registry to hold the application Docker image) and an AKS (Azure Kubernetes Service) cluster to deploy the containerised application
4. using Terraform to deploy an Azure Application Gateway
5. Enabling Application Gateway Ingress Controller add-on on AKS and to expose the application to the internet using the existing Application Gateway.
6. (TBD) Finally, the entire deployment setup is going to be automated using Azure DevOps.

#TODO
