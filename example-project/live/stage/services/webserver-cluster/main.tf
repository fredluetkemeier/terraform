terraform {
  required_providers {
    aws = {
      version = "~> 2.0"
    }
  }

  backend "s3" {
    profile        = "fred.luetkemeier"
    key            = "stage/services/webserver-cluster/terraform.tfstate"
    bucket         = "fredluetkemeier-terraform-up-and-running-state"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "fred.luetkemeier"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "fredluetkemeier-terraform-up-and-running-state"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_type        = "t2.micro"
  min_size             = 2
  max_size             = 2
  enable_autoscaling   = false
  enable_new_user_data = true
}
