# Challenge 7 solution


## Image Builder

There is a complete example on how to do it in the [Azure Marketplace VM Image Demo][jm-marketplace-demo].

You will need to execute some preparation steps:

* You need a Service Principal for the GitHub Action
* You need to create a Managed Identity for the Image Builder service (you already did that in challenge 05)
* There is a [GitHub Action][image-builder-action] that does all the rest for you (uploading the content, creating all the needed resources and running Image Builder)

For the action you need to provide a set of artifacts that will be compressed and deployed to the preparation VM by the build-vm-image action, so you will have to copy them to a folder named *workflow-artifacts*:

```yaml
- name: Create Workflow Artifacts
  run: |
    cd  ${{ GITHUB.WORKSPACE }}
    mkdir workflow-artifacts/        
    cp -r ${{ GITHUB.WORKSPACE }}/vmcontent/* ${{ GITHUB.WORKSPACE }}/workflow-artifacts/
```

And then you will be able to use them in the script that runs inside the VM because the action will take these files and upload them to the *tmp* folder:

```yaml
- name: Build VM Image
  id: build-vm-image
  uses: azure/build-vm-image@v0
  with:        
    resource-group-name: '${{ github.event.inputs.resourceGroup }}'
    managed-identity: '${{ secrets.IDENTITYFORVM }}'
    location: 'northeurope'
    source-os-type: 'linux'        
    source-image: Canonical:UbuntuServer:18.04-LTS:latest
    customizer-script: |
      mkdir /opt/app/
      cp -r /tmp/workflow-artifacts/* /opt/app/
      cd /opt/app
      sudo sh install.sh
```

## Bicep

The bicep job can be run in parallel with the previous one because there's no dependency. There is a [third-party action created by a ms employee][bicep-action] that you can use so you don't need to install bicep using a script.

```yaml
- name: Bicep Build
  id: bicep-build
  uses: aliencube/bicep-build-actions@v0.3
  with:
    files: template/template.bicep
```

## Example files

* [GitHub Workflow][example-workflow]


[bicep-action]: https://github.com/aliencube/bicep-build-actions
[example-workflow]: github-workflow.yml
[jm-marketplace-demo]: https://github.com/jmservera/azure-markeplace-vm-image-demo/tree/2.0-image-builder "Creating Azure Marketplace Virtual Machine Images"
[image-builder-action]: https://github.com/Azure/build-vm-image "GitHub Action to Build Custom Virtual Machine Images"