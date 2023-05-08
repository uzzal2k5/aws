module "global" {
  source = "../modules/global_settings"
}



provider "aws" {
  profile=module.global.aws_profile
  region= module.global.aws_region
  shared_credentials_file = "~/.aws/creds"

}




