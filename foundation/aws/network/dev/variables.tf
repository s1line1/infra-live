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