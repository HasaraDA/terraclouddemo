locals {
  env      = var.env
  location = var.location
  tags = {
    project = "devops-portfolio"
    env     = local.env
    region  = local.location
  }
}

# Resource group
module "rg" {
  source   = "../../../modules/resource-group"
  name     = "rg-portfolio-${local.env}"
  location = local.location
  tags     = local.tags
}
