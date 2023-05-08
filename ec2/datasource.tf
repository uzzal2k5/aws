data "aws_security_group" "thkee_ec2_security_group" {
  tags {
    Name = var.ec2_security_group
  }
}
data "aws_vpc" "main_vpc" {
  tags {
    Name = var.thkee_vpc
  }
}

data "aws_subnet" "private_subnets" {
  vpc_id = data.aws_vpc.main_vpc.id
  tags {
    Tier = "Private"
  }
}
