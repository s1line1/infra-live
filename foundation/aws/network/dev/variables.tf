variable "region" {
  type = string
  default = "us-west-1"
}

variable "vpc_name" {
  type = string
  default = "dev-vpc"
}

variable "vpc_cidr" {
  type = string
  default = "172.41.0.0/16"
}

variable "subnets" {
  type = map(object({
    cidr = string
    name = string
  }))
}

variable "security_group_rules" {
  description = "Security group rules"
  type = map(object({
    name        = string
    type        = string
    from_port   = string
    to_port     = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
}