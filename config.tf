terraform {
  backend "s3" {
    bucket         = "terraform-backend-mark4poc"
    key            = "config/ec2/ec2-sample-instance.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}