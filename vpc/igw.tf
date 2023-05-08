resource "aws_internet_gateway" "thkee_igw" {
  vpc_id = aws_vpc.thkee_vpc.id
  tags = {
    Name = "Main Internet Gateway"
  }
}