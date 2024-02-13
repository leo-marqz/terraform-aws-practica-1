
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

provider "aws" {
  # Configuration options
  alias = "virginia"
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}