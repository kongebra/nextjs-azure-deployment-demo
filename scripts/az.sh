#!/bin/sh

# Make sure you are logged into Azure CLI
az login
# Create a resource group
az group create --location westeurope --resource-group next-azure-deployment-rg
# Create a service plan
az appservice plan create --resource-group next-azure-deployment-rg --name nextazuredeployplan --is-linux --sku P1V3
# List out avaiable runtimes for our webapp
az webapp list-runtimes
# Create a web app with Node.js version 18 runtime
az webapp create --resource-group next-azure-deployment-rg --name nextazuredeploywebapp --plan nextazuredeployplan --runtime "NODE:18-lts"
# Retrieve the publish profile for our web app
az webapp deployment list-publishing-profiles --name nextazuredeploywebapp --resource-group next-azure-deployment-rg --xml