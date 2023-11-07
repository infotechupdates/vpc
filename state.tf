terraform {
  backend "s3" {
    bucket         = "terraform-iontra-vpc" ## Need to create this s3 bucket before running this terraform backend script
    dynamodb_table = "terraform-state-lock-dynamo" ## Need to create this table before running this terraform backend script
    key            = "prod-vpc"
    region         = "ap-south-1"
  }
}
