resource "cosmic_vpc" "default" {
  name           = var.cosmic_vpc_name
  display_text   = var.cosmic_vpc_description
  cidr           = var.cosmic_vpc_range
  vpc_offering   = var.cosmic_vpc_offering
  network_domain = var.cosmic_vpc_domain
}
