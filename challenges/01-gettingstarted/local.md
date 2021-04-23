# Installing Challenge Requirements Locally

This section is only needed if you wish to install all the tooling on your local machine.

## How to

### Download the Azure CLI latest version

To make some of the steps easier we will use the Azure CLI and authenticate to Azure.

Download and install the latest Azure CLI:

For **Windows** - [Download Here](https://docs.microsoft.com/cli/azure/install-azure-cli-windows)

For **Mac** - [Download Here](https://docs.microsoft.com/cli/azure/install-azure-cli-macos)

> **Note:** If you are having issues, more information can be found [here](https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest)

Verify the installation by running `az -v`, you should see something like this, version 2.21.0 or higher is needed.

### Login to Azure

Login with the Azure CLI by running `az login`.

```shell
$ az login
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code XXXXXXXX to authenticate.
```

Navigate to [https://microsoft.com/devicelogin](https://microsoft.com/devicelogin) and enter the code given in the CLI, then log in using the account that has access to Azure.

Once complete, verify Azure CLI Access by running `az account show -o table`.

```shell
$ az account show -o table
EnvironmentName    IsDefault    Name                             State    TenantId
-----------------  -----------  -------------------------------  -------  ------------------------------------
AzureCloud         True         Visual Studio Premium with MSDN  Enabled  GUID
```

If you see multiple subscriptions, select the one you are going to use for the challenges by running the following command:

```shell
az account set -s 59b082db-abf2-4a89-9703-xxxxxxxxxxx
```

At this point your Azure CLI is fully functional.

You are now connecting to Azure from the Azure CLI!

As one last step here, login to the [Azure Portal](https://portal.azure.com/), this will be useful to see the resources get created in future challenges.

### Download Terraform

In this workshop we will be using Bicep as part of one of the challenges.

Navigate to the Bicep [set up guide](https://github.com/Azure/bicep/blob/main/docs/installing.md) and follow the instructions for your operating system.

### Download Visual Studio Code

You can use Visual Studio Code to create your ARM and Bicep templates, there are extensions that can help with development. You can also use other editors of your choice.

You can Download the latest version [here](https://code.visualstudio.com/Download)

Optionally you can also install the [ARM](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools) and [Bicep](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep) extensions.

### Clone this repository

Install git by going to [here](https://git-scm.com/downloads) and downloading the latest git version.

Once installed, open up a terminal and change directory into a path that you would like to work out of. Then open the repository in VS Code.

```shell
cd ~/Projects/
git clone https://github.com/lanicolas/IaC_Azure.git
```

Open up VS Code manually and open the folder you cloned the repository to.

### Github Access

If you already have a github account you can skip this step.

Github repositories will be needed to complete some of the later challenges as well as creating the DevOps pipelines.

Sign up for a free github.com account by going to [https://github.com/join](https://github.com/join) and following the instructions.

Once created, login.

## What's next?

Once this section is completed, go back to [the agenda](README.md).
