variable "region" {
  type = string
  default = "cn-shanghai"
}

variable "vpc_name" {
  type = string
  default = "test-vpc"
}

variable "vpc_cidr" {
  type = string
  default = "10.1.0.0/16"
}

variable "vswitch_cidr" {
  type = string
  default = "10.1.1.0/24"
}

variable "vswitch_zone" {
  type = string
  default = "cn-shanghai-a"
}

variable "security_group_name" {
  type = string
  default = "test-security-group"
}

variable "ingress_rules" {
  type = map(object({
    port_range  = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
  default = {
    ssh = {
      port_range  = "22/22"
      ip_protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    springboot-demo = {
      port_range  = "8083/8083"
      ip_protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
