terraform {
  backend "s3" {
    bucket = "amzn-s3-s1line1-bucket"
    key    = "foundation/network/dev/aws-network.tfstate"
    region = "us-east-1"
  }
}