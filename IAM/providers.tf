provider "aws" {
  region                  = module.global.aws_region
  shared_credentials_file = "~/.aws/creds"
  profile                 = "default"
}