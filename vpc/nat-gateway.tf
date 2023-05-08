resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnets.id
  tags = {
    Name = "nat-gateway"
  }
}