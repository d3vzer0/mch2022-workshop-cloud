variable "deployment_name" {
  description = "Stack name"
  type        = string
}

variable "cosmic_vpc_id" {
  description = "Cosmic VPC ID"
  type        = string
}

variable "cosmic_instance_name" {
  description = "Instance name prefix"
  type        = string
}

variable "cosmic_instance_offering" {
  description = "Type of cosmic instance"
  type        = string
  default     = "MCC_v2.4vCPU.8GB.SBP1"
}

variable "cosmic_network_name" {
  description = "Cosmic network name"
  type        = string
}

variable "cosmic_network_range" {
  description = "Cosmic range for tenant's private network"
  type        = string
}

variable "cosmic_network_offering" {
  description = "Offering for cosmic Private Network"
  type        = string
  default     = "MCC-VPC-LB"
}

variable "cosmic_acl_list" {
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

variable "cosmic_root_disk_size" {
  type        = number
  description = "Primary disk size"
  default     = 100
}


variable "cosmic_instance_template" {
  description = "Default image/OS template to use"
  default     = "Rocky-8-x86_64-Hardened-KVM-latest"
  type        = string
}

variable "cosmic_keypair" {
  description = "Public key to use for SSH auth"
  type        = string
}


variable "cosmic_instance_count" {
  description = "Count of instances to deploy"
  type        = number
  default     = 1
}