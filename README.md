# Guide to deploy resource using ARM template

This guide provides instructions for setting up the resource using ARM template.


## Prerequisites

[Visual Studio Code (VS Code)](https://code.visualstudio.com/) - The recommended code editor for this project.

[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) - The Azure Command-Line Interface (CLI) for managing Azure resources.

Login to azure

```bash
az login
```

**Azure Context Configuration** - Ensure your Azure CLI is set to the correct context for the project:

```bash
az account show
```

```bash
az account set --subscription <Your-Subscription-Name>
```

For more information, refer to the [Azure CLI Documentation](https://learn.microsoft.com/en-us/cli/azure/) and [VS Code Documentation](https://code.visualstudio.com/docs).


clone the repository
```
git clone repo-url
```

cd into repo

```
cd repo-name
```

Open any bash supporting terminal - vs code / git bash etc


### Create resource group

```
az group create --name sparrow-rg --location <provide-region-name>
```


### Deploy Virtual Machine
### Azure cli (bash)

```
az deployment group create \
  --name SparrowVmDeployment \
  --resource-group sparrow-rg \
  --template-file virtual-machine/template.json \
  --parameters virtual-machine/parameters.json
```


