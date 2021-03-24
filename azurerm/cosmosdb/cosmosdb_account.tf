resource "azurerm_cosmosdb_account" "tfer--axelcosmosdb002" {
  analytical_storage_enabled = "false"

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = "5"
    max_staleness_prefix    = "100"
  }

  enable_automatic_failover       = "false"
  enable_free_tier                = "true"
  enable_multiple_write_locations = "false"

  geo_location {
    failover_priority = "0"
    location          = "eastus"
    zone_redundant    = "false"
  }

  is_virtual_network_filter_enabled = "false"
  kind                              = "GlobalDocumentDB"
  location                          = "eastus"
  name                              = "axelcosmosdb002"
  offer_type                        = "Standard"
  public_network_access_enabled     = "true"
  resource_group_name               = data.terraform_remote_state.resource_group.outputs.azurerm_resource_group_tfer--rg_name

  tags = {
    CosmosAccountType = "Non-Production"
    defaultExperience = "Core (SQL)"
  }
}
