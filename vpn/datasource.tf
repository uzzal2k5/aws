data "aws_vpc" "thkee_vpc" {
  tags {
    Name = var.thkee_vpc
  }
}

data "aws_subnet" "private_subnets" {
  vpc_id = data.aws_vpc.thkee_vpc.id
  tags {
    Tier = "Private"
  }
}
