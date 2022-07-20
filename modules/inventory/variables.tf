variable "host_groups" {
  description = "Host groups to generate ansible inventory"
  type = list(
    object({
      name  = string,
      hosts = list(string)
    })
  )
}

variable "inventory_output_path" {
  description = "Path to save inventory file"
  type        = string
}

variable "deployment_name" {
  description = "Deployment name"
  type        = string
}