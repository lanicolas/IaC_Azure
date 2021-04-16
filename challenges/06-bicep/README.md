# Challenge 06 - Bicep

We now understand the structure and basics of an ARM template as a way to automate the deployment of infrastructure. However authoring ARM templates, specially as they get bigger, is not simple. One way to simplofy this experience and have a cleaner syntax is tu use Azure Bicep.

Azure Bicep is a Domain Specific Language for deploying resource in a declarative approach and that makes it easier for you to author ARM templates, it allows modularity and re-use of the code while having an abstraction over ARM.

Keep in mind that Azure Bicep is in preview, you can read more about it [here](https://github.com/Azure/bicep)

## How to

### Azure Bicep

Since you have now gone through the process of creating your own ARM templates, lets explore how the same template would look like when created through Azure Bicep.

You will create the same resources as you did in Challenge 04 but using Azure Bicep as a way to author the template. If you have not worked with Azure Bicep before, no worries you can follow [this tutorial](https://github.com/Azure/bicep/blob/main/docs/tutorial/01-simple-template.md) or you can leverage ARM template documentation from previous challenges, there you will see sections specific to Bicep.

Once you are done authoring your Bicep file, run:

```bash
bicep build <bicepfile.bicep>
```

This will compile the bicep file to ARM template, compare the exported one with the one you author, see any changes?. Please, note that this step is not required and you could deploy to Azure from the Bicep file, this is just for learning purposes.

## What's next?

Once this section is completed, go back to [the agenda](../../README.md).
