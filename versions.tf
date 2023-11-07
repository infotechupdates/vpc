terraform {
  required_version = "= 1.6.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.24.0"
    }
  }
}

provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
}

provider "aws" {
  region  = "ap-south-1"
}