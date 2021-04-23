# Challenge 06 - Bicep

We now understand the structure and basics of an ARM template as a way to automate the deployment of infrastructure. However authoring ARM templates, specially as they get bigger, is not simple. One way to simplify this experience and have a cleaner syntax is tu use Azure Bicep.

Azure Bicep is a Domain Specific Language for deploying resource in a declarative approach and that makes it easier for you to author ARM templates, it allows modularity and re-use of the code while having an abstraction over ARM.

Keep in mind that Azure Bicep is in preview, you can read more about it [here](https://github.com/Azure/bicep)

## How to

### Azure Bicep

Since you have now gone through the process of creating your own ARM templates, lets explore how the same template would look like when created through Azure Bicep.

You will create the same resources as you did in Challenge 04 but using Azure Bicep as a way to author the template. If you have not worked with Azure Bicep before, no worries you can follow [this tutorial](https://github.com/Azure/bicep/blob/main/docs/tutorial/01-simple-template.md) or you can leverage ARM template documentation from previous challenges, there you will see sections specific to Bicep.

Once you are done authoring your Bicep file, deploy resources by:

```bash
az deployment group create   --name <deployment name>   --resource-group challenge06  --template-file <bicepfile.bicep>
```

After the deployment have finished its run verify in the Azure Portal that all resources have been created properly.

### Food for Thought

You have used now Azure Bicep as a way to deploy resources to Azure, however, let's explore other features:

Bicep can convert a bicep file into the equivalent ARM template file, meaning that you can use the Bicep file as an input and get the corresponding ARM template. To do so, run:

```bash
bicep build <bicepfile.bicep>
```

- Compare the resulting ARM template with the ones you have created before. Notice any differences?
- What approach do you like best?

How about the other way around? What if you could use an ARM template and convert it to a bicep file, try it by running: 

```bash
bicep decompile arm_template.json
```

- Compare the resulting bicep file with the one you have created before. Notice any differences?
- Does it sound interesting to be able to go back and forth between the two approaches?

## Success Criteria

You are done with this challenge when you have successfully:

- Created the following resources in Azure:
  - 2 VMs in Azure using a bicep file
  - Had 2 public IP addresses
  - 1 NSG with port 22 and 80 open
  - 1 vnet with 1 subnet
- The naming convention follows the standards mentioned in challenge02
- You have converted your bicep file into ARM templates
- You have converted the ARM templates from challenge04 into a bicep file.

## Resources

- [Azure Bicep Tutorial](https://github.com/Azure/bicep/blob/main/docs/tutorial/01-simple-template.md)
- [Azure Bicep](https://github.com/Azure/bicep/blob/main/docs/tutorial/01-simple-template.md)
- [Azure Bicep deploy](https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-tutorial-create-first-bicep?tabs=azure-powershell#deploy-bicep-file)
- [Azure Bicep parameters](https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-tutorial-add-parameters?tabs=azure-powershell)
- [Azure Bicep functions](https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-tutorial-add-functions?tabs=azure-powershell)
- [Azure Bicep Variables](https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-tutorial-add-variables?tabs=azure-powershell)
- [Azure Bicep outputs](https://docs.microsoft.com/azure/azure-resource-manager/templates/bicep-tutorial-add-outputs?tabs=azure-powershell)
- [ARM deployment troubleshooting](https://docs.microsoft.com/azure/azure-resource-manager/templates/common-deployment-errors)

## What's next?

Once this section is completed, go back to [the agenda](../../README.md).
