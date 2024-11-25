# iastfakstest

# Terraform AKS Deployment

This repository contains Terraform code to deploy an Azure Kubernetes Service (AKS) cluster with configurable options for using an existing virtual network (VNet) or creating a new one. The deployment also supports scaling based on input variables.

## Prerequisites

- Terraform installed on your local machine.
- An Azure account o Service Principal with sufficient permissions to create resources.
- Azure CLI installed and authenticated. 

## Getting Started

### Clone the Repository

```sh
git clone https://github.com/your-repo/terraform-aks-deployment.git
cd terraform-aks-deployment

Configure Variables
Create a terraform.tfvars file in the root directory and populate it with the necessary values. Here is an example:

resource_group_name = "myResourceGroup"
aks_cluster_name    = "myAKSCluster"
location            = "East US"
enable_scaling      = true
node_count          = 3
deploy_on_existing_vnet = true
existing_vnet_id    = "/subscriptions/your-subscription-id/resourceGroups/your-resource-group/providers/Microsoft.Network/virtualNetworks/your-vnet"
vnet_name           = "myNewVNet"
subnet_name         = "myAKSSubnet"

Initialize Terraform
Initialize the Terraform configuration. This will download the necessary providers and modules.

terraform init

Plan the Deployment
Generate an execution plan to see what resources Terraform will create or modify.

terraform plan

Apply the Deployment
Apply the Terraform configuration to create the resources in Azure.

terraform apply

You will be prompted to confirm the apply action. Type yes to proceed.

Outputs
After the deployment is complete, Terraform will output the following information:

Resource Group Name: The name of the resource group where the resources are deployed.
AKS Cluster Name: The name of the deployed AKS cluster.
Kubeconfig: The kubeconfig file content required to interact with the AKS cluster.
Access the AKS Cluster
To access the AKS cluster, save the kubeconfig output to a file and set the KUBECONFIG environment variable.

terraform output -raw kubeconfig > kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig

Now you can use kubectl to interact with your AKS cluster.

kubectl get nodes

Cleanup
To destroy the resources created by Terraform, run:

terraform destroy

You will be prompted to confirm the destroy action. Type yes to proceed.

Notes
Ensure that the existing_vnet_id is correctly set if you are deploying on an existing VNet.
Adjust the node_count and other variables as needed to fit your requirements.
