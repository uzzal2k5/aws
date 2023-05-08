# Creating Route Table
resource "aws_route_table" "igw_route_table" {
  vpc_id = aws_vpc.thkee_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.thkee_igw.id
  }
  tags = {
    Name = "Public Route Table"
  }
}
