# Challenge 05 - Creating an Azure Virtual Machine image using Azure Image Builder

As we have now built multiple Azure VMs and we have seen how you can use ARM templates to automate the deployment of your infrastructure, we will start thinking about another layer of you IaaS that you could also automate. So far, we have only worked with marketplace standard Azure images such as Ubuntu, CentOS, Windows, etc. But what if you need a custom image to include some standard settings from your company, bastion the OS or to include additional software on it.

There are multiple approaches on how you could do this, for example one way would be to use configuration management tools such as PowerShell DSC, Puppet or Chef to name a few. However there is another method that would mean you creating a custom base image that you require adn having an immutable architecture approach, we will explore this methodology by using Azure Image Builder.

## How to

### Azure Image Builder

[Azure Image Builder](https://docs.microsoft.com/en-us/azure/virtual-machines/image-builder-overview) is an Azure service that would allow you to create predefined images with the required settings and software that meet your corporate standards, all of this being done in an automated approach and guaranting consistency.

When building images with Azure Image Builder you will start with a Linux or Windows base image on top of which you will add your customizations as-code. The solution is based on [HashiCorp Packer](https://www.packer.io/) but being a managed service in Azure.

Once you have an image ready you can publish it in the Azure Shared Image Gallery or as a managed image in VHD that you can later use as part of your automation.

Using Azure Image builder create an image that:

- Uses Ubuntu as base image
- Has docker and docker compose installed
- Runs an nginx docker compose yaml file asshown below

```yaml
version: "3"

services:
    client:
        image: nginx
        restart: always
        ports:
            - 80:80
        volumes:
            - ./html:/usr/share/nginx/html
```

After you have the image ready, modify the ARM template from the previous challenge to use this custom image.

## Resources

- [Image Builder](https://docs.microsoft.com/en-us/azure/virtual-machines/image-builder-overview)
- [HashiCorp Packer](https://www.packer.io/)


## What's next?

Once this section is completed, go back to [the agenda](../../README.md).
