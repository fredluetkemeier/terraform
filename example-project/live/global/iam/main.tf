terraform {
  required_providers {
    aws = {
      version = "~> 2.0"
    }
  }

  backend "s3" {
    profile        = "fred.luetkemeier"
    key            = "live/global/iam/terraform.tfstate"
    bucket         = "fredluetkemeier-terraform-up-and-running-state"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  profile = "fred.luetkemeier"
  region  = "us-east-2"
}

# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }

# output "neo_arn" {
#   value       = aws_iam_user.example[0].arn
#   description = "The ARN for user Neo"
# }

# output "all_arns" {
#   value       = aws_iam_user.example[*].arn
#   description = "The ARNs for all users"
# }

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name     = each.value
}


