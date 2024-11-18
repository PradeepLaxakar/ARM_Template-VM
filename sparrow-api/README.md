## Guide to deploy sparrow-api (backend) using ARM template. <br/>

### Prerequisites

[Visual Studio Code (VS Code)](https://code.visualstudio.com/) - The recommended code editor for this project.

[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) - The Azure Command-Line Interface (CLI) for managing Azure resources. <br/>

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


Open any bash supporting terminal - vs code / git bash etc. <br/>


### Create resource group

```
az group create --name sparrow-rg --location <provide-region-name>  
``` 


### Clone the repository
```
git clone https://github.com/sparrowapp-dev/sparrow-arm-template.git
```

cd into repo

```
cd sparrow-arm-template  
```

### Make required changes in ARM-template

You may change VM_Name, VM_Size, Username & Password in parameters.json file. 

### Deploy Virtual Machine

Azure cli (bash)

```
az deployment group create \
  --resource-group sparrow-rg \
  --template-file sparrow-api/template.json \
  --parameters sparrow-api/parameters.json
```  


**Please wait 5 minutes before SSH into the machine to allow the script to finish running.**

ssh into machine

```
ssh <vm-public-ip>
```

cd into /sparrow-api directory

```
cd sparrow-api
```

Check if docker containers running
```
docker ps
```

You should see 3 containers running

```
sparrow-api-app
mongo:7.0
bitnami/kafka:3.4.1 
```

Verify service in browser. In browser hit:
```
<vm-public-ip>:9000/health
```