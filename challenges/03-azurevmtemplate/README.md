# Challenge 03 - Creating an Azure Virtual Machine with an ARM template

In this challenge, you will create a Azure Virtual Machine running Linux.

You will gradually add ARM configuration to build all the resources needed to be able to login to the Azure Virtual Machine.

The resources you will use in this challenge:

- Resource Group
- Virtual Network
- Subnet
- Network Interface
- Virtual Machine
- Public IP Address

## How to

### Create the base ARM template configuration

We will start with a few of the basic resources needed.

From the Cloud Shell, change directory into a folder specific to this challenge. If you created the scaffolding in Challenge 01, then you can use the command `cd ~/AzureWorkChallenges/challenge03/`.

Create a `rg_template.json` file. You can include an empty structure:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "",
  "apiProfile": "",
  "parameters": {  },
  "variables": {  },
  "functions": [  ],
  "resources": [  ],
  "outputs": {  }
}
```

### Create Parameters file

Create a `rg_template.parameters.json` file  and define a few parameters that will help keep our code clean and reusable:

- rgName: provide a name for your Resource Group.
- rgLocation: an Azure region to deploy your Resource Group.

### Create a Resource Group

Now modify the ARM template to create a Resource Group to contain all of our infrastructure using the parameters you just defined. A parameter allows you to provide different values to your code and reuse a template for different environments. Make sure you are using the parameters you defined earlier for the resource group name and location.

Now you are ready to deploy the ARM template you just edited and that will create a resource group with the name and location specified in your parameters file. There are different scopes that can be used as part of an ARM template deployment:

- Resource Group
- Subscription
- Management Group
- Tenant

Keep in mind that not all resources can be deployed at the same level or scope, so be mindful of the resources you are creating.

Since we are creating a resource group we will use the subscription scope and deploy with the command:

```shell
az deployment sub create \
  --name rgdeployment \
  --location westeurope \
  --template-file rg_template.json \
  --parameters rg_template.parameters.json
```

Once the command has finished its run, use the Azure Portal to verify that you have a new resource group.

### Create Virtual Networking

Now that you have the resource group you can start adding Azure resources to it, in this case we will deploy an Azure Virtual Machine. In order to create an Azure Virtual Machine we need to create a network in which to place it.

Since we will be deploying new at a Resource Group level and not subscription, it is recommennded to have a different template. Create a `vm_template.json` and `vm_template.parameters.json` file. Use the same structure as before:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "",
  "apiProfile": "",
  "parameters": {  },
  "variables": {  },
  "functions": [  ],
  "resources": [  ],
  "outputs": {  }
}
```

Create a Virtual Network and Subnet using a basic CIDR block to allocate an IP block:

- vnetName: < vmName >-vnet
- vnetAddressPrefix: "10.0.0.0/16"
- subnetName: < vmName >-subnet
- subnetPrefix: "10.0.1.0/24"

Make sure again to use variables to customize this deployment, you can reference a new parameter vmName to create network name and the subnet name using variables as described [here](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-variables?tabs=json). In this case, you will use the value from a parameter (vmName) to construct the variables vnetName and subnetName.

The VM should be deployed in the same location as the resource group from before. Take a look at examples [here](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-parameters?tabs=json).

Re-run the template with the command:

```shell
az deployment group create \
--resource-group <rg_name> \
--name rgdeployment  \
--template-file vm_template.json   \
--parameters vm_template.parameters.json
```

> **Note:** notice the diffence with the previous deployment command, what are the differences and why?

### Create the Azure Virtual Machine

Now that we have base networking in place, we will add a Network Interface and Virtual Machine. We will create a VM with an Azure Marketplace Image for Ubuntu 18.

Modify your ARM template to include:

- A new VM using the parameter vmName from before
- Use SSH keys for authentication
- VMsize could be provided from the user but should default to "Standard_D2s_v3"
- User should be able to provide both the admin username and public key
- Add a NSG to your existing networking with the following rules:
  - All outbound traffic should be allowed
  - For inbound traffic allow only: SSH, and HTTP.
  - Deny any other inbound traffic.
- Attach a public IP address to the VM.
- Resources names should follow the same structure as before: < vmName>-nsg, < vmName>-pip, < vmName>-nic, etc.

Re-run the template with the command:

```shell
az deployment group create \
--resource-group <rg_name> \
--name rgdeployment  \
--template-file vm_template.json   \
--parameters vm_template.parameters.json
```

Using a browser, navigate to the Azure Portal and check out the resources that have been deployed, make sure they are in the right region, everything is configured properly and that it follows the naming convention.

> **Note:** what happened to the already existing resources in the resource group like the vnet? Take a minute to understand ARM deployment modes as described [here](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-modes).

### Outputs

You now have all the infrastructure in place and can now SSH into the Linux VM we just created. But wait, the Public IP was dynamically created, how do I access it?

You could check the value in the Azure Portal, however let's instead add an output to get that information. An output is a configurable piece of information that is returned from the deployed resources.

Modify your ARM template to include the public IP address as an output. Use [this documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-outputs?tabs=json%2Cazure-cli) to guide you.

### Food for Tought

Now that you have created your own ARM template and parameters file from scratch, go back to the ones you exported from the Azure Portal and compare the two:

- Notice any differences?
- Did you use the same parameters?
- Is the exported template from the portal valid?

## Success Criteria

You are done with this challenge when you have successfully:

- Created the following resources in Azure:
  - 1 VM in Azure using an ARM template
  - Had 1 public IP addresses
  - 1 NSG with port 22 and 80 open
  - 1 vnet with 1 subnet
- The naming convention follows the standards mentioned in challenge02

## Resources

- [ARM deployment scopes](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-resource-group?tabs=azure-cli)
- [ARM deployment modes](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-modes)
- [ARM parameters](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-parameters?tabs=json)
- [ARM variables](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-variables?tabs=json)
- [ARM resource declaration](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/resource-declaration?tabs=json)
- [ARM outputs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-outputs?tabs=json%2Cazure-powershell)
- [ARM deployment troubleshooting](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/common-deployment-errors)

## What's next?

Once this section is completed, go back to [the agenda](../../README.md).
