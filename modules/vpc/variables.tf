# Terraform Cosmic VPC vars
variable "cosmic_vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "cosmic_vpc_description" {
  description = "VPC Description"
  default     = "VPC for MCH2022 workshop"
  type        = string
}

variable "cosmic_vpc_range" {
  description = "VPC Range"
  type        = string
}

variable "cosmic_vpc_offering" {
  description = "VPC Offering"
  default     = "MCC-VPC-Red"
  type        = string
}

variable "cosmic_vpc_domain" {
  description = "VPC Domain"
  type        = string
}
