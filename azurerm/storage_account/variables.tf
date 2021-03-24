data "terraform_remote_state" "resource_group" {
  backend = "local"

  config = {
    path = "./azurerm/resource_group/terraform.tfstate"
  }
}
