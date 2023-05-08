resource "aws_route_table" "nat_gw_route_table" {
  vpc_id = aws_vpc.thkee_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
  }
  tags = {
    Name = "Nat Gateway Route Table"
  }
}