#provider "aws" {
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_key}"
#  region = "us-east-1"
#}

provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/creds"
  profile                 = "default"
}