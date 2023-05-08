terraform {
  backend "s3" {
    dynamodb_table = "terraform-locks"
    bucket         = module.global.thkee-tfstate-s3-bucket
    encrypt        = true
    key            = "thkee-terraform/thkee_vpc.tfstate"
    region         =  module.global.aws_region
  }

  required_version = ">= 0.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.8"
    }
  }
}

