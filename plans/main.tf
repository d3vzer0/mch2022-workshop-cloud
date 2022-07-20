module "vpc" {
  source            = "../modules/vpc"
  cosmic_vpc_name   = "MCH2022"
  cosmic_vpc_range  = "10.0.0.0/16"
  cosmic_vpc_domain = "mch2022"
}

# Gen 1 Pokemon deployments
module "charmander" {
  source               = "../modules/tenant"
  cosmic_vpc_id        = module.vpc.cosmic_vpc_id
  cosmic_keypair       = var.cosmic_keypair
  cosmic_acl_list      = var.default_acl_list
  cosmic_network_name  = "MCH2022-CHAR"
  cosmic_network_range = "10.0.1.0/24"
  deployment_name      = "mch2022"
  cosmic_instance_name = "charmander"
}


module "inventory" {
  source                = "../modules/inventory"
  deployment_name       = "mch2022"
  inventory_output_path = var.inventory_output_path
  host_groups = [
    {
      name = "charmander", hosts = [
        module.charmander.node_external_ip
      ]
    }
  ]
}
# module "bulbasaur" {
#   source               = "../modules/tenant"
#   cosmic_vpc_id        = module.vpc.cosmic_vpc_id
#   cosmic_keypair       = var.cosmic_keypair
#   cosmic_acl_list      = var.default_acl_list
#   cosmic_network_name  = "MCH2022-BULB"
#   cosmic_network_range = "10.0.2.0/24"
#   deployment_name      = "mch2022"
#   cosmic_instance_name = "bulbasaur"
# }

# module "squirtle" {
#   source               = "../modules/tenant"
#   cosmic_vpc_id        = module.vpc.cosmic_vpc_id
#   cosmic_keypair       = var.cosmic_keypair
#   cosmic_acl_list      = var.default_acl_list
#   cosmic_network_name  = "MCH2022-SQTL"
#   cosmic_network_range = "10.0.3.0/24"
#   deployment_name      = "mch2022"
#   cosmic_instance_name = "charizard"
# }

# Gen 2 pokemon deployments
# module "cyndaquil" {
#   source               = "../modules/tenant"
#   cosmic_vpc_id        = module.vpc.cosmic_vpc_id
#   cosmic_keypair       = var.cosmic_keypair
#   cosmic_acl_list      = var.default_acl_list
#   cosmic_network_name  = "MCH2022-CNDQ"
#   cosmic_network_range = "10.0.4.0/24"
#   deployment_name      = "mch2022"
#   cosmic_instance_name = "cyndaquil"
# }

# module "chikorita" {
#   source               = "../modules/tenant"
#   cosmic_vpc_id        = module.vpc.cosmic_vpc_id
#   cosmic_keypair       = var.cosmic_keypair
#   cosmic_acl_list      = var.default_acl_list
#   cosmic_network_name  = "MCH2022-CHKA"
#   cosmic_network_range = "10.0.5.0/24"
#   deployment_name      = "mch2022"
#   cosmic_instance_name = "chikorita"
# }


# module "totodile" {
#   source               = "../modules/tenant"
#   cosmic_vpc_id        = module.vpc.cosmic_vpc_id
#   cosmic_keypair       = var.cosmic_keypair
#   cosmic_acl_list      = var.default_acl_list
#   cosmic_network_name  = "MCH2022-TOTO"
#   cosmic_network_range = "10.0.6.0/24"
#   deployment_name      = "mch2022"
#   cosmic_instance_name = "totodile"
# }
