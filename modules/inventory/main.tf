locals {
  ansible_inventory = templatefile("${path.module}/templates/inventory.tmpl", {
    deployment_name = var.deployment_name,
    groups          = jsonencode(var.host_groups)

  })
}

resource "local_file" "foo" {
  content  = local.ansible_inventory
  filename = var.inventory_output_path
}