terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket               = "adam-stegienko-s3"
    key                  = "terraform.tfstate"
    region               = "eu-central-1"
    workspace_key_prefix = "do_it_right/env:"
  }
}

provider "aws" {
  region = "eu-central-1"
} 