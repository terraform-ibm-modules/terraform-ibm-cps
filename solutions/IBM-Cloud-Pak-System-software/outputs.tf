output "infrastructure_data" {
  description = "PowerVS infrastructure details."
  value       = { for k, v in local.powervs_infrastructure[0] : k => v.value }
}

output "access_host_or_ip" {
  description = "Public IP of Provided Bastion/JumpServer Host."
  value       = local.access_host_or_ip
}

