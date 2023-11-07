data "aws_availability_zones" "available" {}

locals {
  environment = var.environment
  name        = "ex-${basename(path.cwd)}"
  tags = {
    Terraform   = true
    environment = var.environment
  }
}

data "aws_security_group" "sg_A" {
  name   = "default"
  vpc_id = module.vpc_A.vpc_id
}

data "aws_security_group" "sg_B" {
  name     = "default"
  vpc_id   = module.vpc_B.vpc_id
  provider = aws.us-east-1
}
