terraform {
  backend "s3" {
    bucket                  = "terraform-s3-us2"
    dynamodb_table          = "table"
    key                     = "my-terraform-project"
    region                  = "us-east-2"
    shared_credentials_file = "~/.aws/credentials"
  }
}


provider "aws" {
    region = "us-east-2"  
}

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 0.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 1.0"
    }
  }
}


resource "awscc_ecr_repository" "second-repo" {
  repository_name      = "any-app2"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration = {
    scan_on_push = true
  }
}
