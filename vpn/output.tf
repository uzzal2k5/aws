
output "vpn_security_group_id" {
  value = try(aws_security_group.vpn_access_sg[0].id, var.vpn_security_group_id)
}
output "vpn_endpoint_id" {
  value = aws_ec2_client_vpn_endpoint.client_vpn.id
}
output "vpn_client_cert" {
  value = tls_locally_signed_cert.vpn_client_signed_cert.cert_pem
}
output "vpn_client_key" {
  value = tls_private_key.vpn_client_private_key.private_key_pem
}
output "vpn_server_cert" {
  value = tls_locally_signed_cert.vpn_server_signed_cert.cert_pem
}
output "vpn_server_key" {
  value = tls_private_key.vpn_server_private_key.private_key_pem
}
output "vpn_ca_cert" {
  value = tls_self_signed_cert.ca.cert_pem
}
output "vpn_ca_key" {
  value = tls_private_key.ca.private_key_pem
}


################################################################################
# VPN Gateway
################################################################################
