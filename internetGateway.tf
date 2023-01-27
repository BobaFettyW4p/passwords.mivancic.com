resource "aws_internet_gateway" "internetGateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name = "Internet Gateway for Virtual Private Cloud"
  }
}