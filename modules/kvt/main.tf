data "azurerm_resource_group" "kvt_rg" {
  name = var.resource_group
}

resource "azurerm_key_vault" "kvt" {
  name = var.name
  location = var.location
  resource_group_name         = data.azurerm_resource_group.kvt_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = "350d072b-d849-4df7-93bf-d5593556851d"

  sku_name = "standard"

  access_policy {
    tenant_id = "350d072b-d849-4df7-93bf-d5593556851d"
    object_id = "fdcf1809-2209-444d-b40d-caefe2dfee46"

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = data.azurerm_resource_group.kvt_rg.tags.environment
    department = data.azurerm_resource_group.kvt_rg.tags.department
  }
}