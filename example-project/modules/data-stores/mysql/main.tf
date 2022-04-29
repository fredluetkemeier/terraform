terraform {
  required_providers {
    aws = {
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  profile = "fred.luetkemeier"
  region  = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix = var.db_name
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"

  skip_final_snapshot = true

  #   password = data.aws_secretsmanager_secret_version.db_password.secret_string
  password = var.db_password
}

# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = "mysql-master-password-stage"
# }
