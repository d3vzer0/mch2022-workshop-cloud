output "node_internal_ip" {
  value       = cosmic_instance.stack.ip_address
  description = "Node data"
}

output "node_external_ip" {
  value       = cosmic_ipaddress.stack.ip_address
  description = "External IP for servers"
}
