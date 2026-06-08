terraform {
  backend "s3" {
    bucket = "amzn-s3-s1line1-bucket"
    key    = "foundation/iam/aws/aws-iam.tfstate"
    region = "us-east-1"
  }
}
