output "subnet_ids" {
  value = module.subnet.subnet_ids
}

output "subnet_map" {
  value = { for k, v in module.subnet.subnet_ids : k => {
    id   = v
    name = module.subnet.subnet_names[k]
  } }
}

output "security_group_id" {
  value = module.security_group.security_group_id
}