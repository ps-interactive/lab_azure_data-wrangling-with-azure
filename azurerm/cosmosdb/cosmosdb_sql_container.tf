resource "azurerm_cosmosdb_sql_container" "tfer--movies" {
  account_name = azurerm_cosmosdb_account.tfer--axelcosmosdb002.name
  database_name = azurerm_cosmosdb_sql_database.tfer--sink.name
  name = "movies"
  resource_group_name = data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--rg_name
}
