variable "vpc_A" {
  description = "Environment specific name of the VPC A"
  default     = "vpc_A"
}

variable "vpc_B" {
  description = "Environment specific name of the VPC B"
  default     = "vpc_B"
}

variable "vpc_cidr_A" {
  description = "Environment specific CIDR for vpc A"
}

variable "vpc_cidr_B" {
  description = "Environment specific CIDR for vpc B"
}

variable "azs_A" {
  type        = list(string)
  description = "Regional list of Availability Zones to deploy to"
}

variable "azs_B" {
  type        = list(string)
  description = "Regional list of Availability Zones to deploy to"
}

variable "public_subnets_A" {
  type        = list(string)
  description = "Environment specific list of public subnets in CIDR"
}

variable "public_subnets_B" {
  type        = list(string)
  description = "Environment specific list of public subnets in CIDR for us-east-1"
}


variable "private_subnets_A" {
  type        = list(string)
  description = "Environment specific list of private subnets in CIDR for VPC A"
}

variable "private_subnets_B" {
  type        = list(string)
  description = "Environment specific list of private subnets in CIDR for VPC B"
}

variable "environment" {
  description = "Environment being deployed"
}

variable "enable_logs_endpoint" {
  description = "Boolean on whether or not to enable the CloudWatch Logs endpoint"
  default     = false
  type        = bool
}

variable "intra_subnets_A" {
  type        = list(string)
  description = "Environment specific list of intra subnets for VPC A"
}

variable "intra_subnets_B" {
  type        = list(string)
  description = "Environment specific list of intra subnets for VPC B"
}