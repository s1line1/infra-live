module "vpc" {
  source = "git::https://github.com/s1line1/infra-modules.git//aws/network/vpc?ref=v1.1.1"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source = "git::https://github.com/s1line1/infra-modules.git//aws/network/subnet?ref=v1.1.1"

  vpc_id                  = module.vpc.vpc_id
  subnet_cidr             = "172.41.1.0/24"
  subnet_name             = "test-subnet"
  map_public_ip_on_launch = true
}

module "security_group" {
  source = "git::https://github.com/s1line1/infra-modules.git//aws/security/security-group?ref=v1.1.1"

  vpc_id              = module.vpc.vpc_id
  security_group_name = "test-security-group"

  security_group_rules = {
    ssh = {
      name        = "ssh"
      type        = "ingress"
      from_port   = "22"
      to_port     = "22"
      ip_protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    app = {
      name        = "app"
      type        = "ingress"
      from_port   = "8080"
      to_port     = "8080"
      ip_protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress = {
      name        = "egress_rules"
      type        = "egress"
      from_port   = "0"
      to_port     = "0"
      ip_protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

module "igw" {
  source = "git::https://github.com/s1line1/infra-modules.git//aws/network/igw?ref=v1.1.1"
  
  vpc_id   = module.vpc.vpc_id
  vpc_name = module.vpc.vpc_name
}

module "route_table" {
  source = "git::https://github.com/s1line1/infra-modules.git//aws/network/route_table?ref=v1.1.1"

  vpc_id   = module.vpc.vpc_id
  igw_id   = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
  vpc_name = module.vpc.vpc_name
}
