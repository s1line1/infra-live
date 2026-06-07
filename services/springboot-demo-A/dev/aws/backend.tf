terraform {
  backend "s3" {
    bucket = "amzn-s3-s1line1-bucket"
    key    = "springboot-demo-A/dev/aws.tfstate"
    region = "us-east-1"
  }
}