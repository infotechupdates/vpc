
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id = module.vpc_B.vpc_id
  vpc_id      = module.vpc_A.vpc_id
  peer_region = "us-east-1"
  auto_accept = false
  tags        = local.tags
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.us-east-1
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
  tags                      = local.tags
}

resource "aws_route" "peer-route-A" {
  route_table_id            = module.vpc_A.private_route_table_ids[0]
  destination_cidr_block    = var.vpc_cidr_B
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "peer-route-B" {
  provider                  = aws.us-east-1
  route_table_id            = module.vpc_B.private_route_table_ids[0]
  destination_cidr_block    = var.vpc_cidr_A
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id
}
