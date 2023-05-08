resource "aws_eip" "eip" {
  vpc      = true
  depends_on = [aws_internet_gateway.thkee_igw]
  tags = {
    Name = "NAT Gateway EIP"
  }
}