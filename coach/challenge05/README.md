# Challenge 5 solution

Follow the [Image Builder guide][image-builder-guide], but in the [Download and configure the .json][configure-template] step use this [other template] that has this modifications in the *customize* entry:

```json
"customize": [
    {
        "type": "File",
        "name": "Script",
        "sourceUri": "https://raw.githubusercontent.com/lanicolas/IaC_Azure/main/challenges/05-imagebuilder/vmcontent/install.sh",
        "destination": "/tmp/install.sh"
    },
    {
        "type": "File",
        "name": "dockerFile",
        "sourceUri": "https://raw.githubusercontent.com/lanicolas/IaC_Azure/main/challenges/05-imagebuilder/vmcontent/docker-compose.yaml",                
        "destination": "/tmp/docker-compose.yaml"
    },
    {
        "type": "File",
        "name": "downloadBuildArtifacts",
        "sourceUri": "https://raw.githubusercontent.com/lanicolas/IaC_Azure/main/challenges/05-imagebuilder/vmcontent/html/index.html",
        "destination":"/tmp/index.html"
    },
    {
        "type": "Shell",
        "name": "install",
        "inline": [
            "sudo mkdir /opt/app",
            "sudo cp -r /tmp/* /opt/app",
            "cd /opt/app",
            "sudo mkdir html",
            "sudo mv index.html html",
            "sudo sh install.sh"
        ]
    }
]
```
It indicates how to download the three needed files: the script, the docker compose yaml file and an HTML file, and then contains a script to copy the needed files to a persistent folder and run the installer.

Once the VM is up and running, if you open the port 80 in the NSG you will be able to open a browser and see a web page like this one:

![Welcome page served by the virtual machine][webpage]

[image-builder-guide]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/image-builder "Create a Linux image and distribute it to a Shared Image Gallery by using Azure CLI"
[configure-template]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/image-builder#download-and-configure-the-json "Download and configure the .json"
[custom-template]: coach/challenge05/template.json
[webpage]:../img/challenge06-html.png "The simple HTML served by the virtual machine"