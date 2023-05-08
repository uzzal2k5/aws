resource "aws_ec2_client_vpn_endpoint" "client_vpn" {
  description = "Client VPN Endpoint"
  client_cidr_block = "10.20.0.0/22"
  split_tunnel = true
  server_certificate_arn = aws_acm_certificate_validation.vpn_server.certificate_arn

  authentication_options {
    type = "certificate-authentication"
    root_certificate_chain_arn = aws_acm_certificate.vpn_client_certificate.arn
  }

  connection_log_options {
    enabled = false
  }

  tags = local.global_tags
}