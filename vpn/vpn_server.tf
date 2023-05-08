resource "aws_acm_certificate_validation" "vpn_server" {
  certificate_arn = aws_acm_certificate.vpn_client_certificate.arn

  timeouts {
    create = "1m"
  }
}