terraform {
  required_providers {
    aws = {
      version = "~> 2.0"
    }
  }

  backend "s3" {
    profile = "fred.luetkemeier"

    bucket = "fredluetkemeier-terraform-up-and-running-state"
    key    = "prod/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "fred.luetkemeier"
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"

  db_name     = "terraform-up-and-running-prod"
  db_password = var.db_password
}
