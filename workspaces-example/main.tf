terraform {
  backend "s3" {
    profile = "fred.luetkemeier"

    bucket = "fredluetkemeier-terraform-up-and-running-state"
    key    = "workspaces-example/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "fred.luetkemeier"
}

resource "aws_instance" "example" {
  ami           = "ami-02e67f70dd7967c1f"
  instance_type = "t2.micro"
}
