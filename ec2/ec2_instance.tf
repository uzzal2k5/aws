resource "aws_instance" "ec2_thkee_dev" {
  ami                    = lookup(var.ec2_ami,var.region)
  instance_type          = var.instance_type
  count = var.dev_instance_count
  vpc_security_group_ids = [data.aws_security_group.thkee_ec2_security_group.id]
  subnet_id              = data.aws_subnet.private_subnets.id
  key_name               = aws_key_pair.aws_access_auth.id
  associate_public_ip_address = "false"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }
  ebs_block_device {
    device_name           = "/dev/xvdb"
    volume_type           = "gp2"
    volume_size           = var.data_volume_size
    delete_on_termination = true
  }

  tags = {
    Name = "thkee-dev-machine-${count.index}"
  }
}


