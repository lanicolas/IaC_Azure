# Challenge 02 - Creating an Azure Virtual Machine from the Azure Portal

In this challenge, you will create an Azure Virtual Machine from the Azure Portal. I know, this does not look like an IaC procedure, however there is a reason behind this challenge, stay with me.

With using the Azure Portal, the  idea is to see beforehand the process you are about to automate and what it is involved behind the scenes in the creation of a resource

The resources you will use in this challenge:

- Resource Group
- Virtual Network
- Subnet
- Network Interface
- Virtual Machine
- Public IP Address

## How to

Navigate to the [Azure Portal](https://portal.azure.com/), create a Linux Azure VM, you can follow [this quickstart](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal)

Create a Virtual Network and Subnet using a basic CIDR block to allocate an IP block:

- vnetName: < vmName>-vnet
- vnetAddressPrefix: "192.168.1.0/16"
- subnetName: < vmName>-subnet
- subnetPrefix: "192.168.1.0/24"
- Use an Ubuntu 18 image version
- VM size: Standard_D2s_v3

I am sure this was not difficult but, how long did it take you? what if you had to do this several times a day? is the process fail-proof? can you do this at scale or in a collaborative environment? do you have a way of documenting what you've just created and probable future changes?

### Export the template

Lets now explore another option, try to export now the ARM template of the resource you just created. You can use [this document](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-portal#export-template-from-a-resource-group) to guide you. Save the template on your local computer, we will use it later on in the workshop.

## What's next?

Once this section is completed, go back to [the agenda](../../README.md).
