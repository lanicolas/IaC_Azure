# Challenge 02 - Creating an Azure Virtual Machine from the Azure Portal

In this challenge, you will create an Azure Virtual Machine from the Azure Portal. I know, this does not look like an IaC procedure, however there is a reason behind this challenge, stay with me.

With using the Azure Portal, the idea is to see beforehand the process you are about to automate and what it is involved behind the scenes in the creation of a resource

The resources you will use in this challenge:

- Resource Group
- Virtual Network
- Subnet
- Network Interface
- Virtual Machine
- Public IP Address

## How to

Navigate to the [Azure Portal](https://portal.azure.com/), create a Linux Azure VM, you can follow [this quickstart](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal)

First you will need to create a new resource group to hold your resources you can name it `challenge02` and select an Azure region that is close to you.

Create a Virtual Network and Subnet using a basic CIDR block to allocate an IP block, you can follow [this quickstart](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal) to guide you.

- vnetName: < vmName>-vnet
- Use IPv4
- vnetAddressPrefix: "192.168.0.0/16"
- subnetName: < vmName>-subnet
- subnetPrefix: "192.168.1.0/24"
- There is no need to enable endpoints or any other additional security features at this point

With the networking settings ready you can now deploy a VM with the following settings, make sure to select the vNet you just created:

- Use an Ubuntu 18 image version
- 1 availability zone
- Use SSH keys for authentication
- Enable access to port 22 and 80
- Assign a public IP called: < vmName >-ip
- VM size: Standard_D2s_v3
- No management services are necessary for now
- Leave the advance settings as default

For vmName you can choose anything you like, it can be something descriptive as `challenge02`.

I am sure this was not difficult but, how long did it take you? what if you had to do this several times a day? is the process fail-proof? can you do this at scale or in a collaborative environment? do you have a way of documenting what you've just created and probable future changes?

### Export the template

Lets now explore another option, try to export now the ARM template of the resource you just created. You can use [this document](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-portal#export-template-from-a-resource-group) to guide you. Save the template on your local computer, we will use it later on in the workshop.

## Success Criteria

You are done with this challenge when you have successfully:

- Created the following resources in Azure:
  - 1 VM in Azure using the Azure Portal
  - Had 1 public IP addresses
  - 1 NSG with port 22 and 80 open
  - 1 vnet with 1 subnet
- The naming convention follows the standards mentioned.

## Resources

- [Create a Linux Azure VM using the Azure Portal](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal)
- [Create vNet using the Azure Portal](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal)

## What's next?

Once this section is completed, go back to [the agenda](../../README.md).
