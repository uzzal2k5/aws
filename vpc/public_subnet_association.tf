# Public Subnets Association with Route Table with Internet Gateway
resource "aws_route_table_association" "public_subnet_association" {
  count = length(var.public_subnets_cidr)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.igw_route_table.id
}