terraform {
  backend "oss" {
    bucket = "s1line1-state"
    key    = "foundation/network/dev/alicloud-network.tfstate"
    region = "cn-shanghai"
  }
}