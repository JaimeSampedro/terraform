# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West US"
# }
# data "azurerm_resource_group" "kvt_rg" {
#   name = "holterraform19rsg"
# }

resource "azurerm_template_deployment" "example" {
  name                = "acctesttemplate"
  resource_group_name = "holterraform19rsg"

  template_body = <<DEPLOY
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {  
  },
  "variables": {
    "location": "[resourceGroup().location]",
    "storageAccountName": "[concat(uniquestring(resourceGroup().id), 'storage')]",
    "publicIPAddressName": "[concat('myPublicIp', uniquestring(resourceGroup().id))]",
    "publicIPAddressType": "Dynamic",
    "apiVersion": "2015-06-15",
    "dnsLabelPrefix": "terraform-acctest"
  },
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "name": "[variables('storageAccountName')]",
      "apiVersion": "[variables('apiVersion')]",
      "location": "[variables('location')]",
      "properties": {
        "accountType": "Standard_LRS"
      }
    },
    {
      "type": "Microsoft.Network/publicIPAddresses",
      "apiVersion": "[variables('apiVersion')]",
      "name": "[variables('publicIPAddressName')]",
      "location": "[variables('location')]",
      "properties": {
        "publicIPAllocationMethod": "[variables('publicIPAddressType')]",
        "dnsSettings": {
          "domainNameLabel": "[variables('dnsLabelPrefix')]"
        }
      }
    }
  ],
  "outputs": {
    "storageAccountName": {
      "type": "string",
      "value": "[variables('storageAccountName')]"
    }
  }
}
DEPLOY

  # # these key-value pairs are passed into the ARM Template's `parameters` block
  # parameters = {
  #   "storageAccountType" = "Standard_GRS"
  # }

  deployment_mode = "Incremental"
}

output "storageAccountName" {
  value = "${lookup(azurerm_template_deployment.example.outputs, "storageAccountName")}"
}