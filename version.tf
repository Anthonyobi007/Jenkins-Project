terraform {
  backend "s3" {
    bucket         = "zigi-terraform-state"
    key            = "jenkins/jenkins.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}