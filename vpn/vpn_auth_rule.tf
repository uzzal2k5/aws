resource "aws_ec2_client_vpn_authorization_rule" "vpn_auth_rule" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn.id
  target_network_cidr = data.aws_vpc.thkee_vpc.cidr_block
  authorize_all_groups = true
}
