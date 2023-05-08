#AWS Key Pair
provider "tls" {}
resource "tls_private_key" "tls" {
  algorithm = "RSA"
}

resource "aws_key_pair" "aws_access_auth" {
  key_name   = var.key_name
#  public_key = file("~/.ssh/"var.public_key)
  public_key = tls_private_key.tls.public_key_openssh
}

provider "local" {}
resource "local_file" "key" {
  content  = tls_private_key.tls.private_key_pem
  filename = var.private_key

}