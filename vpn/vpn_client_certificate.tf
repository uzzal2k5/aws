resource "aws_acm_certificate" "vpn_client_certificate" {
  private_key = file("certs/client-vpn-ca.key")
  certificate_body = file("certs/client-vpn-ca.crt")
  certificate_chain = file("certs/ca-chain.crt")

  tags = local.global_tags
}