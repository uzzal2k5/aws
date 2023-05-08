# Create a VPC
resource "aws_vpc" "thkee_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "Thkee VPC"
    Location = "Middle East (UAE)"
  }
}
