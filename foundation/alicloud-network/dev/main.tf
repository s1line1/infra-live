module "vpc" {
  source = "git::https://github.com/s1line1/infra-modules.git//alicloud/network/vpc?ref=v1.0.0"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}

module "vswitch" {
  source = "git::https://github.com/s1line1/infra-modules.git//alicloud/network/vswitch?ref=v1.0.0"

  vpc_name     = var.vpc_name
  vpc_id       = module.vpc.vpc_id
  vswitch_cidr = var.vswitch_cidr
  vswitch_zone = var.vswitch_zone
}

module "security_group" {
  source = "git::https://github.com/s1line1/infra-modules.git//alicloud/security/security-group?ref=v1.0.0"

  security_group_name = var.security_group_name
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = var.ingress_rules
}