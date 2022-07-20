variable "cosmic_keypair" {
  description = "Public key to use for SSH auth"
  type        = string
}

variable "default_acl_list" {
  description = "ACL Schema for ingress network"
  type = list(
    object({
      action       = string,
      protocol     = string,
      cidr_list    = list(string),
      ports        = list(number),
      traffic_type = string
    })
  )
}

variable "inventory_output_path" {
  description = "Output path for Ansible inventory"
  type        = string
}