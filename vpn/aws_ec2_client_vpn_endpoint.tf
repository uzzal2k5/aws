resource "aws_ec2_client_vpn_endpoint" "default" {
  description            = var.vpn_endpoint_name
  server_certificate_arn = aws_acm_certificate.vpn_client_certificate.arn
  client_cidr_block      = var.vpn_cidr
  split_tunnel = var.split_tunnel
  dns_servers = var.dns_servers
  self_service_portal = local.self_service_portal
  security_group_ids     = [var.vpn_security_group_id == "" ? aws_security_group.vpn_access_sg[0].id : var.vpn_security_group_id]
  vpc_id = data.aws_vpc.thkee_vpc.id

  authentication_options {
    type                       = var.authentication_type
    root_certificate_chain_arn = var.authentication_type != "certificate-authentication" ? null : aws_acm_certificate.vpn_client_certificate.arn
    saml_provider_arn          = var.authentication_saml_provider_arn
  }
  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn_log_group.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn_log_stream.name
  }
  tags = merge(
    var.tags,
    tomap({
      "Name"    = var.vpn_endpoint_name,
      "EnvName" = var.vpn_endpoint_name
    })
  )
}