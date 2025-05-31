terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.99.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.7.0"
    }
  }
}

provider "aws" {
  region = var.aws_default_region
  default_tags {
    tags = var.aws_default_tags
  }
}