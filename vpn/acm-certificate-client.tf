resource "tls_private_key" "vpn_client_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "vpn_client_cert_request" {
  private_key_pem = tls_private_key.vpn_client_private_key.private_key_pem

  subject {
    common_name  = "${var.vpn_endpoint_name}.vpn.client"
    organization = var.organization_name
  }
}

resource "tls_locally_signed_cert" "vpn_client_signed_cert" {
  cert_request_pem   = tls_cert_request.vpn_client_cert_request.cert_request_pem
  ca_private_key_pem = tls_private_key.ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca.cert_pem

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth",
  ]
}

resource "aws_acm_certificate" "vpn_client_certificate" {
  private_key       = tls_private_key.vpn_client_private_key.private_key_pem
  certificate_body  = tls_locally_signed_cert.vpn_client_signed_cert.cert_pem
  certificate_chain = tls_self_signed_cert.ca.cert_pem
}