### VPC-A outputs ###
output "azs_A" {
  value = module.vpc_A.azs
}

output "egress_only_internet_gateway_id_A" {
  value = module.vpc_A.egress_only_internet_gateway_id
}

output "igw_id_A" {
  value = module.vpc_A.igw_id
}

output "name_A" {
  value = module.vpc_A.name
}

output "nat_ids_A" {
  value = module.vpc_A.nat_ids
}

output "nat_public_ips_A" {
  value = module.vpc_A.nat_public_ips
}

output "natgw_ids_A" {
  value = module.vpc_A.natgw_ids
}

output "private_route_table_ids_A" {
  value = module.vpc_A.private_route_table_ids
}

# VPC
output "vpc_id_A" {
  description = "The ID of the VPC"
  value       = module.vpc_A.vpc_id
}

# Subnets
output "private_subnets_A" {
  description = "List of IDs of private subnets"
  value       = module.vpc_A.private_subnets
}

output "private_subnets_cidr_blocks_A" {
  description = "List of the CIDRs of the private subnets"
  value       = var.private_subnets_A
}

output "public_subnets_A" {
  description = "List of IDs of public subnets"
  value       = module.vpc_A.public_subnets
}

output "public_subnets_cidr_blocks_A" {
  description = "List of the CIDRs of the public subnets"
  value       = var.public_subnets_A
}

output "vpc_cidr_A" {
  description = "VPC Cidr"
  value       = var.vpc_cidr_A
}

### VPC-B outputs ###
output "azs_B" {
  value = module.vpc_B.azs
}

output "egress_only_internet_gateway_id_B" {
  value = module.vpc_B.egress_only_internet_gateway_id
}

output "igw_id_B" {
  value = module.vpc_B.igw_id
}

output "name_B" {
  value = module.vpc_B.name
}

output "nat_ids_B" {
  value = module.vpc_B.nat_ids
}

output "nat_public_ips_B" {
  value = module.vpc_B.nat_public_ips
}

output "natgw_ids_B" {
  value = module.vpc_B.natgw_ids
}

output "private_route_table_ids_B" {
  value = module.vpc_B.private_route_table_ids
}

# VPC
output "vpc_id_B" {
  description = "The ID of the VPC"
  value       = module.vpc_B.vpc_id
}

# Subnets
output "private_subnets_B" {
  description = "List of IDs of private subnets"
  value       = module.vpc_B.private_subnets
}

output "private_subnets_cidr_blocks_B" {
  description = "List of the CIDRs of the private subnets"
  value       = var.private_subnets_B
}

output "public_subnets_B" {
  description = "List of IDs of public subnets"
  value       = module.vpc_B.public_subnets
}

output "public_subnets_cidr_blocks_B" {
  description = "List of the CIDRs of the public subnets"
  value       = var.public_subnets_B
}

output "vpc_cidr_B" {
  description = "VPC Cidr"
  value       = var.vpc_cidr_B
}

