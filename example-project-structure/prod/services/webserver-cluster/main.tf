backend "s3" {
  backend "s3" {
    profile        = "fred.luetkemeier"
    key            = "prod/services/webserver-cluster/terraform.tfstate"
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
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "fredluetkemeier-terraform-up-and-running-state"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"
}
