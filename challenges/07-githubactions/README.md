# Challenge 07 - GitHub Actions

The time has come, you have the code, but we need to also think about how to automate and execute it. For that, you will use [GitHub Actions][github-actions] that allow you to create and perform any job such as Continuous Integration / Continuous Deployment ([CI/CD][ci-cd]) workflows that would be part of a completely customized and automated procedure.

## Exercise

In the previous steps, you have created several elements like the custom virtual machine image with the Azure Image Builder service, or a customized ARM template to deploy the infrastructure that your solution needs.

In this challenge, we ask you to build an automated [CI/CD][ci-cd] workflow that creates the image, compiles the bicep language to a template, and then deploys this template to your Azure subscription.

### Success criteria

* You have created a new workflow that can be run automatically
* Inside the workflow, you have at least two differentiated blocks, one for CI and another one for CD
* You keep your sensitive data secure using **environments and secrets**
* The ARM Template is generated using *bicep* inside the workflow
* The Azure Image Builder Service is used to generate the image for each workflow run
* A manual review is needed to run the CD steps, to ensure that someone checks the build results before allowing the deployment in Azure.

## How to

> Note: If you haven't already done it, register for a [GitHub Account](https://github.com/join)

A [CI/CD workflow][ci-cd] in GitHub Actions is defined in a YAML file inside a special directory with the name ```.github/workflows```, and has a structure similar to this one:

```YAML
name: my-first-workflow
on: [push]
jobs:
    build:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v2
        - uses: actions/setup-node@v1
        - run: npm install
        - ...
    deploy:
      runs-on: ubuntu-latest
      needs: build
      steps:
        - name: Azure login
          uses: Azure/login@v1.1
          with:
            creds: ${{secrets.AZ_CREDENTIALS}}
        - ...
```

Every *job* represents a phase of the workflow, and can be run in parallel, or sequentially if you define a dependency (*needs*). Inside a *job*, you find the steps that will perform the tasks you need. There are a lot of already defined [Actions][github-actions] that allow you to run complex tasks inside your job in only one simple parametrizable step.

### Tips

Learn how to create your own workflow in the [Quickstart for GitHub Actions][actions-quickstart].

The GitHub workflows can run under an environment where you can store secrets and enhance the protection level using features like the [Required reviewers][github-environment-protection].

To connect to your Azure Account from GitHub Actions you will also need to provide the credentials for a Service Principal like indicated in the [Deploy ARM with GitHub Actions][azure-github] guide.

## Resources

- [GitHub Actions][github-actions]
- [GitHub Actions Quickstart][actions-quickstart]
- [Deploy ARM with GitHub Actions][azure-github]
- [ARM deployment troubleshooting](https://docs.microsoft.com/azure/azure-resource-manager/templates/common-deployment-errors)
- [Image Builder Action][image-builder-action]
- [Build custom VM with Actions][build-vm-images]
- [GitHub Environments Protection][github-environment-protection]

## What's next?

Once this section is completed, go back to [the agenda](../../README.md).

[actions-quickstart]: https://docs.github.com/actions/quickstart "Quickstart for GitHub Actions"
[azure-github]: https://docs.microsoft.com/azure/azure-resource-manager/templates/deploy-github-actions/ "Deploy ARM templates by using GitHub Actions"
[ci-cd]:https://docs.github.com/actions/guides/about-continuous-integration "About continuous integration"
[github-actions]:https://docs.github.com/actions/learn-github-actions/introduction-to-github-actions "Introduction to GitHub Actions"
[github-environment-protection]: https://docs.github.com/actions/reference/environments#required-reviewers
[build-vm-images]: https://docs.microsoft.com/azure/developer/github/build-vm-image "Build custom virtual machine images with GitHub Actions and Azure"
[image-builder-action]: https://github.com/marketplace/actions/build-azure-virtual-machine-image "GitHub Action to Build Custom Virtual Machine Images"
