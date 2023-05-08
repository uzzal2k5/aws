variable "thkee_vpc" {}
variable "ec2_security_group" {}

# Defining AMI Image for Instances Management
variable "ec2_ami" {
  type = "map"
  default = {
    me-central-1 = "ami-76d6f519"
    me-south-1 = "ami-76d6f520"
  }
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

#Storage Management
variable "root_volume_size" {
  description = "OS Root Volume "
  default = 8
}
variable "data_volume_size" {
  description = "Volume for Application Data "
  default = 20
}

variable "dev_instance_count" {
  description = "Define the number of Development Node will be launch"
  default = 2
}

#Public Key Private Key Management
variable "public_key" {
  default = "aws_project.pub"
}

variable "private_key" {
  default = "aws_project.pem"
}

variable "key_name" {
  default = "aws_project"
  description = "Name of AWS key pair"
}


#AWS Access Management
variable "access_key" {
  description = "Access key to AWS console"
}
variable "secret_key" {
  description = "Secret key to AWS console"
}
