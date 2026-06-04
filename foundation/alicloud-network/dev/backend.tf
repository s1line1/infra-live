terraform {
  backend "oss" {
    bucket = "s1line1-state"
    key    = "foundation/dev/alicloud-network.tfstate"
    region = "cn-shanghai"
  }
}