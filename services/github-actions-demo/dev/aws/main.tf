data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "amzn-s3-s1line1-bucket"
    key    = "foundation/network/dev/aws-network.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical（Ubuntu 官方）

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "ec2_instance" {
  source = "git::https://github.com/s1line1/infra-modules.git//aws/compute/ec2?ref=v1.1.4"

  ami_id        = data.aws_ami.ubuntu.id
  instance_type  = "t3.micro"
  subnet_id      = data.terraform_remote_state.network.outputs.subnet_ids["subnet1"]
  instance_name  = "test-ec2-instance"
  instance_count = 1

  key_name = "appkey"

  user_data = file("${path.module}/user_data.yaml")

  vpc_security_group_ids  = [data.terraform_remote_state.network.outputs.security_group_id]

  root_block_device = {
    volume_size = 20
    volume_type = "gp3"
    throughput  = 125
  }
}