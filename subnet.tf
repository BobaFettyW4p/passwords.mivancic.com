resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"
  cidr_block              = aws_vpc_ipam_pool_cidr.cidr_pool.cidr

  tags = {
    name = "public subnet"
  }
}