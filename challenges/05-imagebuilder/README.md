# Challenge 05 - Creating an Azure Virtual Machine image using Azure Image Builder

As we have now built multiple Azure VMs and we have seen how you can use ARM templates to automate the deployment of your infrastructure, we will start thinking about another layer of you IaaS that you could also automate. So far, we have only worked with marketplace standard Azure images such as Ubuntu, CentOS, Windows, etc. But what if you need a custom image to include some standard settings from your company, bastion the OS or to include additional software on it.

There are multiple approaches on how you could do this, for example one way would be to use configuration management tools such as PowerShell DSC, Puppet or Chef to name a few. However there is another method that would mean you creating a custom base image that you require and having an immutable architecture approach, we will explore this methodology by using [Azure Image Builder][image-builder].

## Exercise 

In this challenge you have to create a custom VM image that will serve HTML through the HTPP port, store it as a Managed Image and use it in your ARM template.

In order to focus on how to create the image, we provide you with a script that installs docker inside an [Ubuntu 18.04 Virtual Machine][ubuntu-18] and runs a simple Nginx server using this docker compose configuration:

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
You can find these files inside the [*vmcontent* folder](./vmcontent), that you will provide to the Image Builder instance.

### Success Criteria

- You have created a VM Image that serves a custom HTML page through port 80
- You used Image Builder to create it and publish into your Image Catalog
- You have modified your ARM template to use this image as a base one for your deployment
- The deployed VMs show the HTML when connecting through their Public IP

---

## How to

### Azure Image Builder

[Azure Image Builder][image-builder] is an Azure service that would allow you to create predefined images with the required settings and software that meet your corporate standards, all of this being done in an automated approach that guarantees consistency.

When building images with Azure Image Builder you will start with a Linux or Windows base image on top of which you will add your customizations as-code. The solution is based on [HashiCorp Packer](https://www.packer.io/) but being a managed service in Azure.

This service allows you to provide some contents and scripts to automate the Virtual Machine configuration and will perform all the necessary steps to generate, generalize and publish your virtual machine image.

Follow [this example][image-builder-tutorial] and [customize the json template][image-builder-customizer] to provide the script and support files your deployment needs (the html and yaml files).

Once you have an image ready you can publish it in the [Azure Shared Image Gallery][shared-image-gallery] or use it as a [managed image in VHD][capture-image] that you can later use as part of your automation.

After you have the image ready, modify the ARM template from the previous challenge to use this custom image.

## Resources

- [Image Builder][image-builder]
- [Image Builder Template Reference][image-builder-customizer]
- [HashiCorp Packer](https://www.packer.io/)
- [Custom image capture][capture-image]


## What's next?

Once this section is completed, go back to [the agenda](../../README.md).

[image-builder]: https://docs.microsoft.com/azure/virtual-machines/image-builder-overview "Image Builder Overview"
[image-builder-tutorial]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/image-builder "Create a Linux image and distribute it to a Shared Image Gallery by using Azure CLI"
[ubuntu-18]: https://azuremarketplace.microsoft.com/marketplace/apps/canonical.0001-com-ubuntu-server-bionic?tab=Overview "Ubuntu Server 18.04 LTS by Canonical"
[shared-image-gallery]: https://docs.microsoft.com/azure/virtual-machines/shared-image-galleries "Shared Image Galleries overview"
[capture-image]: https://docs.microsoft.com/azure/virtual-machines/linux/capture-image
[image-builder-customizer]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/image-builder-json#properties-customize