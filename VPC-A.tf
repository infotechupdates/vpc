################################################################################
# VPC Module A
################################################################################

module "vpc_A" {
  source               = "./modules/vpc/"
  name                 = var.vpc_A
  cidr                 = var.vpc_cidr_A
  azs                  = var.azs_A
  private_subnets      = var.private_subnets_A
  public_subnets       = var.public_subnets_A
  intra_subnets        = var.intra_subnets_A
  private_subnet_names = ["Private-subnet-1", "Private-subnet-2"]
  intra_subnet_names   = []

  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true
  

  #Enable IPV6
  enable_ipv6 = true

  enable_vpn_gateway               = true
  enable_dhcp_options              = true
  dhcp_options_domain_name         = "service.consul"
  dhcp_options_domain_name_servers = ["127.0.0.1", "10.111.0.2"]

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  tags = local.tags
}

################################################################################
# VPC Endpoints Module
################################################################################

module "vpc_endpoints_A" {
  source = "./modules/vpc-endpoints"

  vpc_id = module.vpc_A.vpc_id

  create_security_group      = true
  security_group_name_prefix = "${local.name}-vpc-endpoints-A"
  security_group_description = "VPC endpoint security group"
  security_group_rules = {
    ingress_https = {
      description = "HTTPS from VPC"
      cidr_blocks = [module.vpc_A.vpc_cidr_block]
    }
  }

  endpoints = {
    s3 = {
      service = "s3"
      tags    = { Name = "s3-vpc-endpoint" }
    },
    dynamodb = {
      service         = "dynamodb"
      service_type    = "Gateway"
      route_table_ids = flatten([module.vpc_A.intra_route_table_ids, module.vpc_A.private_route_table_ids, module.vpc_A.public_route_table_ids])
      policy          = data.aws_iam_policy_document.dynamodb_endpoint_policy_A.json
      tags            = { Name = "dynamodb-vpc-endpoint" }
    }
  }

  tags = merge(local.tags, {
    Project  = "Secret"
    Endpoint = "true"
  })
}

module "vpc_endpoints_nocreate_A" {
  source = "./modules/vpc-endpoints"
  create = false
}

################################################################################
# Supporting Resources
################################################################################

data "aws_iam_policy_document" "dynamodb_endpoint_policy_A" {
  statement {
    effect    = "Deny"
    actions   = ["dynamodb:*"]
    resources = ["*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "StringNotEquals"
      variable = "aws:sourceVpc"

      values = [module.vpc_A.vpc_id]
    }
  }
}

data "aws_iam_policy_document" "generic_endpoint_policy_A" {
  statement {
    effect    = "Deny"
    actions   = ["*"]
    resources = ["*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "StringNotEquals"
      variable = "aws:SourceVpc"

      values = [module.vpc_A.vpc_id]
    }
  }
}
