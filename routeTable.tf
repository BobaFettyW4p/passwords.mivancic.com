resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGateway.id
  }

  tags = {
    name = "public routing table"
  }
}

resource "aws_route_table_association" "public_routing_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.publicRouteTable.id
}