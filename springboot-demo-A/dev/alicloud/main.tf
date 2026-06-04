data "terraform_remote_state" "network" {
  backend = "oss"

  config = {
    bucket = "s1line1-state"
    key    = "foundation/dev/alicloud-network.tfstate"
    region = "cn-shanghai"
  }
}

data "alicloud_images" "ubuntu" {
  name_regex  = "^ubuntu_24_04_x64_20G_alibase"
  most_recent = true
  owners      = "system"
}


module "springboot-demo-a_ecs" {
  source = "git::https://github.com/s1line1/infra-modules.git//alicloud/compute/ecs?ref=v1.0.0"

  ecs_count    = 3
  project_name = "springboot-demo-a"

  vswitch_id        = data.terraform_remote_state.network.outputs.vswitch_id
  security_group_id = data.terraform_remote_state.network.outputs.security_group_id
  image_id          = data.alicloud_images.ubuntu.images[0].id
  instance_type     = var.instance_type

  system_disk_category = var.system_disk_category
  system_disk_size     = var.system_disk_size

  instance_charge_type       = var.instance_charge_type
  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out

  user_scripts = <<-EOF
                    #!/bin/bash
                    apt-get update -y
                    apt-get install -y docker.io docker-compose-v2
                    systemctl enable docker --now
                EOF
}
