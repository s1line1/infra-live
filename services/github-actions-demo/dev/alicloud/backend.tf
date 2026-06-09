terraform {
  backend "oss" {
    bucket = "s1line1-state"
    key    = "springboot-demo-A/dev/alicloud.tfstate"
    region = "cn-shanghai"
  }
}