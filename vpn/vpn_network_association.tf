resource "aws_ec2_client_vpn_network_association" "vpn_subnets" {
  #count = length(aws_subnet.private_subnets)
  count = length(data.aws_subnet.private_subnets)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn.id
  subnet_id = data.aws_subnet.private_subnets[count.index].id
  security_groups = [aws_security_group.vpn_access_sg.id]

  lifecycle {
    ignore_changes = [subnet_id]
  }
}