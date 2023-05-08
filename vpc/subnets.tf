resource "aws_subnet" "private_subnets" {
  count = length(data.aws_availability_zones.azs.names)
  availability_zone = element(var.private_subnets_cidr,count.index)
  vpc_id     = aws_vpc.thkee_vpc.id
  cidr_block = element(var.private_subnets_cidr,count.index)
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Subnet-${count.index+1}"
  }
}


resource "aws_subnet" "public_subnets" {
  count = length(data.aws_availability_zones.azs.names)
  availability_zone = element(var.private_subnets_cidr,count.index)
  vpc_id     = aws_vpc.thkee_vpc.id
  cidr_block = element(var.private_subnets_cidr,count.index)
  map_public_ip_on_launch = "false"
  tags = {
    Name = "Subnet-${count.index+1}"
  }
}