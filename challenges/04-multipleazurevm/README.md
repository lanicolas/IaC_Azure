# Challenge 04 - Creating multiple Azure Virtual Machines

Now that you have a template for a single Azure VM lets add a little more complexity to it. In this challenge, you will modify your ARM template to create multiple VMs with the same settings.

## How to

### Copying resources

From the Cloud Shell, change directory into a folder specific to this challenge. If you created the scaffolding in Challenge 01, then you can use the command `cd ~/AzureWorkChallenges/challenge04/`.

Just to be safe create a copy of your ARM template and parameters file to work on them.

Now modify the ARM template to create multiple VMs, first you should include a new parameter called `vmCount` that will allow you to customize the automation to the number of VMs you actually want to deploy. For this challenge set the vmCount to 2.

There are multiple ways to add additional VMs to your template, you could certainly copy and paste your resource section as many times as VMs you need to deploy, however that is not efficient and it will make your template not easy to reuse or manage, so you should use the [copy loop](https://docs.microsoft.com/azure/azure-resource-manager/templates/copy-resources?tabs=json) to create multiple instances of an specific resource section in your template. Although the goal is to create multiple Azure VMs keep in mind that they are not standalone resources and that they need additional elements such as: disks, network interfaces, IP addresses, etc for them to work. Therefore you may need to add additional resources within the copy loop.

Another thing that you need to keep in mind is the naming of your resources if you hardcoded or used "static" names you will get an error as resource's names need to be unique within a scope. To avoid this issue use variables and leverage the function [copyIndex](https://docs.microsoft.com/azure/azure-resource-manager/templates/template-functions-numeric?tabs=json#copyindex)

After you are done editing your template deploy it with:

```shell
az deployment group create \
--resource-group multiple-vm \
--name rgdeployment  \
--template-file multiple_vm_template.json   \
--parameters multiple_vm_template.parameters.json
```

> **Note:** you should use a new resource group or delete the resources from the previous challenge to avoid conflicts.

Once the command has finished its run, use the Azure Portal to verify that you have an additional VM in your resource group.

### Outputs

Modify your ARM template to include the public IP addresses as an output, make sure to include both VMs. Use [this documentation](https://docs.microsoft.com/azure/azure-resource-manager/templates/template-outputs?tabs=json%2Cazure-cli) to guide you.

### Food for Tought

Think about how easy or difficult would it have been to edit the ARM template you got from the portal to add multiple copies of your Azure VM. What template would you rather use?

## Success Criteria

You are done with this challenge when you have successfully:

- Created the following resources in Azure:
  - 2 VMs in Azure using an ARM template
  - The resources were created using capabilities of ARM and not copy pasting multiple instances.
  - Had 2 public IP addresses
  - 1 NSG with port 22 and 80 open
  - 1 vnet with 1 subnet
- The naming convention follows the standards mentioned in challenge02

## Resources

- [ARM copy](https://docs.microsoft.com/azure/azure-resource-manager/templates/copy-resources?tabs=json)
- [ARM copyIndex](https://docs.microsoft.com/azure/azure-resource-manager/templates/template-functions-numeric?tabs=json#copyindex)
- [ARM template outputs](https://docs.microsoft.com/azure/azure-resource-manager/templates/template-outputs?tabs=json%2Cazure-cli)
- [ARM deployment troubleshooting](https://docs.microsoft.com/azure/azure-resource-manager/templates/common-deployment-errors)

## What's next?

Once this section is completed, go back to [the agenda](../../README.md).
