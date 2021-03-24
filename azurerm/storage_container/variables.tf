data "terraform_remote_state" "storage_account" {
  backend = "local"

  config = {
    path = "./azurerm/storage_account/terraform.tfstate"
  }
}
