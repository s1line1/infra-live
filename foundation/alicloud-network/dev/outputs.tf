output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_name" {
  value = module.vpc.vpc_name
}

output "vswitch_id" {
  value = module.vswitch.vswitch_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}