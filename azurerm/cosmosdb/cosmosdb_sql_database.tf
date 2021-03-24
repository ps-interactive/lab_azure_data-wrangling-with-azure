resource "azurerm_cosmosdb_sql_database" "tfer--sink" {
  account_name = azurerm_cosmosdb_account.tfer--axelcosmosdb002.name
  name = "sink"
  resource_group_name = data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--rg_name
}
