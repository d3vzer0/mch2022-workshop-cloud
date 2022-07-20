resource "cosmic_network_acl" "ingress_stack" {
  name        = "ingress-${var.cosmic_network_name}"
  description = "Allow access to ${var.cosmic_network_name} network"
  vpc_id      = var.cosmic_vpc_id
}

resource "cosmic_network" "stack" {
  vpc_id           = var.cosmic_vpc_id
  name             = var.cosmic_network_name
  cidr             = var.cosmic_network_range
  network_offering = var.cosmic_network_offering
  acl_id           = cosmic_network_acl.ingress_stack.id
}

resource "cosmic_network_acl_rule" "ingress_stack" {
  depends_on = [cosmic_network_acl.ingress_stack]
  count      = length(var.cosmic_acl_list)
  acl_id     = cosmic_network_acl.ingress_stack.id
  rule {
    action       = lookup(var.cosmic_acl_list[count.index], "action")
    cidr_list    = lookup(var.cosmic_acl_list[count.index], "cidr_list")
    protocol     = lookup(var.cosmic_acl_list[count.index], "protocol")
    ports        = lookup(var.cosmic_acl_list[count.index], "ports")
    traffic_type = lookup(var.cosmic_acl_list[count.index], "traffic_type")
  }
}

resource "cosmic_instance" "stack" {
  # count            = var.cosmic_instance_count
  # name             = "${var.deployment_name}-${var.cosmic_instance_name}-${format("%02d", count.index + 1)}"
  name             = "${var.deployment_name}-${var.cosmic_instance_name}-01"
  expunge          = true
  service_offering = var.cosmic_instance_offering
  template         = var.cosmic_instance_template
  keypair          = var.cosmic_keypair
  network_id       = cosmic_network.stack.id
  root_disk_size   = var.cosmic_root_disk_size
}

resource "cosmic_ipaddress" "stack" {
  # count  = var.cosmic_instance_count
  vpc_id = var.cosmic_vpc_id
  acl_id = cosmic_network_acl.ingress_stack.id
}

resource "cosmic_port_forward" "stack" {
  #count         = var.cosmic_instance_count
  #ip_address_id = cosmic_ipaddress.stack[count.index].id
  ip_address_id = cosmic_ipaddress.stack.id
  forward {
    protocol     = "tcp"
    private_port = 22
    public_port  = 22
    # virtual_machine_id = cosmic_instance.stack[0].id
    virtual_machine_id = cosmic_instance.stack.id
  }
}