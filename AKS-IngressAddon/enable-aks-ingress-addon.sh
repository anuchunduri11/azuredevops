#!/bin/sh

#get existing application gatewayId and store in variable
appgwId=$(az network application-gateway show -n anuchunduridevopsappgw -g anuchunduridevops-rg -o tsv --query "id") 
		
#enable ingress controller on aks and point it to existing appgw using the application gatewayId 
az aks enable-addons -n anuchunduridevopsaks -g anuchunduridevops-rg -a ingress-appgw --appgw-id $appgwId
