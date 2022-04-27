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
}
