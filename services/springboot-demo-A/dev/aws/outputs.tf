output "instance_info" {
  value = {
    instance_id = module.ec2_instance.instance_id
    public_ip   = module.ec2_instance.instance_public_ip
  }
}

output "instance_ip" {
  value = module.ec2_instance.instance_public_ip
}