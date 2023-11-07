environment = "production"

#VPC-A Global Variables
vpc_cidr_A        = "10.11.0.0/16"
public_subnets_A  = ["10.11.0.0/21", "10.11.8.0/21", "10.11.16.0/21"]
private_subnets_A = ["10.11.32.0/19", "10.11.64.0/19", "10.11.96.0/19"]
intra_subnets_A   = ["10.11.128.0/24", "10.11.160.0/24", "10.11.192.0/24"]

#VPC-B Global Variables
vpc_cidr_B        = "10.111.0.0/16"
public_subnets_B  = ["10.111.0.0/21", "10.111.8.0/21", "10.111.16.0/21"]
private_subnets_B = ["10.111.32.0/19", "10.111.64.0/19", "10.111.96.0/19"]
intra_subnets_B   = ["10.111.128.0/24", "10.111.160.0/24", "10.111.192.0/24"]

#Availability Zones
azs_A = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
azs_B = ["us-east-1a", "us-east-1b", "us-east-1c"]


