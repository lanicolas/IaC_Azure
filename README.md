# About this Workshop

This is a Workshop for *Infrastructure as Code on Azure*.

Infrastructure as Code allows the management of your infrastructure including networks, virtual machines, platform services, and load balancers. Using tools for deployment and configuration management allows you to describe the desired Azure resources needed for an environment and ensures that consistent infrastructure is created and configured each time it is deployed.

This Workshop is focused on:

- Understanding Infrastructure as Code concepts
- Azure Resource Manager as an Infrastructure as Code provider for Azure
- Understanding other tools in the Azure for automation and infrastructure management.
- Integrating Infrastructure as code as part of a DevOps pipeline.

Attendees will learn basics of Infrastructure as Code and gain skills on deploying and managing Azure resources using tools such as ARM.

Practical examples in this workshop include the creation of some basic Azure Resouces, however many others can be deployed using the same techniques.

## Target audience

This workshop is intended for:

- Sysadmins.
- Infrastructure architects.
- DevOps Engineers.
- SRE.
- Security Architects.

## Attendee pre-requisites

- Basic understanding of command line.
- No previous Azure experience required.

If you have no previous experience on Azure and want to read an overview, access this link:

- [Azure Basis](azurebasis.md)

## Presentation

The Power Point presentations used can be found: [Infrastructure as Code](slides/Infrastructure_as_Code_deck.pptx)

## Challenges

These are the challenges for the workshop, it is important to note that they have to be done in order of appearance, so it is important that you follow the order.

- [Challenge 01 - Getting Started](challenges/01-gettingstarted)
- [Challenge 02 - Creating an Azure Virtual Machine from the Azure Portal](challenges/02-azurevmportal)
- [Challenge 03 - Creating an Azure Virtual Machine using an ARM template](challenges/03-azurevmtemplate)
- [Challenge 04 - Creating multiple Azure Virtual Machines](challenges/04-multipleazurevm)
- [Challenge 05 - Creating an Azure Virtual Machine image using Azure Image Builder](challenges/05-imagebuilder)
- [Challenge 06 - Using Bicep](challenges/06-bicep)
- [Challenge 07 - GitHub Actions](challenges/07-githubactions)

### Challenges requirements

This workshop will require that you have access to an Azure Subscription with at least Contributor rights to create resources and the ability to generate a service principal for the subscription (you need permissions on you Azure AD tenant). If you do not currently have access you can create a trial account by going to [https://azure.microsoft.com/en-us/free](https://azure.microsoft.com/en-us/free) and registering for a 3-month trail.

Signing up for a trial requires:

- A unique Microsoft Live Account that has not registered for a trial for in the past. It is recommended that you do NOT use your corporate email.
- A Credit Card, used to verify identity and will not be charged unless you opt-in after the trial is over

> If you are having issues with this access, please alert the instructor ASAP as this will prevent you from completing the challenges.

## Credits

This workshop has been created by:

- [Juan Manuel Servera](https://github.com/jmservera)- Microsoft
- [Laura Nicolas](https://github.com/lanicola)- Microsoft

Other resources used:

- [Microsoft Repo Cloud Native Application](https://github.com/microsoft/MCW-Cloud-native-applications)
- [Ignite Preday Workshop](https://github.com/Azure/Ignite2019_IaC_pre-day_docs)

## Additional Resources

Additional Resources can be found at:

- [Azure infrastructure as code](https://docs.microsoft.com/en-us/dotnet/architecture/cloud-native/infrastructure-as-code)
- [Azure Quickstart Templates](https://azure.microsoft.com/en-us/resources/templates/)
- [Azure Bicep](https://github.com/Azure/bicep)
- [GitHub Actions](https://docs.github.com/en/actions)
- [GitHub Labs](https://lab.github.com/)
