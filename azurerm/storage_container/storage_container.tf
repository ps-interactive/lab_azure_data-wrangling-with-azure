resource "azurerm_storage_container" "tfer--failed" {
  container_access_type = "private"
  name                  = "failed"
  storage_account_name  = data.terraform_remote_state.storage_account.outputs.azurerm_storage_account_tfer--axelstorage002_name
}

resource "azurerm_storage_container" "tfer--source" {
  container_access_type = "private"
  name                  = "source"
  storage_account_name  = data.terraform_remote_state.storage_account.outputs.azurerm_storage_account_tfer--axelstorage002_name
}
